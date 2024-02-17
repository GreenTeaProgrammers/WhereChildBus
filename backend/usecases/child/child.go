package child

import (
	"fmt"

	"cloud.google.com/go/storage"
	"github.com/google/uuid"
	"golang.org/x/exp/slog"

	"context"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/utils"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	childRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	childBusAssociationRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childbusassociation"
	childPhotoRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/childphoto"
	guardianRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/guardian"
	nurseryRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/nursery"

	mlv1 "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/machine_learning/v1"
)

type Interactor struct {
	entClient       *ent.Client
	logger          *slog.Logger
	StorageClient   *storage.Client
	MLServiceClient mlv1.MachineLearningServiceClient
	BucketName      string
}

func NewInteractor(entClient *ent.Client, logger *slog.Logger, storageClient *storage.Client, mlClient mlv1.MachineLearningServiceClient, bucketName string) *Interactor {
	return &Interactor{entClient, logger, storageClient, mlClient, bucketName}
}

func (i *Interactor) CreateChild(ctx context.Context, req *pb.CreateChildRequest) (*pb.CreateChildResponse, error) {
	nurseryID, err := uuid.Parse(req.NurseryId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse nursery ID '%s': %w", req.NurseryId, err)
	}

	guardianID, err := uuid.Parse(req.GuardianId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse guardian ID '%s': %w", req.GuardianId, err)
	}

	// トランザクションの開始
	tx, err := i.entClient.Tx(ctx)
	if err != nil {
		i.logger.Error("failed to start transaction", "error", err)
		return nil, err
	}

	// 成功した場合にロールバックを防ぐためのフラグ
	var commit bool
	defer func() {
		if !commit {
			tx.Rollback()
		}
	}()

	sex, err := utils.ConvertPbSexToEntSex(req.Sex)
	if err != nil {
		return nil, fmt.Errorf("failed to convert sex: %w", err)
	}
	age := int(req.Age)

	// 子供のレコードを作成
	child, err := tx.Child.
		Create().
		SetGuardianID(guardianID).
		SetName(req.Name).
		SetAge(age).
		SetSex(*sex).
		Save(ctx)

	if err != nil {
		return nil, fmt.Errorf("failed to create child: %w", err)
	}

	child, err = tx.Child.Query().
		Where(childRepo.IDEQ(child.ID)).
		WithGuardian().
		Only(ctx)

	// アップロードされた写真のIDを追跡するスライス
	var uploadedPhotoIDs []uuid.UUID

	// 関数終了時にアップロードされたすべての写真をクリーンアップ
	defer func() {
		// エラーが発生した場合のみクリーンアップを実行
		if err != nil {
			for _, photoID := range uploadedPhotoIDs {
				// 写真の削除に失敗した場合のエラーはログに記録するのみで、
				// 元のエラーには影響させない
				if delErr := i.deletePhotoFromGCS(ctx, nurseryID.String(), child.ID.String(), photoID.String()); delErr != nil {
					i.logger.Error("failed to delete photo from GCS", "photoID", photoID, "error", delErr)
				}
			}
		}
	}()

	// 写真のアップロードとchildPhotoレコードの作成
	for _, photoData := range req.Photos {
		photoID := uuid.New()                                // 写真に一意のIDを生成
		uploadedPhotoIDs = append(uploadedPhotoIDs, photoID) // アップロードされた写真のIDを追跡

		// 写真をGCSにアップロード
		if err := i.uploadPhotoToGCS(ctx, nurseryID.String(), child.ID.String(), photoID.String(), photoData); err != nil {
			return nil, fmt.Errorf("failed to upload photo to GCS: %w", err)
		}

		// childPhotoレコードをデータベースに作成
		_, err := tx.ChildPhoto.
			Create().
			SetID(photoID).
			SetChildID(child.ID).
			Save(ctx)

		if err != nil {
			return nil, fmt.Errorf("failed to create child photo record: %w", err)
		}
	}

	// TODO: 顔検出と切り抜きのリクエストを送信
	// res, err := i.MLServiceClient.FaceDetectAndClip(ctx, &mlv1.FaceDetectAndClipRequest{
	// 	NurseryId: nurseryID.String(),
	// 	ChildId:   child.ID.String(),
	// })

	// if !res.IsStarted && err != nil {
	// 	i.logger.Error("failed to start face detection and clipping", "error", err)
	// 	return nil, err
	// }

	// トランザクションのコミット
	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}
	commit = true // トランザクションが成功した

	return &pb.CreateChildResponse{
		Child: utils.ToPbChild(child),
	}, nil
}

