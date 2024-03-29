package interfaces

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/guardian"
)

type guardianServiceServer struct {
	interactor *guardian.Interactor
}

func NewGuardianServiceServer(interactor *guardian.Interactor) pb.GuardianServiceServer {
	return &guardianServiceServer{interactor}
}

// CreateGuardian implements where_child_busv1.GuardianServiceServer.
func (s *guardianServiceServer) CreateGuardian(ctx context.Context, req *pb.CreateGuardianRequest) (*pb.CreateGuardianResponse, error) {
	return s.interactor.CreateGuardian(ctx, req)
}

// GuardianLogin implements where_child_busv1.GuardianServiceServer.
func (s *guardianServiceServer) GuardianLogin(ctx context.Context, req *pb.GuardianLoginRequest) (*pb.GuardianLoginResponse, error) {
	return s.interactor.GuardianLogin(ctx, req)
}

// GetGuardianListByBusId implements where_child_busv1.GuardianServiceServer.
func (s *guardianServiceServer) GetGuardianListByBusId(ctx context.Context, req *pb.GetGuardianListByBusIdRequest) (*pb.GetGuardianListByBusIdResponse, error) {
	return s.interactor.GetGuardianListByBusID(ctx, req)
}

// GetGuardianByChildId implements where_child_busv1.GuardianServiceServer.
func (s *guardianServiceServer) GetGuardianByChildId(ctx context.Context, req *pb.GetGuardianByChildIdRequest) (*pb.GetGuardianByChildIdResponse, error) {
	return s.interactor.GetGuardianByChildID(ctx, req)
}

// GetGuardianListByNurseryId implements where_child_busv1.GuardianServiceServer.
func (s *guardianServiceServer) GetGuardianListByNurseryId(ctx context.Context, req *pb.GetGuardianListByNurseryIdRequest) (*pb.GetGuardianListByNurseryIdResponse, error) {
	return s.interactor.GetGuardianListByNurseryID(ctx, req)
}

// UpdateGuardian implements where_child_busv1.GuardianServiceServer.
func (s *guardianServiceServer) UpdateGuardian(ctx context.Context, req *pb.UpdateGuardianRequest) (*pb.UpdateGuardianResponse, error) {
	return s.interactor.UpdateGuardian(ctx, req)
}
