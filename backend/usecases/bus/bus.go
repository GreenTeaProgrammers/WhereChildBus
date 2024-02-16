package bus

import (
	"github.com/google/uuid"
	"golang.org/x/exp/slog"

	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	childRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	childbusassociationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
	guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	nurseryRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	stationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
)

type Interactor struct {
	entClient *ent.Client
	logger    *slog.Logger
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger) *Interactor {
	return &Interactor{entClient, logger}
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

	defer func() {
		tx.Rollback()
	}()

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
			i.logger.Error("failed to update bus with stations", "error", err)
			return nil, err
		}
	}

	//TODO: CloudFunctionにバスの作成を通知

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

func (i *Interactor) getBusList(ctx context.Context, queryFunc func(*ent.Tx) (*ent.BusQuery, error)) ([]*pb.Bus, error) {
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer tx.Rollback()

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
