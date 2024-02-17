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

// SendLocationContinuous implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) SendLocationContinuous(stream pb.BusService_SendLocationContinuousServer) error {
	return s.interactor.SendLocationContinuous(stream)
}

// StreamBusVideo implements where_child_busv1.BusServiceServer.
func (*busServiceServer) StreamBusVideo(pb.BusService_StreamBusVideoServer) error {
	panic("unimplemented")
}

// TrackBusContinuous implements where_child_busv1.BusServiceServer.
func (*busServiceServer) TrackBusContinuous(*pb.TrackBusContinuousRequest, pb.BusService_TrackBusContinuousServer) error {
	panic("unimplemented")
}

// CreateBus implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) CreateBus(ctx context.Context, req *pb.CreateBusRequest) (*pb.CreateBusResponse, error) {
	return s.interactor.CreateBus(ctx, req)
}

// GetBusListByNurseryId implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) GetBusListByNurseryId(ctx context.Context, req *pb.GetBusListByNurseryIdRequest) (*pb.GetBusListByNurseryIdResponse, error) {
	return s.interactor.GetBusListByNurseryID(ctx, req)
}

// ChangeBusStatus implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) ChangeBusStatus(ctx context.Context, req *pb.ChangeBusStatusRequest) (*pb.ChangeBusStatusResponse, error) {
	return s.interactor.ChangeBusStatus(ctx, req)
}
