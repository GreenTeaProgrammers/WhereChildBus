package guardian

import (
	"fmt"

	"golang.org/x/exp/slog"

	"context"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
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

func (i *Interactor) CreateGuardian(ctx context.Context, req *pb.CreateGuardianRequest) (*pb.CreateGuardianResponse, error) {
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

	// req.nurseryCodeからnurseryを取得
	nursery, err := tx.Nursery.Query().
		Where(nurseryRepo.NurseryCode(req.NurseryCode)).
		Only(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get nursery: %w", err)
	}

	// Guardianを作成
	guardian, err := tx.Guardian.Create().
		SetEmail(req.Email).
		SetHashedPassword(string(hashedPassword)).
		SetName(req.Name).
		SetPhoneNumber(req.PhoneNumber).
		SetNursery(nursery).
		Save(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to create guardian: %w", err)
	}

	guardian, err = tx.Guardian.Query().
		Where(guardianRepo.IDEQ(guardian.ID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to get guardian: %w", err)
	}

	// Stationを作成
	_, err = tx.Station.Create().
		SetGuardian(guardian).
		Save(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to create guardian: %w", err)
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}

	// レスポンスを返す
	return &pb.CreateGuardianResponse{
		Guardian: utils.ToPbGuardianResponse(guardian),
	}, nil
}

func (i *Interactor) GuardianLogin(ctx context.Context, req *pb.GuardianLoginRequest) (*pb.GuardianLoginResponse, error) {
	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	defer tx.Rollback()

	// Guardianを取得
	guardian, err := tx.Guardian.Query().
		Where(guardianRepo.Email(req.Email)).
		WithNursery().
		Only(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to get guardian")
	}

	// フロントエンドから送られてきたパスワードとデータベースのハッシュ値を比較
	if !utils.CheckPassword(guardian.HashedPassword, req.Password) {
		return nil, fmt.Errorf("failed to get guardian")
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %v", err)
	}

	// レスポンスを返す
	return &pb.GuardianLoginResponse{
		Success:  true,
		Guardian: utils.ToPbGuardianResponse(guardian), // NurseryID を引数として渡す
		Nursery:  utils.ToPbNurseryResponse(guardian.Edges.Nursery),
	}, nil
}
