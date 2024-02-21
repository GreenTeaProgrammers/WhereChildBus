package bus

import (
	"errors"
	"fmt"
	"io"
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
	childbusassociationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
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

	morningFirstStation, err := tx.Station.Query().
		Where(stationRepo.HasGuardianWith(guardianRepo.ID(uuid.MustParse(req.MorningGuardianIds[0])))).
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get morning first station", "error", err)
		return nil, err
	}

	eveningFirstStation, err := tx.Station.Query().
		Where(stationRepo.HasGuardianWith(guardianRepo.ID(uuid.MustParse(req.EveningGuardianIds[0])))).
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get evening first station", "error", err)
		return nil, err
	}
	bus, err := tx.Bus.Create().
		SetNurseryID(nurseryID).
		SetName(req.Name).
		SetPlateNumber(req.PlateNumber).
		SetMorningFirstStation(morningFirstStation).
		SetEveningFirstStation(eveningFirstStation).
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
		WithMorningFirstStation().
		WithEveningFirstStation().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err
	}

	err = setNextStation(*i.logger, ctx, tx, req.MorningGuardianIds, func(updateOp *ent.StationUpdateOne, nextStation *ent.Station) *ent.StationUpdateOne {
		return updateOp.AddMorningNextStation(nextStation)
	})
	if err != nil {
		return nil, err // 朝のステーション設定中にエラーが発生しました
	}

	err = setNextStation(*i.logger, ctx, tx, req.EveningGuardianIds, func(updateOp *ent.StationUpdateOne, nextStation *ent.Station) *ent.StationUpdateOne {
		return updateOp.AddEveningNextStation(nextStation)
	})
	if err != nil {
		return nil, err // 夕方のステーション設定中にエラーが発生しました
	}
	// 以下のコードはリファクタリング後のメインの処理フローです。

	morningGuardianIDs, err := parseGuardianIDs(*i.logger, req.MorningGuardianIds)
	if err != nil {
		return nil, err // エラーハンドリングは簡潔に
	}

	eveningGuardianIDs, err := parseGuardianIDs(*i.logger, req.EveningGuardianIds)
	if err != nil {
		return nil, err // エラーハンドリングは簡潔に
	}

	// ステーションの取得処理は変更なし
	stations, err := tx.Station.Query().
		Where(stationRepo.HasGuardianWith(guardianRepo.IDIn(morningGuardianIDs...))).
		Where(stationRepo.HasGuardianWith(guardianRepo.IDIn(eveningGuardianIDs...))).
		All(ctx)
	if err != nil {
		i.logger.Error("failed to get stations", "error", err)
		return nil, err
	}

	// 子供たちの処理を関数を用いて簡潔に
	morningChildren := tx.Child.Query().
		Where(childRepo.HasGuardianWith(guardianRepo.IDIn(morningGuardianIDs...))).AllX(ctx)
	if err := createChildBusAssociations(*i.logger, ctx, tx, morningChildren, bus, childbusassociationRepo.BusTypeMorning); err != nil {
		return nil, err
	}

	eveningChildren := tx.Child.Query().
		Where(childRepo.HasGuardianWith(guardianRepo.IDIn(eveningGuardianIDs...))).AllX(ctx)
	if err := createChildBusAssociations(*i.logger, ctx, tx, eveningChildren, bus, childbusassociationRepo.BusTypeEvening); err != nil {
		return nil, err
	}

	// ステーションの更新処理は変更なし
	for _, station := range stations {
		_, err = tx.Bus.UpdateOne(bus).
			AddStations(station).
			Save(ctx)
		if err != nil {
			i.logger.Error("failed to update bus with stations", err)
			return nil, err
		}
	}

	morningChildIds := make([]string, len(morningChildren))
	for i, child := range morningChildren {
		morningChildIds[i] = child.ID.String()
	}

	resp, err := i.MLServiceClient.Train(ctx, &mlv1.TrainRequest{
		BusId:    bus.ID.String(),
		BusType:  pb.BusType_BUS_TYPE_MORNING,
		ChildIds: morningChildIds,
	})

	if err != nil || !resp.IsStarted {
		i.logger.Error("failed to train ML model", err)
		return nil, err
	}

	eveningChildIds := make([]string, len(eveningChildren))
	for i, child := range eveningChildren {
		eveningChildIds[i] = child.ID.String()
	}

	resp, err = i.MLServiceClient.Train(ctx, &mlv1.TrainRequest{
		BusId:    bus.ID.String(),
		BusType:  pb.BusType_BUS_TYPE_EVENING,
		ChildIds: eveningChildIds,
	})

	if err != nil || !resp.IsStarted {
		i.logger.Error("failed to train ML model", err)
		return nil, err
	}

	nextStationID, morningFirstStationID, eveningFirstStaionID, err := getStationIDs(i.logger, ctx, bus)
	if err != nil {
		i.logger.Error("failed to get station IDs", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return &pb.CreateBusResponse{
		Bus: utils.ToPbBus(bus, nextStationID, morningFirstStationID, eveningFirstStaionID),
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
			WithMorningFirstStation().
			WithEveningFirstStation().
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
		WithMorningFirstStation().
		WithEveningFirstStation().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus list", "error", err)
		return nil, err
	}

	nextStationID, morningFirstStationID, eveningFirstStaionID, err := getStationIDs(i.logger, ctx, bus)
	if err != nil {
		i.logger.Error("failed to get station IDs", "error", err)
		return nil, err
	}

	return &pb.GetRunningBusByGuardianIdResponse{Bus: utils.ToPbBus(bus, nextStationID, morningFirstStationID, eveningFirstStaionID)}, nil
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
		WithMorningFirstStation().
		WithEveningFirstStation().
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err

	}

	update := tx.Bus.UpdateOneID(busID)
	// バスを停止に変更する場合、次のステーションをクリア
	switch req.BusStatus {
	case pb.BusStatus_BUS_STATUS_STOPPED:
		update.ClearNextStation()
	case pb.BusStatus_BUS_STATUS_RUNNING:
		switch req.BusType {
		case pb.BusType_BUS_TYPE_MORNING:
			update.SetNextStation(bus.Edges.MorningFirstStation)
		case pb.BusType_BUS_TYPE_EVENING:
			update.SetNextStation(bus.Edges.EveningFirstStation)
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
	bus, err = i.entClient.Bus.Query().
		Where(busRepo.IDEQ(bus.ID)).
		WithNursery().
		WithNextStation().
		WithMorningFirstStation().
		WithEveningFirstStation().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err
	}

	nextStationID, morningFirstStationID, eveningFirstStaionID, err := getStationIDs(i.logger, ctx, bus)
	if err != nil {
		i.logger.Error("failed to get station IDs", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}
	return &pb.ChangeBusStatusResponse{Bus: utils.ToPbBus(bus, nextStationID, morningFirstStationID, eveningFirstStaionID)}, nil
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
		WithNextStation().
		WithMorningFirstStation().
		WithEveningFirstStation().
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
		WithNextStation().
		WithMorningFirstStation().
		WithEveningFirstStation().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to retrieve updated bus", "error", err)
	}

	nextStationID, morningFirstStationID, eveningFirstStaionID, err := getStationIDs(i.logger, ctx, updatedBus)

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
		Bus: utils.ToPbBus(updatedBus, nextStationID, morningFirstStationID, eveningFirstStaionID),
	}, nil
}

