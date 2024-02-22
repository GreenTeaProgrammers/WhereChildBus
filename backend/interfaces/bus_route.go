package interfaces

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/busroute"
)

type busRouteServiceServer struct {
	interactor *busroute.Interactor
}

func NewBusRouteServiceServer(interactor *busroute.Interactor) pb.BusRouteServiceServer {
	return &busRouteServiceServer{interactor}
}

// CreateBusRoute implements where_child_busv1.BusRouteServiceServer.
func (s *busRouteServiceServer) CreateBusRoute(ctx context.Context, req *pb.CreateBusRouteRequest) (*pb.CreateBusRouteResponse, error) {
	return s.interactor.CreateBusRoute(ctx, req)
}

// GetBusRoute implements where_child_busv1.BusRouteServiceServer.
func (s *busRouteServiceServer) GetBusRouteByBusID(ctx context.Context, req *pb.GetBusRouteByBusIDRequest) (*pb.GetBusRouteByBusIDResponse, error) {
	return s.interactor.GetBusRouteByBusID(ctx, req)
}
