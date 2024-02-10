package healthcheck

import (
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus"
)

type Interactor struct{}

func NewInteractor() *Interactor {
	return &Interactor{}
}

func (i *Interactor) Ping(req *pb.PingRequest) *pb.PingResponse {
	return &pb.PingResponse{
		Message: req.Name + " pong:)",
	}
}
