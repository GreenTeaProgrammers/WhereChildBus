package busroute

import (
	"context"
	"io"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	busRouteRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	childRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	stationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	mlv1 "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/machine_learning/v1"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"
	"github.com/google/uuid"
	"golang.org/x/exp/slog"
)

type Interactor struct {
	entClient       *ent.Client
	logger          *slog.Logger
	MLServiceClient mlv1.MachineLearningServiceClient
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger, mlClient mlv1.MachineLearningServiceClient) *Interactor {
	return &Interactor{entClient, logger, mlClient}
}

func (i *Interactor) CreateBusRoute(ctx context.Context, req *pb.CreateBusRouteRequest) (*pb.CreateBusRouteResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus id", "error", err)
		return nil, err
	}
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	busType, err := utils.ConvertPbBusTypeToEntBusType(req.BusType)
	if err != nil {
		i.logger.Error("failed to convert bus type", "error", err)
		return nil, err
	}

	// busを取得
	bus, err := tx.Bus.Query().Where(busRepo.ID(busID)).Only(ctx)
	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err
	}

	busRoute, err := tx.BusRoute.Create().
		SetBusType(*busType).
		AddBus(bus).
		Save(ctx)

	if err != nil {
		i.logger.Error("failed to create bus route", "error", err)
		return nil, err
	}

	if *busType == busRouteRepo.BusTypeMorning {
		_, err := tx.Bus.UpdateOneID(busID).
			ClearLatestMorningRoute().
			SetLatestMorningRoute(busRoute).
			Save(ctx)
		if err != nil {
			i.logger.Error("failed to update bus", "error", err)
			return nil, err
		}
	} else if *busType == busRouteRepo.BusTypeEvening {
		_, err := tx.Bus.UpdateOneID(busID).
			ClearLatestEveningRoute().
			SetLatestEveningRoute(busRoute).
			Save(ctx)
		if err != nil {
			i.logger.Error("failed to update bus", "error", err)
			return nil, err
		}
	}

	pbChildren, err := i.createAssociation(ctx, tx, req.GuardianIds, busRoute)
	if err != nil {
		return nil, err
	}

	ChildIds := make([]string, len(pbChildren))
	for index := range pbChildren {
		childCopy := &pb.Child{
			Id: pbChildren[index].Id,
		}
		ChildIds[index] = childCopy.Id
	}

	// バックグラウンドでストリーミングを継続するためのゴルーチン
	go func() {
		// MLトレーニングのための新しいコンテクストを作成します。これは、元のリクエストのコンテクストとは独立しています。
		trainCtx, cancel := context.WithCancel(context.Background())
		defer cancel() // ストリームが完了またはエラーに遭遇したらコンテクストをキャンセル

		stream, err := i.MLServiceClient.Train(trainCtx, &mlv1.TrainRequest{
			BusId:     req.BusId,
			ChildIds:  ChildIds,
			NurseryId: req.NurseryId,
			BusType:   req.BusType,
		})
		if err != nil {
			i.logger.Error("failed to transport to train server", "error", err)
			return
		}

		// 最初のレスポンスを待つ
		response, err := stream.Recv()
		if err != nil {
			i.logger.Error("error receiving from stream", "error", err)
			return
		}

		if response.Status == mlv1.Status_STATUS_FAILED {
			i.logger.Error("training was not started", "error", err)
			return
		}

		i.logger.Info("Training started")
		for {
			i.logger.Info("stream still connected")
			_, err := stream.Recv()
			if err == io.EOF {
				// ストリームの終了
				i.logger.Info("Training stream ended")
				break
			}
			if err != nil {
				i.logger.Error("error receiving from stream", "error", err)
				// エラーが発生した場合でも適切にリソースを解放します。
				return
			}
		}
		i.logger.Info("Training stream completed")
	}()

	pbBusRoute, err := i.CreateBusRouteResponse(ctx, tx, busRoute)
	if err != nil {
		i.logger.Error("failed to create bus route response", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	if err != nil {
		i.logger.Error("failed to create bus route response", "error", err)
		return nil, err
	}
	return &pb.CreateBusRouteResponse{BusRoute: pbBusRoute}, nil
}
func (i *Interactor) createAssociation(ctx context.Context, tx *ent.Tx, guardianIdList []string, busRoute *ent.BusRoute) ([]*pb.Child, error) {
	var pbChildren []*pb.Child
	for index, guardianId := range guardianIdList {
		guardianId, err := uuid.Parse(guardianId)
		if err != nil {
			i.logger.Error("failed to parse guardian id", "error", err)
			return nil, err
		}

		station, err := tx.Station.Query().
			Where(stationRepo.HasGuardianWith(guardian.ID(guardianId))).
			Only(ctx)

		if err != nil {
			i.logger.Error("failed to get station", "error", err)
			return nil, err
		}

		_, err = tx.BusRouteAssociation.Create().
			SetBusRoute(busRoute).
			SetStation(station).
			SetOrder(int32(index)).
			Save(ctx)
		if err != nil {
			i.logger.Error("failed to update guardian", "error", err)
			return nil, err
		}

		children, err := tx.Child.Query().
			Where(childRepo.HasGuardianWith(guardian.ID(guardianId))).
			WithGuardian().
			All(ctx)
		if err != nil {
			i.logger.Error("failed to get children", "error", err)
			return nil, err
		}

		for _, child := range children {
			_, err := tx.ChildBusAssociation.Create().
				SetChild(child).
				SetBusRoute(busRoute).
				Save(ctx)
			if err != nil {
				i.logger.Error("failed to create child bus route association", "error", err)
				return nil, err
			}
			pbChildren = append(pbChildren, utils.ToPbChild(child))
		}
	}
	return pbChildren, nil
}

func (i Interactor) GetBusRouteByBusID(ctx context.Context, req *pb.GetBusRouteByBusIDRequest) (*pb.GetBusRouteByBusIDResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus route id", "error", err)
		return nil, err
	}

	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}

	bus, err := tx.Bus.Query().
		Where(busRepo.ID(busID)).
		Only(ctx)

	var busRoute *ent.BusRoute
	if req.BusType == pb.BusType_BUS_TYPE_MORNING {
		busRoute, err = bus.QueryLatestMorningRoute().Only(ctx)
		if err != nil {
			i.logger.Error("failed to get bus route", "error", err)
			return nil, err
		}
	} else if req.BusType == pb.BusType_BUS_TYPE_EVENING {
		busRoute, err = bus.QueryLatestEveningRoute().Only(ctx)
		if err != nil {
			i.logger.Error("failed to get bus route", "error", err)
			return nil, err
		}
	}

	i.logger.Info("busRoute", "busRoute", busRoute)

	if err != nil {
		i.logger.Error("failed to get bus route", "error", err)
		return nil, err
	}

	pbBusRoute, err := i.CreateBusRouteResponse(ctx, tx, busRoute)
	if err != nil {
		i.logger.Error("failed to create bus route response", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return &pb.GetBusRouteByBusIDResponse{BusRoute: pbBusRoute}, nil
}

func (i Interactor) CreateBusRouteResponse(ctx context.Context, tx *ent.Tx, busRoute *ent.BusRoute) (*pb.BusRoute, error) {
	busType := utils.ConvertBusTypeToPbBusType(busRoute.BusType)
	bus, err := tx.Bus.Query().Where(
		busRepo.HasBusRouteWith(
			busRouteRepo.ID(busRoute.ID),
		),
	).Only(ctx)

	if err != nil {
		i.logger.Error("failed to get bus", "error", err)
		return nil, err

	}

	var orderedStations []*pb.Station
	stations, err := busRoute.
		QueryBusRouteAssociations().
		Order(ent.Asc("order")). // !要チェック
		QueryStation().
		WithGuardian().
		All(ctx)
	if err != nil {
		i.logger.Error("failed to get stations", "error", err)
		return nil, err
	}

	for _, station := range stations {
		guardian, err := station.QueryGuardian().Where(guardian.HasStationWith(stationRepo.ID(station.ID))).Only(ctx)
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
		orderedStations = append(orderedStations, utils.ToPbStation(station))
	}

	return &pb.BusRoute{
		Id:              busRoute.ID.String(),
		BusId:           bus.ID.String(),
		BusType:         busType,
		OrderedStations: orderedStations,
	}, nil
}
