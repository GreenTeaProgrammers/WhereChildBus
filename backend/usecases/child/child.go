package child

import (
	"fmt"

	"github.com/google/uuid"
	"golang.org/x/exp/slog"

	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	childRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
  guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
  nurseryRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
)


type Interactor struct {
	entClient *ent.Client
	logger    *slog.Logger
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger) *Interactor {
	return &Interactor{entClient, logger}
}

func (i *Interactor) GetChildListByGuardianID(ctx context.Context, req *pb.GetChildListByGuardianIDRequest) (*pb.GetChildListByGuardianIDResponse, error) {
	guardianID, err := uuid.Parse(req.GuardianId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse guardian ID '%s': %w", req.GuardianId, err)
	}

	children, err := i.getChildList(ctx, func(tx *ent.Tx) (*ent.ChildQuery, error) {
		return tx.Child.Query().Where(childRepo.HasGuardianWith(guardianRepo.IDEQ(guardianID))), nil
	})

	if err != nil {
		return nil, err
	}

	return &pb.GetChildListByGuardianIDResponse{Children: children}, nil
}

func (i *Interactor) GetChildListByNurseryID(ctx context.Context, req *pb.GetChildListByNurseryIDRequest) (*pb.GetChildListByNurseryIDResponse, error) {
	nurseryID, err := uuid.Parse(req.NurseryId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse nursery ID '%s': %w", req.NurseryId, err)
	}

	children, err := i.getChildList(ctx, func(tx *ent.Tx) (*ent.ChildQuery, error) {
		return tx.Child.Query().Where(childRepo.HasNurseryWith(nurseryRepo.IDEQ(nurseryID))), nil
	})

	if err != nil {
		return nil, err
	}

	return &pb.GetChildListByNurseryIDResponse{Children: children}, nil
}

// getChildList abstracts the common logic for fetching child lists.
func (i *Interactor) getChildList(ctx context.Context, queryFunc func(*ent.Tx) (*ent.ChildQuery, error)) ([]*pb.Child, error) {
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	defer tx.Rollback() // Rollback is safe to call even if the tx is already committed.

	query, err := queryFunc(tx)
	if err != nil {
		return nil, err
	}

	entChildren, err := query.All(ctx)
	if err != nil {
		return nil, fmt.Errorf("query failed: %w", err)
	}

	pbChildren := make([]*pb.Child, len(entChildren))
	for i, c := range entChildren {
		pbChildren[i] = utils.ToPbChild(c)
	}

	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}

	return pbChildren, nil
}