func (i *Interactor) GetChildListByGuardianID(ctx context.Context, req *pb.GetChildListByGuardianIDRequest) (*pb.GetChildListByGuardianIDResponse, error) {
	guardianID, err := uuid.Parse(req.GuardianId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse guardian ID '%s': %w", req.GuardianId, err)
	}

	children, err := i.getChildList(ctx, func(tx *ent.Tx) (*ent.ChildQuery, error) {
		return tx.Child.Query().
			Where(childRepo.HasGuardianWith(guardianRepo.IDEQ(guardianID))).
			WithGuardian(), nil
	})

	if err != nil {
		return nil, err
	}

	var childPhotoList []*pb.ChildPhoto
	for _, child := range children {
		childPhotoRecordList, err := i.entClient.ChildPhoto.Query().
			Where(childPhotoRepo.HasChildWith(childRepo.IDEQ(uuid.MustParse(child.Id)))).
			All(ctx)

		if err != nil {
			i.logger.Error("failed to get child photo list", "error", err)
			return nil, err
		}

		for _, photo := range childPhotoRecordList {
			childPhotoList = append(childPhotoList, &pb.ChildPhoto{
				ChildId: child.Id,
				Id:      photo.ID.String(),
			})
		}
	}

	return &pb.GetChildListByGuardianIDResponse{
		Children: children,
		Photos:   childPhotoList}, nil
}

func (i *Interactor) GetChildListByNurseryID(ctx context.Context, req *pb.GetChildListByNurseryIDRequest) (*pb.GetChildListByNurseryIDResponse, error) {
	nurseryID, err := uuid.Parse(req.NurseryId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse nursery ID '%s': %w", req.NurseryId, err)
	}

	// 子供と保育園の間に親を介在させるためのクエリを修正
	children, err := i.getChildList(ctx, func(tx *ent.Tx) (*ent.ChildQuery, error) {
		// 子供のクエリを作成する際に、親を介した保育園の条件を追加
		return tx.Child.Query().
			Where(childRepo.HasGuardianWith(guardianRepo.HasNurseryWith(nurseryRepo.IDEQ(nurseryID)))).
			WithGuardian(), nil
	})

	if err != nil {
		i.logger.Error("failed to get children by nursery ID", "error", err)
		return nil, err
	}

	// 子供の写真を取得
	var photos []*pb.ChildPhoto
	for _, child := range children {
		photoRecordList, err := i.entClient.ChildPhoto.Query().
			Where(childPhotoRepo.HasChildWith(childRepo.IDEQ(uuid.MustParse(child.Id)))).All(ctx)

		if err != nil {
			i.logger.Error("failed to get child photo list", "error", err)
			return nil, err
		}

		for _, photo := range photoRecordList {
			photos = append(photos, &pb.ChildPhoto{
				ChildId: child.Id,
				Id:      photo.ID.String(),
			})
		}
	}

	return &pb.GetChildListByNurseryIDResponse{
		Children: children,
		Photos:   photos,
	}, nil
}

func (i *Interactor) GetChildListByBusID(ctx context.Context, req *pb.GetChildListByBusIDRequest) (*pb.GetChildListByBusIDResponse, error) {
	busID, err := uuid.Parse(req.BusId)
	if err != nil {
		return nil, fmt.Errorf("failed to parse bus ID '%s': %w", req.BusId, err)
	}

	children, err := i.getChildList(ctx, func(tx *ent.Tx) (*ent.ChildQuery, error) {
		return tx.Child.Query().
			Where(childRepo.HasChildBusAssociationsWith(childBusAssociationRepo.BusIDEQ(busID))).
			WithGuardian(), nil
	})

	if err != nil {
		i.logger.Error("failed to get children by bus ID", "error", err)
		return nil, err
	}

	// 子供の写真を取得
	var photos []*pb.ChildPhoto
	for _, child := range children {
		photoRecordList, err := i.entClient.ChildPhoto.Query().
			Where(childPhotoRepo.HasChildWith(childRepo.IDEQ(uuid.MustParse(child.Id)))).All(ctx)

		if err != nil {
			i.logger.Error("failed to get child photo list", "error", err)
			return nil, err
		}

		for _, photo := range photoRecordList {
			photos = append(photos, &pb.ChildPhoto{
				ChildId: child.Id,
				Id:      photo.ID.String(),
			})
		}
	}

	return &pb.GetChildListByBusIDResponse{
		Children: children,
		Photos:   photos,
	}, nil
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

// uploadPhotoToGCS は写真をGCPのCloud Storageにアップロードします。
func (i *Interactor) uploadPhotoToGCS(ctx context.Context, nurseryID, childID, photoID string, photo []byte) error {
	// Cloud Storage上の写真のパスを生成
	objectName := fmt.Sprintf("%s/%s/raw/%s.png", nurseryID, childID, photoID)

	// 指定したバケットにオブジェクトを作成
	wc := i.StorageClient.Bucket(i.BucketName).Object(objectName).NewWriter(ctx)

	// 写真のバイトデータを書き込む
	if _, err := wc.Write(photo); err != nil {
		return err
	}

	// ライターを閉じて、アップロードを完了させる
	if err := wc.Close(); err != nil {
		return err
	}

	return nil
}

// deletePhotoFromGCS は指定された写真IDに対応する写真をGCSから削除します。
func (i *Interactor) deletePhotoFromGCS(ctx context.Context, nurseryID, childID, photoID string) error {
	// Cloud Storage上の写真のパスを生成
	objectName := fmt.Sprintf("%s/%s/raw/%s.png", nurseryID, childID, photoID)

	// 指定したバケット内のオブジェクトを削除
	o := i.StorageClient.Bucket(i.BucketName).Object(objectName)
	if err := o.Delete(ctx); err != nil {
		return fmt.Errorf("failed to delete photo '%s' from GCS: %w", objectName, err)
	}

	return nil
}
