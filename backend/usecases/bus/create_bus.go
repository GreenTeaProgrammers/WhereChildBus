package bus

import (
	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"
)

func (i *Interactor) CreateBus(ctx context.Context, req *pb.CreateBusRequest) (*pb.CreateBusResponse, error) {
	nurseryID, err := utils.ParseUUID(req.NurseryId, i.logger)
	if err != nil {
		return nil, err
	}

	tx, err := utils.StartTransaction(ctx, i.entClient, i.logger)
	if err != nil {
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	createdBus, err := i.createBusRecord(ctx, tx, nurseryID, req)
	if err != nil {
		return nil, err
	}

	if err := i.checkAndUpdateBusStatusBasedOnStationCoordinates(ctx, createdBus); err != nil {
		return nil, err
	}

	bus, err := i.getBusWithEdge(ctx, tx, createdBus)
	if err != nil {
		return nil, err
	}

	// TODO: 正しく動作した場合削除して良い
	// nextStationID, err := getStationIDs(i.logger, ctx, bus)
	// if err != nil {
	// 	return nil, err
	// }

	pbBus, err := utils.ToPbConverter(bus, *i.logger)
	if err != nil {
		return nil, err
	}

	if err := utils.CommitTx(tx, i.logger); err != nil {
		return nil, err
	}

	return &pb.CreateBusResponse{
		Bus: pbBus,
	}, nil
}
