package guardian

import (
	"golang.org/x/exp/slog"

	"context"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	childRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
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

func (i *Interactor) CreateGuardian(ctx context.Context, req *pb.CreateGuardianRequest) (*pb.CreateGuardianResponse, error) {
	// パスワードをハッシュ化
	hashedPassword, err := utils.HashPassword(req.Password)
	if err != nil {
		// エラーハンドリング
		i.logger.Error("failed to hash password", "error", err)
		return nil, err
	}

	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)
	// req.nurseryCodeからnurseryを取得
	nursery, err := tx.Nursery.Query().
		Where(nurseryRepo.NurseryCode(req.NurseryCode)).
		Only(ctx)
	if err != nil {
		i.logger.Error("failed to get nursery", "error", err)
		return nil, err
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
		i.logger.Error("failed to create guardian", "error", err)
		return nil, err
	}

	guardian, err = tx.Guardian.Query().
		Where(guardianRepo.IDEQ(guardian.ID)).
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get guardian", "error", err)
		return nil, err
	}

	// Stationを作成
	_, err = tx.Station.Create().
		SetGuardian(guardian).
		Save(ctx)

	if err != nil {
		i.logger.Error("failed to create station", "error", err)
		return nil, err
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
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
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)
	// Guardianを取得
	guardian, err := tx.Guardian.Query().
		Where(guardianRepo.Email(req.Email)).
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get guardian", "error", err)
		return nil, err
	}

	// フロントエンドから送られてきたパスワードとデータベースのハッシュ値を比較
	if !utils.CheckPassword(guardian.HashedPassword, req.Password) {
		i.logger.Error("password is incorrect")
		return nil, err
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	// レスポンスを返す
	return &pb.GuardianLoginResponse{
		Success:  true,
		Guardian: utils.ToPbGuardianResponse(guardian), // NurseryID を引数として渡す
		Nursery:  utils.ToPbNurseryResponse(guardian.Edges.Nursery),
	}, nil
}

func (i *Interactor) GetGuardianListByBusID(ctx context.Context, req *pb.GetGuardianListByBusIdRequest) (*pb.GetGuardianListByBusIdResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		i.logger.Error("failed to parse bus ID", "error", err)
		return nil, err
	}
	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	// Guardianを取得
	guardians, err := tx.Guardian.Query().
		Where(guardianRepo.HasNurseryWith(nurseryRepo.HasBusesWith(busRepo.IDEQ(busID)))).
		WithNursery().
		All(ctx)

	if err != nil {
		i.logger.Error("failed to get guardians by bus ID", "error", err)
		return nil, err
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	var pbGuardians []*pb.GuardianResponse
	for _, guardian := range guardians {
		pbGuardians = append(pbGuardians, utils.ToPbGuardianResponse(guardian))
	}

	return &pb.GetGuardianListByBusIdResponse{Guardians: pbGuardians}, nil
}

func (i *Interactor) GetGuardianByChildID(ctx context.Context, req *pb.GetGuardianByChildIdRequest) (*pb.GetGuardianByChildIdResponse, error) {
	childID, err := uuid.Parse(req.ChildId)
	if err != nil {
		i.logger.Error("failed to parse child ID", "error", err)
		return nil, err
	}
	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}
	defer utils.RollbackTx(tx, i.logger)

	// Guardianを取得
	guardians, err := tx.Guardian.Query().
		Where(guardianRepo.HasChildrenWith(childRepo.ID(childID))).
		WithNursery().
		Only(ctx)

	if err != nil {
		i.logger.Error("failed to get guardians by child ID", "error", err)
		return nil, err
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	pbGuardian := utils.ToPbGuardianResponse(guardians)
	return &pb.GetGuardianByChildIdResponse{Guardian: pbGuardian}, nil
}

func (i *Interactor) GetGuardianListByNurseryID(ctx context.Context, req *pb.GetGuardianListByNurseryIdRequest) (*pb.GetGuardianListByNurseryIdResponse, error) {
	nurseryID, err := uuid.Parse(req.NurseryId)
	if err != nil {
		i.logger.Error("failed to parse nursery ID", "error", err)
		return nil, err
	}

	// トランザクションを開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}

	defer utils.RollbackTx(tx, i.logger)

	// Guardianを取得
	guardians, err := tx.Guardian.Query().
		Where(guardianRepo.HasNurseryWith(nurseryRepo.IDEQ(nurseryID))).
		WithNursery().
		All(ctx)

	if err != nil {
		i.logger.Error("failed to get guardians by nursery ID", "error", err)
		return nil, err
	}

	// トランザクションをコミット
	if err := tx.Commit(); err != nil {
		i.logger.Error("failed to commit transaction", "error", err)
		return nil, err
	}

	var pbGuardians []*pb.GuardianResponse
	for _, guardian := range guardians {
		pbGuardians = append(pbGuardians, utils.ToPbGuardianResponse(guardian))
	}

	return &pb.GetGuardianListByNurseryIdResponse{Guardians: pbGuardians}, nil
}
