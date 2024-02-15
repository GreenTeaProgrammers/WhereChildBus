package interfaces

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/station"
)

type stationServiceServer struct {
	interactor *station.Interactor
}

func NewStationServiceServer(interactor *station.Interactor) pb.StationServiceServer {
	return &stationServiceServer{interactor}
}

// CreateStation implements where_child_busv1.StationServiceServer.
func (s *stationServiceServer) UpdateStation(ctx context.Context, req *pb.UpdateStationRequest) (*pb.UpdateStationResponse, error) {
	return s.interactor.UpdateStation(ctx, req)
}

// GetStationListByBusId implements where_child_busv1.StationServiceServer.
func (s *stationServiceServer) GetStationListByBusId(ctx context.Context, req *pb.GetStationListByBusIdRequest) (*pb.GetStationListByBusIdResponse, error) {
	return s.interactor.GetStationListByBusId(ctx, req)
}
