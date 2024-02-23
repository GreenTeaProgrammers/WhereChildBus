package bus

import (
	"errors"
	"fmt"
	"io"
	"sync"
	"time"

	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"
	"github.com/google/uuid"
	"golang.org/x/exp/slog"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	boardingrecordRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/boardingrecord"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	childRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	nurseryRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	stationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	mlv1 "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/machine_learning/v1"
)

type Interactor struct {
	entClient       *ent.Client
	logger          *slog.Logger
	MLServiceClient mlv1.MachineLearningServiceClient
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger, mlClient mlv1.MachineLearningServiceClient) *Interactor {
	return &Interactor{entClient, logger, mlClient}
}

func (i *Interactor) CreateBus(ctx context.Context, req *pb.CreateBusRequest) (*pb.CreateBusResponse, error) {
	nurseryID, err := uuid.Parse(req.NurseryId)
	if err != nil {
		i.logger.Error("failed to parse nursery ID", "error", err)
		return nil, err
	}

	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)
	if err != nil {
		i.logger.Error("failed to get evening first station", "error", err)
		return nil, err
	}
	bus, err := tx.Bus.Create().
		SetNurseryID(nurseryID).
		SetName(req.Name).
		SetPlateNumber(req.PlateNumber).
		Save(ctx)

	if err != nil {
		i.logger.Error("failed to create bus", "error", err)
		return nil, err
	}

	// TODO: もう少し簡潔に
	_, err = utils.CheckAndFixBusStationCoordinates(*i.logger, ctx, bus)
	if err != nil {
		i.logger.Error("failed to check and fix bus station coordinates", "error", err)
		return nil, err
	}

	// Nurseryエッジを持つBusを取得
	bus, err = tx.Bus.Query().
		Where(busRepo.IDEQ(bus.ID)).
		WithNursery().
		WithNextStation().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err
	}

	nextStationID, err := getStationIDs(i.logger, ctx, bus)

	if err != nil {
		i.logger.Error("failed to get station IDs", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return &pb.CreateBusResponse{
		Bus: utils.ToPbBus(bus, nextStationID),
	}, nil
}

func (i *Interactor) GetBusListByNurseryID(ctx context.Context, req *pb.GetBusListByNurseryIdRequest) (*pb.GetBusListByNurseryIdResponse, error) {
	nurseryID, err := uuid.Parse(req.NurseryId)
	if err != nil {
		i.logger.Error("failed to parse nursery ID", "error", err)
		return nil, err
	}

	buses, err := i.getBusList(ctx, func(tx *ent.Tx) (*ent.BusQuery, error) {
		return tx.Bus.Query().
			Where(busRepo.HasNurseryWith(nurseryRepo.IDEQ(nurseryID))).
			WithNextStation().
			WithNursery(), nil
	})

	if err != nil {
		i.logger.Error("failed to get bus list", "error", err)
		return nil, err
	}

	return &pb.GetBusListByNurseryIdResponse{Buses: buses}, nil
}

func (i *Interactor) GetRunningBusByGuardianID(ctx context.Context, req *pb.GetRunningBusByGuardianIdRequest) (*pb.GetRunningBusByGuardianIdResponse, error) {
	guardianID, err := uuid.Parse(req.GuardianId)
	if err != nil {
		i.logger.Error("failed to parse guardian ID", "error", err)
		return nil, err
	}

	bus, err := i.entClient.Bus.Query().
		Where(busRepo.HasNurseryWith(nurseryRepo.HasGuardiansWith(guardianRepo.ID(guardianID)))).
		Where(busRepo.StatusEQ(busRepo.StatusRunning)).
		WithNursery().
		WithNextStation().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus list", "error", err)
		return nil, err
	}

	nextStationID, err := getStationIDs(i.logger, ctx, bus)
	if err != nil {
		i.logger.Error("failed to get station IDs", "error", err)
		return nil, err
	}

	return &pb.GetRunningBusByGuardianIdResponse{Bus: utils.ToPbBus(bus, nextStationID)}, nil
}

