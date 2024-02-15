package nursery

import (
	"fmt"

	"golang.org/x/exp/slog"

	"context"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	nurseryRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
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

func (i *Interactor) CreateNursery(ctx context.Context, req *pb.CreateNurseryRequest) (*pb.CreateNurseryResponse, error) {
	//パスワードをハッシュ化
	hashedPassword, err := utils.HashPassword(req.Password)
	if err != nil {
		//エラーハンドリング
		return nil, fmt.Errorf("failed to hash password: %w", err)
	}

	//Nurseryを作成
	nursery, err := i.entClient.Nursery.Create().
		SetName(req.Name).
		SetEmail(req.Email).
		SetHashedPassword(string(hashedPassword)).
		SetPhoneNumber(req.PhoneNumber).
		SetAddress(req.Address).
		Save(ctx)

	if err != nil {
		//エラーハンドリング
		return nil, fmt.Errorf("failed to create nursery: %w", err)
	}

	return &pb.CreateNurseryResponse{
		Nursery: utils.ToPbNurseryResponse(nursery),
	}, nil
}

func (i *Interactor) NurseryLogin(ctx context.Context, req *pb.NurseryLoginRequest) (*pb.NurseryLoginResponse, error) {
	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	defer tx.Rollback()

	// Nurseryを取得
	nursery, err := tx.Nursery.Query().
		Where(nurseryRepo.Email(req.Email)).
		Only(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to get nursery")
	}

	// フロントエンドから送られてきたパスワードとデータベースのハッシュ値を比較
	if !utils.CheckPassword(nursery.HashedPassword, req.Password) {
		return nil, fmt.Errorf("failed to get nursery")
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}

	return &pb.NurseryLoginResponse{
		Success: true,
		Nursery: utils.ToPbNurseryResponse(nursery),
	}, nil
}
