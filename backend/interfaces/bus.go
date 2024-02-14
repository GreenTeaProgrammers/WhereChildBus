package interfaces

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/bus"
)

type busServiceServer struct {
	interactor *bus.Interactor
}

func NewBusServiceServer(interactor *bus.Interactor) pb.BusServiceServer {
	return &busServiceServer{interactor}
}

// CreateBus implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) CreateBus(ctx context.Context, req *pb.CreateBusRequest) (*pb.CreateBusResponse, error) {
	return s.interactor.CreateBus(ctx, req)
}

// GetBusListByNurseryId implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) GetBusListByNurseryId(ctx context.Context, req *pb.GetBusListByNurseryIdRequest) (*pb.GetBusListByNurseryIdResponse, error) {
	return s.interactor.GetBusListByNurseryID(ctx, req)
}
