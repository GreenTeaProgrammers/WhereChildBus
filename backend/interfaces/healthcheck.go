package interfaces

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/healthcheck"
)

type healthcheckServiceServer struct {
	healthcheckInteractor *healthcheck.Interactor
}

func NewHealthcheckServiceServer() pb.HealthcheckServiceServer {
	return &healthcheckServiceServer{
		healthcheckInteractor: healthcheck.NewInteractor(),
	}
}

func (s *healthcheckServiceServer) Ping(ctx context.Context, req *pb.PingRequest) (*pb.PingResponse, error) {
	return s.healthcheckInteractor.Ping(req), nil
}
