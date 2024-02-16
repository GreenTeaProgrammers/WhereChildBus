package nursery

import (
	"fmt"
	"math/rand"
	"time"

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

	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	defer tx.Rollback()

	// nurseryコード(レコードに存在しない)
	// 生成したコードが既存のコードと重複していないか確認
	var code string
	for {
		code = generateCode()
		_, err := tx.Nursery.Query().Where(nurseryRepo.NurseryCode(code)).Only(ctx)
		if err != nil {
			break
		}
	}

	//Nurseryを作成
	nursery, err := tx.Nursery.Create().
		SetName(req.Name).
		SetEmail(req.Email).
		SetHashedPassword(string(hashedPassword)).
		SetNurseryCode(code).
		SetPhoneNumber(req.PhoneNumber).
		SetAddress(req.Address).
		Save(ctx)

	if err != nil {
		//エラーハンドリング
		return nil, fmt.Errorf("failed to create nursery: %w", err)
	}

	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
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

// コード生成
func generateCode() string {
	rand.Seed(time.Now().UnixNano()) // 現在時刻をシード値として乱数生成器を初期化

	code := ""               // 空の文字列でコードを初期化
	for i := 0; i < 7; i++ { // 7桁のコードを生成
		digit := rand.Intn(10)           // 0から9までの乱数を生成
		code += fmt.Sprintf("%d", digit) // 数字を文字列に変換してコードに追加
	}

	return code
}
