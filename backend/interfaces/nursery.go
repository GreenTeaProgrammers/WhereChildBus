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

// GetNurseryByGuardianId implements where_child_busv1.NurseryServiceServer.
func (s *nurseryServiceServer) GetNurseryByGuardianId(ctx context.Context, req *pb.GetNurseryByGuardianIdRequest) (*pb.GetNurseryByGuardianIdResponse, error) {
	return s.interactor.GetNurseryByGuardianID(ctx, req)
}

// CreateNursery implements where_child_busv1.NurseryServiceServer.
func (s *nurseryServiceServer) CreateNursery(ctx context.Context, req *pb.CreateNurseryRequest) (*pb.CreateNurseryResponse, error) {
	return s.interactor.CreateNursery(ctx, req)
}

// UpdateNursery implements where_child_busv1.NurseryServiceServer.
func (s *nurseryServiceServer) UpdateNursery(ctx context.Context, req *pb.UpdateNurseryRequest) (*pb.UpdateNurseryResponse, error) {
	return s.interactor.UpdateNursery(ctx, req)
}

func (s *nurseryServiceServer) NurseryLogin(ctx context.Context, req *pb.NurseryLoginRequest) (*pb.NurseryLoginResponse, error) {
	return s.interactor.NurseryLogin(ctx, req)
}
