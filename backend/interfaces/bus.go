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

// UpdateBus implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) UpdateBus(ctx context.Context, req *pb.UpdateBusRequest) (*pb.UpdateBusResponse, error) {
	return s.interactor.UpdateBus(ctx, req)
}

// SendLocationContinuous implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) SendLocationContinuous(stream pb.BusService_SendLocationContinuousServer) error {
	return s.interactor.SendLocationContinuous(stream)
}

// TrackBusContinuous implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) TrackBusContinuous(req *pb.TrackBusContinuousRequest, stream pb.BusService_TrackBusContinuousServer) error {
	return s.interactor.TrackBusContinuous(req, stream)
}

// StreamBusVideo implements where_child_busv1.BusServiceServer.
func (s *busServiceServer) StreamBusVideo(stream pb.BusService_StreamBusVideoServer) error {
	return s.interactor.StreamBusVideo(stream)
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