func (i *Interactor) SendLocationContinuous(stream pb.BusService_SendLocationContinuousServer) error {
	for {
		req, err := stream.Recv()
		if errors.Is(err, io.EOF) {
			// ストリームの終了
			return stream.SendAndClose(&pb.SendLocationContinuousResponse{})
		}
		if err != nil {
			i.logger.Error("failed to receive location", err)
			// 一時的なエラーの場合は、エラーをログに記録し、処理を続行する
			continue
		}

		busID, err := uuid.Parse(req.BusId)
		if err != nil {
			i.logger.Error("failed to parse bus ID", err)
			// バスIDの解析に失敗した場合は、エラーをログに記録し、処理を続行する
			continue
		}

		// トランザクションを使用せずに直接更新
		_, err = i.entClient.Bus.UpdateOneID(busID).
			SetLatitude(req.Latitude).
			SetLongitude(req.Longitude).
			Save(context.Background())

		if err != nil {
			i.logger.Error("failed to update bus location", err)
			// 更新に失敗した場合は、エラーをログに記録し、処理を続行する
			continue
		}
	}
}

func (i *Interactor) TrackBusContinuous(req *pb.TrackBusContinuousRequest, stream pb.BusService_TrackBusContinuousServer) error {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		return fmt.Errorf("failed to parse bus ID '%s': %w", req.BusId, err)
	}

	for {
		bus, err := i.entClient.Bus.Query().
			Where(busRepo.IDEQ(busID)).
			WithNursery().
			WithNextStation().
			WithMorningFirstStation().
			WithEveningFirstStation().
			Only(context.Background())

		if err != nil {
			return fmt.Errorf("failed to get bus: %w", err)
		}

		if err := stream.Send(&pb.TrackBusContinuousResponse{
			BusId:         req.BusId,
			Latitude:      bus.Latitude,
			Longitude:     bus.Longitude,
			NextStationId: bus.Edges.NextStation.ID.String(),
		}); err != nil {
			return fmt.Errorf("failed to send bus: %w", err)
		}
	}
}

