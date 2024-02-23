package bus

import (
	"context"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/google/uuid"
)

func (i *Interactor) createBusRecord(ctx context.Context, tx *ent.Tx, nurseryID uuid.UUID, req *pb.CreateBusRequest) (*ent.Bus, error) {
	createdBus, err := tx.Bus.Create().
		SetNurseryID(nurseryID).
		SetName(req.Name).
		SetPlateNumber(req.PlateNumber).
		Save(ctx)
	if err != nil {
		i.logger.Error("failed to create bus", "error", err)
		return nil, err
	}
	return createdBus, nil
}

func (i *Interactor) getBusWithEdge(ctx context.Context, tx *ent.Tx, bus *ent.Bus) (*ent.Bus, error) {
	bus, err := tx.Bus.Query().
		Where(busRepo.ID(bus.ID)).
		WithBoardingRecords().
		WithBusRoute().
		WithLatestEveningRoute().
		WithLatestMorningRoute().
		WithNextStation().
		WithNursery().
		Only(ctx)
	if err != nil {
		i.logger.Error("failed to get bus with details", "error", err)
		return nil, err
	}
	return bus, nil
}

func (i *Interactor) checkAndUpdateBusStatusBasedOnStationCoordinates(ctx context.Context, bus *ent.Bus) error {

}
