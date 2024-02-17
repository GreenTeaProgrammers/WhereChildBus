package interfaces

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/nursery"
)

type nurseryServiceServer struct {
	interactor *nursery.Interactor
}

func NewNurseryServiceServer(interactor *nursery.Interactor) pb.NurseryServiceServer {
	return &nurseryServiceServer{interactor}
}

// CreateNursery implements where_child_busv1.NurseryServiceServer.
func (s *nurseryServiceServer) CreateNursery(ctx context.Context, req *pb.CreateNurseryRequest) (*pb.CreateNurseryResponse, error) {
	return s.interactor.CreateNursery(ctx, req)
}

func (s *nurseryServiceServer) NurseryLogin(ctx context.Context, req *pb.NurseryLoginRequest) (*pb.NurseryLoginResponse, error) {
	return s.interactor.NurseryLogin(ctx, req)
}
