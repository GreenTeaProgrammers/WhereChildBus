package bus

import (
	"fmt"

	"github.com/google/uuid"
	"golang.org/x/exp/slog"

	"context"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/config"
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
		return nil, fmt.Errorf("failed to parse nursery ID: %w", err)
	}

	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}

	var commit bool
	defer func() {
		if !commit {
			tx.Rollback()
		}
	}()

	bus, err := tx.Bus.Create().
		SetNurseryID(nurseryID).
		SetName(req.Name).
		SetPlateNumber(req.PlateNumber).
		Save(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to create bus: %w", err)
	}

	// Nurseryエッジを持つBusを取得
	bus, err = tx.Bus.Query().
		Where(busRepo.IDEQ(bus.ID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to get bus: %w", err)
	}

	err = setNextStation(ctx, tx, req.MorningGuardianIds, func(updateOp *ent.StationUpdateOne, nextStation *ent.Station) *ent.StationUpdateOne {
		return updateOp.AddMorningNextStation(nextStation)
	})
	if err != nil {
		return nil, err // 朝のステーション設定中にエラーが発生しました
	}

	err = setNextStation(ctx, tx, req.EveningGuardianIds, func(updateOp *ent.StationUpdateOne, nextStation *ent.Station) *ent.StationUpdateOne {
		return updateOp.AddEveningNextStation(nextStation)
	})
	if err != nil {
		return nil, err // 夕方のステーション設定中にエラーが発生しました
	}
	// 以下のコードはリファクタリング後のメインの処理フローです。

	morningGuardianIDs, err := parseGuardianIDs(req.MorningGuardianIds)
	if err != nil {
		return nil, err // エラーハンドリングは簡潔に
	}

	eveningGuardianIDs, err := parseGuardianIDs(req.EveningGuardianIds)
	if err != nil {
		return nil, err // エラーハンドリングは簡潔に
	}

	// ステーションの取得処理は変更なし
	stations, err := tx.Station.Query().
		Where(stationRepo.HasGuardianWith(guardianRepo.IDIn(morningGuardianIDs...))).
		Where(stationRepo.HasGuardianWith(guardianRepo.IDIn(eveningGuardianIDs...))).
		All(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get stations: %w", err)
	}

	// 子供たちの処理を関数を用いて簡潔に
	morningChildren := tx.Child.Query().
		Where(childRepo.HasGuardianWith(guardianRepo.IDIn(morningGuardianIDs...))).AllX(ctx)
	if err := createChildBusAssociations(ctx, tx, morningChildren, bus, childbusassociationRepo.BusTypeMorning); err != nil {
		return nil, err
	}

	eveningChildren := tx.Child.Query().
		Where(childRepo.HasGuardianWith(guardianRepo.IDIn(eveningGuardianIDs...))).AllX(ctx)
	if err := createChildBusAssociations(ctx, tx, eveningChildren, bus, childbusassociationRepo.BusTypeEvening); err != nil {
		return nil, err
	}

	// ステーションの更新処理は変更なし
	for _, station := range stations {
		_, err = tx.Bus.UpdateOne(bus).
			AddStations(station).
			Save(ctx)
		if err != nil {
			return nil, fmt.Errorf("failed to update bus with stations: %w", err)
		}
	}

	//TODO: CloudFunctionにバスの作成を通知
	cfg, _ := config.New()
	utils.MakeCloudFunctionRequest(cfg.EndPointCreateBusNotification, "POST")

	// Make sure to commit the transaction since everything succeeded
	commit = true
	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}

	return &pb.CreateBusResponse{
		Bus: utils.ToPbBus(bus),
	}, nil
}

// parseGuardianIDs は、指定されたガーディアンIDの文字列のスライスをUUIDのスライスに変換します。
func parseGuardianIDs(ids []string) ([]uuid.UUID, error) {
	parsedIDs := make([]uuid.UUID, len(ids))
	for i, id := range ids {
		parsedID, err := uuid.Parse(id)
		if err != nil {
			return nil, fmt.Errorf("failed to parse guardian ID '%s': %w", id, err)
		}
		parsedIDs[i] = parsedID
	}
	return parsedIDs, nil
}