func (i *Interactor) ChangeBusStatus(ctx context.Context, req *pb.ChangeBusStatusRequest) (*pb.ChangeBusStatusResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus ID", "error", err)
		return nil, err
	}

	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}

	status, err := utils.ConvertPbStatusToEntStatus(req.BusStatus)
	if err != nil {
		i.logger.Error("failed to convert status", "error", err)
		return nil, err
	}

	bus, err := tx.Bus.Query().Where(busRepo.IDEQ(busID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err

	}

	// TODO :後で関数化
	update := tx.Bus.UpdateOneID(busID)
	// バスを停止に変更する場合、次のステーションをクリア
	switch req.BusStatus {
	case pb.BusStatus_BUS_STATUS_STOPPED:
		update.ClearNextStation()
	case pb.BusStatus_BUS_STATUS_RUNNING:
		switch req.BusType {
		case pb.BusType_BUS_TYPE_MORNING:
			firstStation, err := i.getFirstStation(bus, pb.BusType_BUS_TYPE_MORNING)
			if err != nil {
				i.logger.Error("failed to get first station", "error", err)
				return nil, err
			}
			update.SetNextStation(firstStation)
		case pb.BusType_BUS_TYPE_EVENING:
			firstStation, err := i.getFirstStation(bus, pb.BusType_BUS_TYPE_MORNING)
			if err != nil {
				i.logger.Error("failed to get first station", "error", err)
				return nil, err
			}
			update.SetNextStation(firstStation)
		}
	}

	bus, err = update.SetStatus(*status).Save(ctx)

	if err != nil {
		i.logger.Error("failed to update bus", "error", err)
		return nil, err
	}

	// TODO: もう少し簡潔に
	is_ready, err := utils.CheckAndFixBusStationCoordinates(*i.logger, ctx, bus)
	if err != nil {
		i.logger.Error("failed to check and fix bus station coordinates", "error", err)
		return nil, err
	}

	if !is_ready {
		i.logger.Error("bus station coordinates are not ready")
		return nil, errors.New("bus station coordinates are not ready")
	}

	// Nurseryエッジを持つBusを取得
	bus, err = tx.Bus.Query().
		Where(busRepo.IDEQ(bus.ID)).
		WithNursery().
		WithNextStation().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err
	}

	nextStationID, err := getStationIDs(i.logger, ctx, bus)
	if err != nil {
		i.logger.Error("failed to get station IDs", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}
	return &pb.ChangeBusStatusResponse{Bus: utils.ToPbBus(bus, nextStationID)}, nil
}

