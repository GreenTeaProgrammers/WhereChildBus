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

// CreateChild implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) CreateChild(ctx context.Context, req *pb.CreateChildRequest) (*pb.CreateChildResponse, error) {
	return s.interactor.CreateChild(ctx, req)
}

// GetChildListByBusID implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) GetChildListByBusID(req *pb.GetChildListByBusIDRequest, stream pb.ChildService_GetChildListByBusIDServer) error {
	return s.interactor.GetChildListByBusID(req, stream)
}

// GetChildListByGuardianID implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) GetChildListByGuardianID(req *pb.GetChildListByGuardianIDRequest, stream pb.ChildService_GetChildListByGuardianIDServer) error {
	return s.interactor.GetChildListByGuardianID(req, stream)
}

// GetChildListByNurseryID implements where_child_busv1.ChildServiceServer.
func (s *childServiceServer) GetChildListByNurseryID(req *pb.GetChildListByNurseryIDRequest, stream pb.ChildService_GetChildListByNurseryIDServer) error {
	return s.interactor.GetChildListByNurseryID(req, stream)
}
