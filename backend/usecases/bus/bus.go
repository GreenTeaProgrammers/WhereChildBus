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
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	nurseryRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
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
			Where(station.HasGuardianWith(guardian.IDEQ(guardianIDParsed))).
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
				Where(station.HasGuardianWith(guardian.IDEQ(nextGuardianIDParsed))).
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