func (i *Interactor) StreamBusVideo(stream pb.BusService_StreamBusVideoServer) error {
	MLStream, err := i.MLServiceClient.Pred(context.Background())
	if err != nil {
		return err
	}

	var busID string
	var vehicleEvent pb.VehicleEvent

	// Go サーバーから受け取ったメッセージをPythonサーバーに転送
	go func() {
		for {
			in, err := stream.Recv()
			if err == io.EOF {
				// ストリームの終了
				break
			}
			if err != nil {
				return
			}

			// バスID、バスタイプ、ビデオタイプを保持
			busID = in.BusId
			vehicleEvent = in.VehicleEvent

			// Python サーバーへそのまま転送
			err = MLStream.Send(in)
			if err != nil {
				return
			}
		}
	}()

	// Python サーバーからのレスポンスを待つ
	for {
		resp, err := MLStream.Recv()
		i.logger.Info("received from ML server")
		if err == io.EOF {
			// ストリームの終了
			break
		}
		if err != nil {
			return err
		}

		if !resp.IsDetected {
			// 検出されなかった場合は、次のループに進む
			continue
		}

		// トランザクションの開始
		tx, err := i.entClient.Tx(context.Background())
		if err != nil {
			return err
		}

		// トランザクション内での操作
		err = i.processDetectedChildren(tx, stream, resp, busID, vehicleEvent) // stream 引数を追加
		if err != nil {
			utils.RollbackTx(tx, i.logger)
			return err
		}

		// トランザクションのコミット
		if err := tx.Commit(); err != nil {
			return err
		}
	}

	return nil
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
		nextStationID, morningFirstStationID, eveningFirstStaionID, err := getStationIDs(i.logger, ctx, b) // !なんか違う気がする
		if err != nil {
			i.logger.Error("failed to get station IDs", "error", err)
			return nil, err
		}
		pbBuses[index] = utils.ToPbBus(b, nextStationID, morningFirstStationID, eveningFirstStaionID)
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return pbBuses, nil
}

// parseGuardianIDs は、指定されたガーディアンIDの文字列のスライスをUUIDのスライスに変換します。
func parseGuardianIDs(logger slog.Logger, ids []string) ([]uuid.UUID, error) {
	parsedIDs := make([]uuid.UUID, len(ids))
	for i, id := range ids {
		parsedID, err := uuid.Parse(id)
		if err != nil {
			logger.Error("failed to parse guardian ID", "error", err)
			return nil, err
		}
		parsedIDs[i] = parsedID
	}
	return parsedIDs, nil
}

// createChildBusAssociations は、指定された子供たちに対してBusChildAssociationを作成します。
func createChildBusAssociations(logger slog.Logger, ctx context.Context, tx *ent.Tx, children []*ent.Child, bus *ent.Bus, busType childbusassociationRepo.BusType) error {
	for _, child := range children {
		_, err := tx.ChildBusAssociation.Create().
			SetChild(child).
			SetBus(bus).
			SetBusType(busType).
			Save(ctx) // ctxを関数の引数から渡す
		if err != nil {
			logger.Error("failed to create bus child association", "error", err)
			return err
		}
	}
	return nil
}

func setNextStation(logger slog.Logger, ctx context.Context, tx *ent.Tx, guardianIDs []string, setNextStationFunc func(*ent.StationUpdateOne, *ent.Station) *ent.StationUpdateOne) error {
	for index, guardianID := range guardianIDs {
		guardianIDParsed, err := uuid.Parse(guardianID)
		if err != nil {
			logger.Error("failed to parse guardian ID", "error", err)
			return err
		}

		currentStation, err := tx.Station.Query().
			Where(stationRepo.HasGuardianWith(guardianRepo.IDEQ(guardianIDParsed))).
			Only(ctx)
		if err != nil {
			logger.Error("failed to find station for guardian ID", "error", err)
			return err
		}

		if index < len(guardianIDs)-1 {
			nextGuardianID := guardianIDs[index+1]
			nextGuardianIDParsed, err := uuid.Parse(nextGuardianID)
			if err != nil {
				logger.Error("failed to parse next guardian ID", "error", err)
				return err
			}

			nextStation, err := tx.Station.Query().
				Where(stationRepo.HasGuardianWith(guardianRepo.IDEQ(nextGuardianIDParsed))).
				Only(ctx)
			if err != nil {
				logger.Error("failed to find next station for guardian ID", "error", err)
				return err
			}

			err = setNextStationFunc(tx.Station.UpdateOne(currentStation), nextStation).Exec(ctx)
			if err != nil {
				logger.Error("failed to set next station for station ID", "error", err)
				return err
			}
		}
	}
	return nil
}

func getStationIDs(logger *slog.Logger, ctx context.Context, bus *ent.Bus) (nextStationId, morningFirstStationId, eveningFirstStationId string, err error) {
	nextStation, err := bus.QueryNextStation().Only(ctx)
	if err != nil && !ent.IsNotFound(err) {
		logger.Error("failed to query next station", "error", err)
		return "", "", "", err
	}
	if nextStation != nil {
		nextStationId = nextStation.ID.String()
	}

	morningFirstStation, err := bus.QueryMorningFirstStation().Only(ctx)
	if err != nil && !ent.IsNotFound(err) {
		logger.Error("failed to query morning first station", "error", err)
		return "", "", "", err
	}

	if morningFirstStation != nil {
		morningFirstStationId = morningFirstStation.ID.String()
	}

	eveningFirstStation, err := bus.QueryEveningFirstStation().Only(ctx)
	if err != nil && !ent.IsNotFound(err) {
		logger.Error("failed to query evening first station", "error", err)
		return "", "", "", err
	}

	if eveningFirstStation != nil {
		eveningFirstStationId = eveningFirstStation.ID.String()
	}

	return nextStationId, morningFirstStationId, eveningFirstStationId, nil
}
