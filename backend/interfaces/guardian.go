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