func (i *Interactor) UpdateBus(ctx context.Context, req *pb.UpdateBusRequest) (*pb.UpdateBusResponse, error) {
	// bus_idのパース
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus ID", "error", err)
		return nil, err
	}

	// トランザクションの開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	// 更新処理のビルダー
	update := tx.Bus.Update().Where(busRepo.IDEQ(busID))
	for _, path := range req.UpdateMask.Paths {
		switch path {
		case "name":
			update.SetName(req.Name)
		case "plate_number":
			update.SetPlateNumber(req.PlateNumber)
		case "latitude":
			update.SetLatitude(req.Latitude)
		case "longitude":
			update.SetLongitude(req.Longitude)
		case "enable_face_recognition":
			update.SetEnableFaceRecognition(req.EnableFaceRecognition)
		case "next_station":
			nextStationID, err := uuid.Parse(req.NextStationId)
			if err != nil {
				i.logger.Error("failed to parse next station ID", "error", err)
				return nil, err
			}
			update.ClearNextStation()
			update.SetNextStationID(nextStationID)
		}
	}

	// 更新の実行
	_, err = update.Save(ctx)

	if err != nil {
		i.logger.Error("failed to update bus", "error", err)
		return nil, err
	}

	updatedBus, err := tx.Bus.Query().Where(busRepo.IDEQ(busID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to update bus", "error", err)
		return nil, err
	}

	// TODO: もう少し簡潔に
	_, err = utils.CheckAndFixBusStationCoordinates(*i.logger, ctx, updatedBus)
	if err != nil {
		i.logger.Error("failed to check and fix bus station coordinates", "error", err)
		return nil, err
	}

	// 更新されたバスを取得
	updatedBus, err = tx.Bus.Query().Where(busRepo.ID(busID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to retrieve updated bus", "error", err)
	}

	nextStationID, err := getStationIDs(i.logger, ctx, updatedBus)

	if err != nil {
		i.logger.Error("failed to get station IDs", "error", err)
		return nil, err
	}

	// トランザクションのコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	// レスポンスの生成と返却
	return &pb.UpdateBusResponse{
		Bus: utils.ToPbBus(updatedBus, nextStationID),
	}, nil
}

func (i *Interactor) SendLocationContinuous(stream pb.BusService_SendLocationContinuousServer) error {
	ctx := stream.Context()
	retryDelay := time.Second // リトライの間隔を1秒に設定
	maxRetries := 5           // 最大リトライ回数

	for {
		req, err := stream.Recv()
		if errors.Is(err, io.EOF) {
			// ストリームの終了
			return stream.SendAndClose(&pb.SendLocationContinuousResponse{})
		}

		if err != nil {
			i.logger.Error("failed to receive location", err)

			// 最大リトライ回数を超えるまでリトライ
			for retry := 0; retry < maxRetries; retry++ {
				time.Sleep(retryDelay) // リトライ間隔で待機

				req, err = stream.Recv() // 再度受信を試みる
				if err == nil {
					break // 成功したらリトライループを抜ける
				}
				if errors.Is(err, io.EOF) {
					// ストリームの終了
					return stream.SendAndClose(&pb.SendLocationContinuousResponse{})
				}
				i.logger.Error(fmt.Sprintf("retrying to receive location, attempt %d", retry+1), err)
			}

			// リトライ後もエラーが続く場合は、処理を中断
			if err != nil {
				i.logger.Error("failed to receive location after retries", err)
				return err
			}
		}

		busID, err := uuid.Parse(req.BusId)
		if err != nil {
			i.logger.Error("failed to parse bus ID", err)
			return err // バスIDの解析に失敗した場合は、次のリクエストの処理を試みる
		}

		// トランザクションを使用せずに直接更新
		_, err = i.entClient.Bus.UpdateOneID(busID).
			SetLatitude(req.Latitude).
			SetLongitude(req.Longitude).
			Save(ctx)

		if err != nil {
			i.logger.Error("failed to update bus location", err)
			return err
		}
	}
}

func (i *Interactor) TrackBusContinuous(req *pb.TrackBusContinuousRequest, stream pb.BusService_TrackBusContinuousServer) error {
	ctx := stream.Context()
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		return fmt.Errorf("failed to parse bus ID '%s': %w", req.BusId, err)
	}

	// 送信間隔の設定（例えば、5秒ごと）
	ticker := time.NewTicker(1 * time.Second)
	defer ticker.Stop()

	for {
		select {
		case <-ctx.Done(): // クライアントの切断またはその他のキャンセルシグナルを受信
			return ctx.Err()
		case <-ticker.C: // 定期的にデータを送信
			bus, err := i.entClient.Bus.Query().
				Where(busRepo.IDEQ(busID)).
				WithNursery().
				Only(ctx)
			if err != nil {
				return fmt.Errorf("failed to get bus: %w", err)
			}

			nextStation, err := bus.QueryNextStation().Only(ctx)
			if err != nil {
				return err
			}

			if err := stream.Send(&pb.TrackBusContinuousResponse{
				BusId:         req.BusId,
				Latitude:      bus.Latitude,
				Longitude:     bus.Longitude,
				NextStationId: nextStation.ID.String(),
			}); err != nil {
				return fmt.Errorf("failed to send bus: %w", err)
			}
			i.logger.Info("sent bus location", "bus_id", busID, "latitude", bus.Latitude, "longitude", bus.Longitude)
		}
	}
}