// createChildBusAssociations は、指定された子供たちに対してBusChildAssociationを作成します。
func createChildBusAssociations(ctx context.Context, tx *ent.Tx, children []*ent.Child, bus *ent.Bus, busType childbusassociationRepo.BusType) error {
	for _, child := range children {
		_, err := tx.ChildBusAssociation.Create().
			SetChild(child).
			SetBus(bus).
			SetBusType(busType).
			Save(ctx) // ctxを関数の引数から渡す
		if err != nil {
			return fmt.Errorf("failed to create bus child association: %w", err)
		}
	}
	return nil
}

func (i *Interactor) GetBusListByNurseryID(ctx context.Context, req *pb.GetBusListByNurseryIdRequest) (*pb.GetBusListByNurseryIdResponse, error) {
	nurseryID, err := uuid.Parse(req.NurseryId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse nursery ID '%s': %w", req.NurseryId, err)
	}

	buses, err := i.getBusList(ctx, func(tx *ent.Tx) (*ent.BusQuery, error) {
		return tx.Bus.Query().
			Where(busRepo.HasNurseryWith(nurseryRepo.IDEQ(nurseryID))).
			WithNursery(), nil
	})

	if err != nil {
		return nil, err
	}

	return &pb.GetBusListByNurseryIdResponse{Buses: buses}, nil
}

func (i *Interactor) ChangeBusStatus(ctx context.Context, req *pb.ChangeBusStatusRequest) (*pb.ChangeBusStatusResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse bus ID '%s': %w", req.BusId, err)
	}

	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}

	status, err := utils.ConvertPbStatusToEntStatus(req.Status)
	if err != nil {
		return nil, fmt.Errorf("failed to convert status: %w", err)
	}

	bus, err := tx.Bus.UpdateOneID(busID).
		SetStatus(*status).
		Save(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to update bus: %w", err)
	}

	// Nurseryエッジを持つBusを取得
	bus, err = tx.Bus.Query().
		Where(busRepo.IDEQ(bus.ID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to get bus: %w", err)
	}

	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}
	return &pb.ChangeBusStatusResponse{Bus: utils.ToPbBus(bus)}, nil
}

func (i *Interactor) getBusList(ctx context.Context, queryFunc func(*ent.Tx) (*ent.BusQuery, error)) ([]*pb.Bus, error) {
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	defer tx.Rollback()

	query, err := queryFunc(tx)
	if err != nil {
		return nil, fmt.Errorf("failed to create query: %w", err)
	}

	entBuses, err := query.All(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to execute query: %w", err)
	}

	pbBuses := make([]*pb.Bus, len(entBuses))
	for i, b := range entBuses {
		pbBuses[i] = utils.ToPbBus(b)
	}

	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}

	return pbBuses, nil
}

func setNextStation(ctx context.Context, tx *ent.Tx, guardianIDs []string, setNextStationFunc func(*ent.StationUpdateOne, *ent.Station) *ent.StationUpdateOne) error {
	for index, guardianID := range guardianIDs {
		guardianIDParsed, err := uuid.Parse(guardianID)
		if err != nil {
			return fmt.Errorf("failed to parse guardian ID '%s': %w", guardianID, err)
		}

		currentStation, err := tx.Station.Query().
			Where(stationRepo.HasGuardianWith(guardianRepo.IDEQ(guardianIDParsed))).
			Only(ctx)
		if err != nil {
			return fmt.Errorf("failed to find station for guardian ID '%s': %w", guardianID, err)
		}

		if index < len(guardianIDs)-1 {
			nextGuardianID := guardianIDs[index+1]
			nextGuardianIDParsed, err := uuid.Parse(nextGuardianID)
			if err != nil {
				return fmt.Errorf("failed to parse next guardian ID '%s': %w", nextGuardianID, err)
			}

			nextStation, err := tx.Station.Query().
				Where(stationRepo.HasGuardianWith(guardianRepo.IDEQ(nextGuardianIDParsed))).
				Only(ctx)
			if err != nil {
				return fmt.Errorf("failed to find next station for guardian ID '%s': %w", nextGuardianID, err)
			}

			err = setNextStationFunc(tx.Station.UpdateOne(currentStation), nextStation).Exec(ctx)
			if err != nil {
				return fmt.Errorf("failed to set next station for station ID '%s': %w", currentStation.ID, err)
			}
		}
	}
	return nil
}
