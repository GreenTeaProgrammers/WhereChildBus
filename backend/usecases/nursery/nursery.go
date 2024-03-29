package nursery

import (
	"fmt"
	"math/rand"
	"time"

	"golang.org/x/exp/slog"

	"context"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	nurseryRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"
	"github.com/google/uuid"
)

type Interactor struct {
	entClient *ent.Client
	logger    *slog.Logger
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger) *Interactor {
	return &Interactor{entClient, logger}
}

func (i *Interactor) GetNurseryByGuardianID(ctx context.Context, req *pb.GetNurseryByGuardianIdRequest) (*pb.GetNurseryByGuardianIdResponse, error) {
	// guardianIDをuuidに変換
	guardianID, err := uuid.Parse(req.GuardianId)
	if err != nil {
		i.logger.Error("failed to parse uuid", "error", err)
		return nil, err
	}

	// guardianIDに紐づくnurseryを取得
	nurseries, err := i.entClient.Nursery.Query().
		Where(nursery.HasGuardiansWith(guardianRepo.IDEQ(guardianID))).
		Only(ctx)
	if err != nil {
		i.logger.Error("failed to get nurseries", "error", err)
		return nil, err
	}

	return &pb.GetNurseryByGuardianIdResponse{
		Nurseries: utils.ToPbNurseryResponse(nurseries),
	}, nil
}

func (i *Interactor) CreateNursery(ctx context.Context, req *pb.CreateNurseryRequest) (*pb.CreateNurseryResponse, error) {
	//パスワードをハッシュ化
	hashedPassword, err := utils.HashPassword(req.Password)
	if err != nil {
		i.logger.Error("failed to hash password", "error", err)
		return nil, err
	}

	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	// nurseryコード(レコードに存在しない)
	// 生成したコードが既存のコードと重複していないか確認
	var code string
	for {
		code = generateCode()
		_, err := tx.Nursery.Query().Where(nurseryRepo.NurseryCode(code)).Only(ctx)
		if err != nil {
			break
		}
		i.logger.Warn("code is already exists", "code", code)
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
		i.logger.Error("failed to create nursery", "error", err)
		return nil, err
	}

	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return &pb.CreateNurseryResponse{
		Nursery: utils.ToPbNurseryResponse(nursery),
	}, nil
}

func (i *Interactor) NurseryLogin(ctx context.Context, req *pb.NurseryLoginRequest) (*pb.NurseryLoginResponse, error) {
	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	// Nurseryを取得
	nursery, err := tx.Nursery.Query().
		Where(nurseryRepo.Email(req.Email)).
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get nursery", "error", err)
		return nil, err
	}

	// フロントエンドから送られてきたパスワードとデータベースのハッシュ値を比較
	if !utils.CheckPassword(nursery.HashedPassword, req.Password) {
		i.logger.Info("password is incorrect")
		return nil, err
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	return &pb.NurseryLoginResponse{
		Success: true,
		Nursery: utils.ToPbNurseryResponse(nursery),
	}, nil
}

func (i *Interactor) UpdateNursery(ctx context.Context, req *pb.UpdateNurseryRequest) (*pb.UpdateNurseryResponse, error) {
	// requestからnurseryIDを取得
	nurseryID, err := uuid.Parse(req.Id)
	if err != nil {
		i.logger.Error("failed to parse uuid", "error", err)
		return nil, err
	}

	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	// 更新処理を行うためのビルダーを構築
	update := tx.Nursery.Update().Where(nursery.IDEQ(nurseryID))
	for _, path := range req.UpdateMask.Paths {
		switch path {
		case "name":
			update.SetName(req.Name)
		case "email":
			update.SetEmail(req.Email)
		case "phoneNumber":
			update.SetPhoneNumber(req.PhoneNumber)
		case "address":
			update.SetAddress(req.Address)
		case "password":
			hashedPassword, err := utils.HashPassword(req.Password)
			if err != nil {
				i.logger.Error("failed to hash password", "error", err)
				return nil, err
			}
			update.SetHashedPassword(hashedPassword)
		}
	}

	// 更新の実行
	_, err = update.Save(ctx)
	if err != nil {
		i.logger.Error("failed to update nursery", "error", err)
		return nil, err
	}

	// 更新されたエンティティの取得
	uodatedNursery, err := tx.Nursery.Query().
		Where(nursery.IDEQ(nurseryID)).
		Only(ctx)
	if err != nil {
		i.logger.Error("failed to get nursery", "error", err)
		return nil, err
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	// レスポンスの生成と返却
	return &pb.UpdateNurseryResponse{
		Nursery: utils.ToPbNurseryResponse(uodatedNursery),
	}, nil
}

// コード生成
func generateCode() string {
	rnd := rand.New(rand.NewSource(time.Now().UnixNano()))

	code := ""               // 空の文字列でコードを初期化
	for i := 0; i < 7; i++ { // 7桁のコードを生成
		// `rand.Intn` の代わりに `rnd.Intn` を使用する
		digit := rnd.Intn(10)
		code += fmt.Sprintf("%d", digit) // 数字を文字列に変換してコードに追加
	}

	return code
}