func (i *Interactor) StreamBusVideo(stream pb.BusService_StreamBusVideoServer) error {
	ctx := stream.Context() // ストリームのコンテキストを使用
	MLStream, err := i.MLServiceClient.Pred(ctx)
	if err != nil {
		return err
	}

	var busID string
	var vehicleEvent pb.VehicleEvent
	errChan := make(chan error, 1) // エラーチャネルを作成
	wg := sync.WaitGroup{}         // ゴルーチンの完了を待つためのWaitGroup

	// Go サーバーから受け取ったメッセージをPythonサーバーに転送
	wg.Add(1) // WaitGroupのカウンターをインクリメント
	go func() {
		defer wg.Done() // 関数終了時にカウンターをデクリメント
		for {
			in, err := stream.Recv()
			if err == io.EOF {
				// ストリームの終了
				break
			}
			if err != nil {
				errChan <- err // エラーチャネルにエラーを送信
				return
			}

			busID = in.BusId
			vehicleEvent = in.VehicleEvent

			if err := MLStream.Send(in); err != nil {
				errChan <- err // エラーチャネルにエラーを送信
				return
			}
		}
	}()

	for {
		select {
		case err := <-errChan: // エラーチャネルからのエラーを待機
			return err
		default:
			resp, err := MLStream.Recv()
			if err == io.EOF {
				// ストリームの終了
				wg.Wait() // ゴルーチンの完了を待つ
				return nil
			}
			if err != nil {
				return err
			}

			if !resp.IsDetected {
				continue
			}

			tx, err := i.entClient.Tx(ctx)
			if err != nil {
				return err
			}

			err = i.processDetectedChildren(tx, stream, resp, busID, vehicleEvent)
			if err != nil {
				utils.RollbackTx(tx, i.logger)
				return err
			}

			if err := tx.Commit(); err != nil {
				return err
			}
		}
	}
}

// processDetectedChildren は検出された子供たちを処理するためのヘルパー関数です。
func (i *Interactor) processDetectedChildren(tx *ent.Tx, stream pb.BusService_StreamBusVideoServer, resp *mlv1.PredResponse, busID string, vehicleEvent pb.VehicleEvent) error {
	var pbChildren []*pb.Child
	busUUID := uuid.MustParse(busID)
	for _, childId := range resp.ChildIds {
		childUUID := uuid.MustParse(childId)

		// 既存のレコードを検索
		exists, err := tx.BoardingRecord.Query().
			Where(boardingrecordRepo.HasChildWith(childRepo.IDEQ(childUUID))).
			Where(boardingrecordRepo.HasBusWith(busRepo.IDEQ(busUUID))).
			Exist(context.Background())
		if err != nil {
			return err
		}

		if !exists {
			_, err = tx.BoardingRecord.Create().
				SetChildID(childUUID).
				SetBusID(busUUID).
				SetIsBoarding(false).
				SetTimestamp(time.Now()).
				Save(context.Background())
			if err != nil {
				return err
			}
		}

		boardingrecord, err := tx.BoardingRecord.Query().
			Where(boardingrecordRepo.HasChildWith(childRepo.IDEQ(childUUID))).
			Where(boardingrecordRepo.HasBusWith(busRepo.IDEQ(busUUID))).
			Only(context.Background())
		if err != nil {
			return err
		}

		// 乗車または降車の処理
		switch vehicleEvent {
		case pb.VehicleEvent_VEHICLE_EVENT_GET_ON:
			if boardingrecord.IsBoarding {
				continue
			}
			_, err = tx.BoardingRecord.UpdateOneID(boardingrecord.ID).
				SetIsBoarding(true).
				SetTimestamp(time.Now()).
				Save(context.Background())
		case pb.VehicleEvent_VEHICLE_EVENT_GET_OFF:
			if !boardingrecord.IsBoarding {
				continue
			}
			_, err = tx.BoardingRecord.UpdateOneID(boardingrecord.ID).
				SetIsBoarding(false).
				SetTimestamp(time.Now()).
				Save(context.Background())
		default:
			return fmt.Errorf("invalid vehicle event: %v", vehicleEvent)
		}
		if err != nil {
			return err
		}

		// 子供の情報を取得してレスポンスに追加
		child, err := tx.Child.Query().
			Where(childRepo.IDEQ(childUUID)).
			WithGuardian().
			Only(context.Background())
		if err != nil {
			return err
		}
		pbChildren = append(pbChildren, utils.ToPbChild(child))
	}

	// 元のクライアントにレスポンスを返す
	err := stream.SendMsg(&pb.StreamBusVideoResponse{
		IsDetected: resp.IsDetected,
		Children:   pbChildren,
	})
	if err != nil {
		return err
	}

	return nil
}

