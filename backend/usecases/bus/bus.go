package bus

import (
	"errors"
	"fmt"
	"io"
	"log"
	"time"

	"github.com/google/uuid"
	"golang.org/x/exp/slog"
	"google.golang.org/protobuf/types/known/timestamppb"

	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"

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
	bus, err := tx.Bus.Create().
		SetNurseryID(nurseryID).
		SetName(req.Name).
		SetPlateNumber(req.PlateNumber).
		Save(ctx)

	if err != nil {
		i.logger.Error("failed to create bus", "error", err)
		return nil, err
	}

	// Nurseryエッジを持つBusを取得
	bus, err = tx.Bus.Query().
		Where(busRepo.IDEQ(bus.ID)).
		WithNursery().
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
			return nil, fmt.Errorf("failed to update bus with stations: %w", err)
		}
	}

	morningChildIds := make([]string, len(morningChildren))
	for i, child := range morningChildren {
		morningChildIds[i] = child.ID.String()
	}

	//TODO: MLgRPCにバスの作成を通知
	// _, err = i.MLServiceClient.Train(ctx, &mlv1.TrainRequest{
	// 	BusId:    bus.ID.String(),
	// 	BusType:  mlv1.BusType_BUS_TYPE_MORNING,
	// 	ChildIds: morningChildIds,
	// })

	// if err != nil {
	// 	i.logger.Error("failed to train ML model", err)
	// 	return nil, err
	// }

	// eveningChildIds := make([]string, len(eveningChildren))
	// for i, child := range eveningChildren {
	// 	eveningChildIds[i] = child.ID.String()
	// }

	// _, err = i.MLServiceClient.Train(ctx, &mlv1.TrainRequest{
	// 	BusId:    bus.ID.String(),
	// 	BusType:  mlv1.BusType_BUS_TYPE_EVENING,
	// 	ChildIds: eveningChildIds,
	// })

	// if err != nil {
	// 	i.logger.Error("failed to train ML model", err)
	// 	return nil, err
	// }

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return &pb.CreateBusResponse{
		Bus: utils.ToPbBus(bus),
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
			WithNursery(), nil
	})

	if err != nil {
		i.logger.Error("failed to get bus list", "error", err)
		return nil, err
	}

	return &pb.GetBusListByNurseryIdResponse{Buses: buses}, nil
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

	status, err := utils.ConvertPbStatusToEntStatus(req.Status)
	if err != nil {
		i.logger.Error("failed to convert status", "error", err)
		return nil, err
	}

	bus, err := tx.Bus.UpdateOneID(busID).
		SetStatus(*status).
		Save(ctx)

	if err != nil {
		i.logger.Error("failed to update bus", "error", err)
		return nil, err
	}

	// Nurseryエッジを持つBusを取得
	bus, err = tx.Bus.Query().
		Where(busRepo.IDEQ(bus.ID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}
	return &pb.ChangeBusStatusResponse{Bus: utils.ToPbBus(bus)}, nil
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
			Only(context.Background())

		if err != nil {
			return fmt.Errorf("failed to get bus: %w", err)
		}

		if err := stream.Send(&pb.TrackBusContinuousResponse{
			BusId:     req.BusId,
			Latitude:  bus.Latitude,
			Longitude: bus.Longitude,
			Timestamp: &timestamppb.Timestamp{Seconds: time.Now().Unix()},
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
	var videoType pb.VideoType

	// Go サーバーから受け取ったメッセージをPythonサーバーに転送
	for {
		in, err := stream.Recv()
		if err == io.EOF {
			// ストリームの終了
			break
		}
		if err != nil {
			return err
		}

		// バスID、バスタイプ、ビデオタイプを保持
		busID = in.BusId
		videoType = in.VideoType

		// Python サーバーへ送信
		err = MLStream.Send(&pb.StreamBusVideoRequest{
			BusId:      in.BusId,
			BusType:    in.BusType,
			VideoType:  in.VideoType,
			VideoChunk: in.VideoChunk,
			Timestamp:  in.Timestamp,
		})
		if err != nil {
			return err
		}
	}

	// Python サーバーからのレスポンスを待つ
	for {
		resp, err := MLStream.Recv()
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

		var pbChildren []*pb.Child
		busUUID := uuid.MustParse(busID)
		for _, childId := range resp.ChildIds {
			childUUID := uuid.MustParse(childId)
			// まず既存のレコードを検索
			exists, err := i.entClient.BoardingRecord.Query().
				Where(boardingrecordRepo.HasChildWith(childRepo.IDEQ(uuid.MustParse(childId)))).
				Where(boardingrecordRepo.HasBusWith(busRepo.IDEQ(uuid.MustParse(busID)))).
				Exist(context.Background())

			if err != nil {
				// エラーハンドリング
				log.Printf("Failed to query existing boarding record: %v", err)
				return err
			}

			// 既存のレコードがない場合にのみ新しいレコードを作成
			if !exists {
				_, err = i.entClient.BoardingRecord.Create().
					SetChildID(childUUID).
					SetBusID(busUUID).
					SetTimestamp(time.Now()).
					Save(context.Background())
				if err != nil {
					// レコード作成時のエラーハンドリング
					i.logger.Error("Failed to create new boarding record: %v", err)
					return err
				}
				// レコード作成成功
			}

			switch videoType {
			case pb.VideoType_VIDEO_TYPE_GET_ON:
				// 乗車時の検出の場合
				_, err = i.entClient.BoardingRecord.Update().
					Where(boardingrecordRepo.HasChildWith(childRepo.IDEQ(childUUID))). // 乗車レコードを更新
					Where(boardingrecordRepo.HasBusWith(busRepo.IDEQ(busUUID))).       // 乗車レコードを更新
					SetIsBoarding(true).                                               // 乗車フラグを立てる
					SetTimestamp(time.Now()).                                          // 乗車時刻を記録
					Save(context.Background())
			case pb.VideoType_VIDEO_TYPE_GET_OFF:
				// 降車時の検出の場合
				_, err = i.entClient.BoardingRecord.Update().
					Where(boardingrecordRepo.HasChildWith(childRepo.IDEQ(childUUID))). // 降車レコードを更新
					Where(boardingrecordRepo.HasBusWith(busRepo.IDEQ(busUUID))).       // 降車レコードを更新
					SetIsBoarding(false).                                              // 降車フラグを立てる
					SetTimestamp(time.Now()).                                          // 降車時刻を記録
					Save(context.Background())
			default:
				return fmt.Errorf("invalid video type: %v", videoType)
			}

			if err != nil {
				// レコード更新時のエラーハンドリング
				i.logger.Error("Failed to update boarding record: %v", err)
				return err
			}
			// レコード更新成功

			child, err := i.entClient.Child.Query().
				Where(childRepo.IDEQ(childUUID)).
				WithGuardian().
				All(context.Background())
			if err != nil {
				i.logger.Error("Failed to get child: %v", err)
				return err
			}
			pbChildren = append(pbChildren, utils.ToPbChild(child[0]))
		}
		// 元のクライアントにレスポンスを返す
		err = stream.SendMsg(&pb.StreamBusVideoResponse{
			IsDetected: resp.IsDetected,
			Children:   pbChildren, // ChildIDsをChildrenオブジェクトに変換する必要がある
		})
		if err != nil {
			return err
		}
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

	pbBuses := make([]*pb.Bus, len(entBuses))
	for i, b := range entBuses {
		pbBuses[i] = utils.ToPbBus(b)
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
