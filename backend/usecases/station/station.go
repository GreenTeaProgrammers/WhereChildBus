package station

import (
	"context"

	"golang.org/x/exp/slog"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	busRouteRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	busRouteAssociationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busrouteassociation"
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

	// トランザクションをコミットします。
	if err := tx.Commit(); err != nil {
		i.logger.Error(("failed to commit transaction"), "error", err)
		return nil, err
	}

	// レスポンスを作成します。
	return &pb.UpdateStationLocationByGuardianIdResponse{
		Station: utils.ToPbStation(station),
	}, nil
}

func (i *Interactor) UpdateStation(ctx context.Context, req *pb.UpdateStationRequest) (*pb.UpdateStationResponse, error) {
	// station_idのパース
	stationID, err := uuid.Parse(req.Id)
	if err != nil {
		i.logger.Error("failed to parse station ID", "error", err)
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
	update := tx.Station.Update().Where(stationRepo.IDEQ(stationID))
	for _, path := range req.UpdateMask.Paths {
		switch path {
		case "latitude":
			update = update.SetLatitude(req.Latitude)
		case "longitude":
			update = update.SetLongitude(req.Longitude)
		}
	}

	// 更新の実行
	_, err = update.Save(ctx)
	if err != nil {
		i.logger.Error("failed to update station", "error", err)
		return nil, err
	}

	// 更新されたエンティティの取得
	updateStation, err := tx.Station.Query().
		Where(stationRepo.IDEQ(stationID)).
		WithGuardian().
		Only(ctx)
	if err != nil {
		i.logger.Error("failed to get updated station", "error", err)
		return nil, err
	}

	if req.BusId != "" {
		bus, err := tx.Bus.Query().
			Where(busRepo.IDEQ(uuid.MustParse(req.BusId))).
			Only(ctx)

		if err != nil {
			i.logger.Error("failed to get bus", "error", err)
			return nil, err
		}

		_, err = utils.CheckAndFixBusStationCoordinates(*i.logger, ctx, bus)
		if err != nil {
			i.logger.Error("failed to check and fix bus station coordinates", "error", err)
			return nil, err
		}
	}

	// トランザクションのコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	// レスポンスの作成と返却
	return &pb.UpdateStationResponse{
		Station: utils.ToPbStation(updateStation),
	}, nil
}

func (i *Interactor) GetStationListByBusId(ctx context.Context, req *pb.GetStationListByBusIdRequest) (*pb.GetStationListByBusIdResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus ID", "error", err)
		return nil, err
	}

	stations, err := i.entClient.Station.Query().
		Where( // !要チェック
			stationRepo.HasBusRouteAssociationsWith(
				busRouteAssociationRepo.HasBusRouteWith(
					busRouteRepo.HasBusWith(
						busRepo.IDEQ(busID),
					),
				),
			),
		).
		WithGuardian(func(q *ent.GuardianQuery) {
			q.WithNursery()
			q.WithChildren(
				func(q *ent.ChildQuery) {
					q.WithGuardian()
				},
			)
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
		if err != nil {
			// エラーメッセージにステーションIDを追加して明確にする
			i.logger.Error("failed to get next station IDs", "error", err)
			return nil, err
		}

		pbStation := utils.ToPbStation(station)
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

func (i Interactor) GetUnregisteredStationList(ctx context.Context, req *pb.GetUnregisteredStationListRequest) (*pb.GetUnregisteredStationListResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus ID", "error", err)
		return nil, err
	}

	stations, err := i.entClient.Station.Query(). // !要チェック
							Where(
			stationRepo.HasBusRouteAssociationsWith(
				busRouteAssociationRepo.HasBusRouteWith(
					busRouteRepo.HasBusWith(
						busRepo.IDEQ(busID),
					),
				),
			),
		).
		Where(stationRepo.Latitude(0)).
		Where(stationRepo.Longitude(0)).
		WithGuardian(func(q *ent.GuardianQuery) {
			q.WithNursery()
		}).
		All(ctx)

	if err != nil {
		i.logger.Error("failed to get unregistered stations", "error", err)
		return nil, err
	}

	var pbStations []*pb.Station
	var pbGuardians []*pb.GuardianResponse
	for _, station := range stations {
		pbStations = append(pbStations, utils.ToPbStation(station))
		pbGuardians = append(pbGuardians, utils.ToPbGuardianResponse(station.Edges.Guardian)) // !要チェック
	}

	return &pb.GetUnregisteredStationListResponse{
		Stations:  pbStations,
		Guardians: pbGuardians,
	}, nil
}
