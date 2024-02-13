package guardian

import (
	"fmt"

	"golang.org/x/exp/slog"

	"context"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"
)

type Interactor struct {
	entClient *ent.Client
	logger    *slog.Logger
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger) *Interactor {
	return &Interactor{entClient, logger}
}

func (i *Interactor) GuardianLogin(ctx context.Context, req *pb.GuardianLoginRequest) (*pb.GuardianLoginResponse, error) {
	// パスワードをハッシュ化
	hashedPassword, err := utils.HashPassword(req.Password)
	if err != nil {
		// エラーハンドリング
		return nil, fmt.Errorf("failed to hash password: %w", err)
	}

	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	defer tx.Rollback()

	// Guardianを取得
	guardian, err := tx.Guardian.Query().
		Where(guardianRepo.Email(req.Email)).
		Where(guardianRepo.HashedPassword(string(hashedPassword))).
		Only(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to get guardian: %w", err)
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}

	// レスポンスを返す
	return &pb.GuardianLoginResponse{
		Success:  true,
		Guardian: utils.ToPbGuardianResponse(guardian),
	}, nil

}
