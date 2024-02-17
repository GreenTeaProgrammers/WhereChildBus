package interfaces

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/child"
)

type childServiceServer struct {
	interactor *child.Interactor
}

func NewChildServiceServer(interactor *child.Interactor) pb.ChildServiceServer {
	return &childServiceServer{interactor}
}

// GetChildListByBusID implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) GetChildListByBusID(ctx context.Context, req *pb.GetChildListByBusIDRequest) (*pb.GetChildListByBusIDResponse, error) {
	return s.interactor.GetChildListByBusID(ctx, req)
}

// CreateChild implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) CreateChild(ctx context.Context, req *pb.CreateChildRequest) (*pb.CreateChildResponse, error) {
	return s.interactor.CreateChild(ctx, req)
}

// GetChildListByGuardianID implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) GetChildListByGuardianID(ctx context.Context, req *pb.GetChildListByGuardianIDRequest) (*pb.GetChildListByGuardianIDResponse, error) {
	return s.interactor.GetChildListByGuardianID(ctx, req)
}

// GetChildListByNurseryID implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) GetChildListByNurseryID(ctx context.Context, req *pb.GetChildListByNurseryIDRequest) (*pb.GetChildListByNurseryIDResponse, error) {
	return s.interactor.GetChildListByNurseryID(ctx, req)
}