func (i *Interactor) getBusList(ctx context.Context, queryFunc func(*ent.Tx) (*ent.BusQuery, error)) ([]*pb.Bus, error) {
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	query, err := queryFunc(tx)
	if err != nil {
		i.logger.Error("failed to create query", "error", err)
		return nil, err
	}

	entBuses, err := query.All(ctx)
	if err != nil {
		i.logger.Error("failed to execute query", "error", err)
		return nil, err
	}

	// TODO: もう少し簡潔に書ける
	for _, bus := range entBuses {
		_, err = utils.CheckAndFixBusStationCoordinates(*i.logger, ctx, bus)
		if err != nil {
			i.logger.Error("failed to check and fix bus station coordinates", "error", err)
			return nil, err
		}
	}

	entBuses, err = query.All(ctx)
	if err != nil {
		i.logger.Error("failed to execute query", "error", err)
		return nil, err
	}

	pbBuses := make([]*pb.Bus, len(entBuses))
	for index, b := range entBuses {
		nextStationID, err := getStationIDs(i.logger, ctx, b)
		if err != nil {
			i.logger.Error("failed to get station IDs", "error", err)
			return nil, err
		}
		pbBuses[index] = utils.ToPbBus(b, nextStationID)
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return pbBuses, nil
}

func getStationIDs(logger *slog.Logger, ctx context.Context, bus *ent.Bus) (nextStationId string, err error) {
	nextStation, err := bus.QueryNextStation().Only(ctx)
	if err != nil && !ent.IsNotFound(err) {
		logger.Error("failed to query next station", "error", err)
		return "", err
	}
	if nextStation != nil {
		nextStationId = nextStation.ID.String()
	}

	return nextStationId, nil
}

func (i *Interactor) getFirstStation(bus *ent.Bus, busType pb.BusType) (*ent.Station, error) {
	var firstStation *ent.Station
	var busRoute *ent.BusRoute
	var err error

	if busType == pb.BusType_BUS_TYPE_MORNING {
		busRoute, err = bus.QueryLatestMorningRoute().Only(context.Background())
	} else if busType == pb.BusType_BUS_TYPE_EVENING {
		busRoute, err = bus.QueryLatestEveningRoute().Only(context.Background())
	} else {
		return nil, fmt.Errorf("invalid bus type")
	}

	if err != nil {
		i.logger.Error("failed to get bus route", "error", err)
		return nil, err
	}

	stations, err := busRoute.
		QueryBusRouteAssociations().
		QueryStation().
		All(context.Background())
	if err != nil {
		i.logger.Error("failed to get stations", "error", err)
		return nil, err
	}

	for _, station := range stations {
		guardian, err := station.QueryGuardian().
			Where(guardianRepo.HasStationWith(stationRepo.ID(station.ID))).
			Only(context.Background())
		if err != nil {
			i.logger.Error("failed to get guardian", "error", err)
			return nil, err
		}
		if busType == pb.BusType_BUS_TYPE_MORNING {
			if !guardian.IsUseMorningBus {
				continue
			}
		} else if busType == pb.BusType_BUS_TYPE_EVENING {
			if !guardian.IsUseEveningBus {
				continue
			}
		}
		firstStation = station
		break
	}

	if firstStation == nil {
		return nil, fmt.Errorf("no station found")
	}

	return firstStation, nil
}
