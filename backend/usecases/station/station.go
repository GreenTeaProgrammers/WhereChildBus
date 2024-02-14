package station

import (
	"context"
	"fmt"

	"golang.org/x/exp/slog"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
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

func (i *Interactor) CreateStation(ctx context.Context, req *pb.CreateStationRequest) (*pb.CreateStationResponse, error) {
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	defer tx.Rollback()

	guardianID, err := uuid.Parse(req.GuardianId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse ID: %w", err)
	}

	station, err := tx.Station.Create().
		SetGuardianID(guardianID).
		SetLatitude(req.Latitude).
		SetLongitude(req.longitude).
		Save(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to create station: %w", err)
	}

	return &pb.CreateStationResponse{
		Station: utils.ToPbStation(station),
	}, nil
}

func (i *Interactor) GetStationListByBusId(ctx context.Context, req *pb.GetStationListByBusIdRequest) (*pb.GetStationListByBusIdResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse bus ID: %w", err)
	}

	stations, err := i.entClient.Station.Query().
		Where(stationRepo.HasBusWith(busRepo.ID(busID))).
		WithGuardian(func(q *ent.GuardianQuery) {
			q.WithChildren() // Guardian に紐づく Children も取得
		}).
		All(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get stations with guardians and children: %w", err)
	}

	pbStations := make([]*pb.Station, 0, len(stations))
	uniqueGuardians := make(map[string]*pb.GuardianResponse)
	uniqueChildren := make(map[string]*pb.Child)

	for _, station := range stations {
		// ステーションをプロトコルバッファ形式に変換
		pbStation := utils.ToPbStation(station)
		pbStations = append(pbStations, pbStation)

		if station.Edges.Guardian != nil {
			guardian := station.Edges.Guardian
			pbGuardian := utils.ToPbGuardianResponse(guardian)
			guardianID := guardian.ID.String()
			uniqueGuardians[guardianID] = pbGuardian // ガーディアンを一意に保持

			for _, child := range guardian.Edges.Children {
				pbChild := utils.ToPbChild(child)
				childID := child.ID.String()
				uniqueChildren[childID] = pbChild // 子供を一意に保持
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
