package station

import (
	"context"

	"golang.org/x/exp/slog"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	stationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/station"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"
	"github.com/google/uuid"
)

type Interactor struct {
	entClient *ent.Client
	logger    *slog.Logger
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger) *Interactor {
	return &Interactor{entClient, logger}
}

func (i *Interactor) UpdateStationLocationByGuardianID(ctx context.Context, req *pb.UpdateStationLocationByGuardianIdRequest) (*pb.UpdateStationLocationByGuardianIdResponse, error) {
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	guardianID, err := uuid.Parse(req.GuardianId)
	if err != nil {
		i.logger.Error("failed to parse guardian ID", "error", err)
		return nil, err
	}

	station, err := tx.Station.Query().
		Where(stationRepo.HasGuardianWith(guardianRepo.ID(guardianID))).
		Only(ctx)

	if ent.IsNotFound(err) {
		// エンティティが見つからない場合、新しく作成します。
		station, err = tx.Station.Create().
			SetGuardianID(guardianID).
			SetLatitude(req.Latitude).
			SetLongitude(req.Longitude).
			Save(ctx)
		if err != nil {
			i.logger.Error("failed to create station", "error", err)
			return nil, err
		}
	} else if err != nil {
		i.logger.Error("failed to get station", "error", err)
		return nil, err
	} else {
		// エンティティが見つかった場合、更新します。
		station, err = station.Update().
			SetLatitude(req.Latitude).
			SetLongitude(req.Longitude).
			Save(ctx)
		if err != nil {
			i.logger.Error("failed to update station", "error", err)
			return nil, err
		}
	}
	if err != nil {
		i.logger.Error("failed to create or update station", "error", err)
		return nil, err
	}

	morningNextStationID, eveningNextStationID, err := getNextStationIDs(*i.logger, ctx, station)
	if err != nil {
		i.logger.Error("failed to get next station IDs", "error", err)
		return nil, err // エラーハンドリング
	}

	// トランザクションをコミットします。
	if err := tx.Commit(); err != nil {
		i.logger.Error(("failed to commit transaction"), "error", err)
		return nil, err
	}

	// レスポンスを作成します。
	return &pb.UpdateStationLocationByGuardianIdResponse{
		Station: utils.ToPbStation(station, morningNextStationID, eveningNextStationID),
	}, nil
}

func (i *Interactor) UpdateStation(ctx context.Context, req *pb.UpdateStationRequest) (*pb.UpdateStationResponse, error) {
	panic("unimplemented")
	// TODO: 実装
}

func (i *Interactor) GetStationListByBusId(ctx context.Context, req *pb.GetStationListByBusIdRequest) (*pb.GetStationListByBusIdResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus ID", "error", err)
		return nil, err
	}

	stations, err := i.entClient.Station.Query().
		Where(stationRepo.HasBusWith(busRepo.ID(busID))).
		WithGuardian(func(q *ent.GuardianQuery) {
			q.WithNursery()
			q.WithChildren()
		}).
		All(ctx)

	if err != nil {
		i.logger.Error("failed to get stations by bus ID", "error", err)
		return nil, err
	}

	pbStations := make([]*pb.Station, 0, len(stations))
	uniqueGuardians := make(map[string]*pb.GuardianResponse)
	uniqueChildren := make(map[string]*pb.Child)

	for _, station := range stations {
		morningNextStationID, eveningNextStationID, err := getNextStationIDs(*i.logger, ctx, station)
		if err != nil {
			// エラーメッセージにステーションIDを追加して明確にする
			i.logger.Error("failed to get next station IDs", "error", err)
			return nil, err
		}

		pbStation := utils.ToPbStation(station, morningNextStationID, eveningNextStationID)
		pbStations = append(pbStations, pbStation)

		if station.Edges.Guardian != nil {
			guardian := station.Edges.Guardian
			if err != nil {
				// 適切なエラーハンドリング
				i.logger.Error("failed to get guardian", "error", err)
				return nil, err
			}
			guardianID := guardian.ID.String()
			pbGuardian := utils.ToPbGuardianResponse(guardian)
			uniqueGuardians[guardianID] = pbGuardian

			for _, child := range guardian.Edges.Children {
				childID := child.ID.String()
				pbChild := utils.ToPbChild(child)
				uniqueChildren[childID] = pbChild
			}
		}
	}

	// マップからスライスへの変換
	pbGuardians := make([]*pb.GuardianResponse, 0, len(uniqueGuardians))
	for _, guardian := range uniqueGuardians {
		pbGuardians = append(pbGuardians, guardian)
	}

	pbChildren := make([]*pb.Child, 0, len(uniqueChildren))
	for _, child := range uniqueChildren {
		pbChildren = append(pbChildren, child)
	}

	return &pb.GetStationListByBusIdResponse{
		Stations:  pbStations,
		Guardians: pbGuardians,
		Children:  pbChildren,
	}, nil
}

func getNextStationIDs(logger slog.Logger, ctx context.Context, station *ent.Station) (morningNextStationID, eveningNextStationID string, err error) {
	morningNextStation, err := station.QueryMorningNextStation().Only(ctx)
	if err != nil && !ent.IsNotFound(err) {
		logger.Error("failed to query morning next station", "error", err)
		return "", "", err
	}
	if morningNextStation != nil {
		morningNextStationID = morningNextStation.ID.String()
	}

	eveningNextStation, err := station.QueryEveningNextStation().Only(ctx)
	if err != nil && !ent.IsNotFound(err) {
		return "", "", err
	}
	if eveningNextStation != nil {
		eveningNextStationID = eveningNextStation.ID.String()
	}

	return morningNextStationID, eveningNextStationID, nil
}
