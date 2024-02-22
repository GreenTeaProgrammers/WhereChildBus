package utils

import (
	"context"
	"database/sql"
	"fmt"

	"golang.org/x/exp/slog"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/config"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"golang.org/x/crypto/bcrypt"
	"google.golang.org/protobuf/types/known/timestamppb"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	busRouteRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
)

func ToPbChild(t *ent.Child) *pb.Child {
	sex := convertSexToPbSex(t.Sex)
	return &pb.Child{
		Id:                   t.ID.String(),
		GuardianId:           t.Edges.Guardian.ID.String(),
		Name:                 t.Name,
		Age:                  int32(t.Age),
		Sex:                  sex,
		CheckForMissingItems: t.CheckForMissingItems,
		HasBag:               t.HasBag,
		HasLunchBox:          t.HasLunchBox,
		HasWaterBottle:       t.HasWaterBottle,
		HasUmbrella:          t.HasUmbrella,
		HasOther:             t.HasOther,
		CreatedAt:            &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:            &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
	}
}

func convertSexToPbSex(sex child.Sex) pb.Sex {
	switch sex {
	case child.SexMan:
		return pb.Sex_SEX_MAN
	case child.SexWoman:
		return pb.Sex_SEX_WOMAN
	case child.SexOther:
		return pb.Sex_SEX_OTHER
	default:
		return pb.Sex_SEX_UNSPECIFIED
	}
}

func ConvertPbStatusToEntStatus(pbStatus pb.BusStatus) (*busRepo.Status, error) {
	switch pbStatus {
	case pb.BusStatus_BUS_STATUS_RUNNING:
		status := busRepo.StatusRunning
		return &status, nil
	case pb.BusStatus_BUS_STATUS_STOPPED:
		status := busRepo.StatusStopped
		return &status, nil
	case pb.BusStatus_BUS_STATUS_MAINTENANCE:
		status := busRepo.StatusMaintenance
		return &status, nil
	default:
		// 不正な値の場合はエラーを返す
		return nil, fmt.Errorf("invalid Status value: %v", pbStatus)
	}
}

func ToPbBus(t *ent.Bus, nextStationID string) *pb.Bus {
	busStatus := convertStatusToPbStatus(t.Status)
	return &pb.Bus{
		Id:                    t.ID.String(),
		NurseryId:             t.Edges.Nursery.ID.String(),
		Name:                  t.Name,
		PlateNumber:           t.PlateNumber,
		BusStatus:             busStatus,
		Latitude:              t.Latitude,
		Longitude:             t.Longitude,
		EnableFaceRecognition: t.EnableFaceRecognition,
		NextStationId:         nextStationID,
		CreatedAt:             &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:             &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
		// ? 最新のバスルートも含める?
	}
}

func ConvertPbSexToEntSex(pbSex pb.Sex) (*child.Sex, error) {
	switch pbSex {
	case pb.Sex_SEX_MAN:
		sex := child.SexMan
		return &sex, nil
	case pb.Sex_SEX_WOMAN:
		sex := child.SexWoman
		return &sex, nil
	case pb.Sex_SEX_OTHER:
		sex := child.SexOther
		return &sex, nil
	default:
		// 不正な値の場合はエラーを返す
		return nil, fmt.Errorf("invalid Sex value: %v", pbSex)
	}
}

func convertStatusToPbStatus(status busRepo.Status) pb.BusStatus {
	switch status {
	case busRepo.StatusRunning:
		return pb.BusStatus_BUS_STATUS_RUNNING
	case busRepo.StatusStopped:
		return pb.BusStatus_BUS_STATUS_STOPPED
	case busRepo.StatusMaintenance:
		return pb.BusStatus_BUS_STATUS_MAINTENANCE
	default:
		return pb.BusStatus_BUS_STATUS_UNSPECIFIED
	}
}

func ToPbGuardianResponse(t *ent.Guardian) *pb.GuardianResponse {
	return &pb.GuardianResponse{
		Id:              t.ID.String(),
		NurseryId:       t.Edges.Nursery.ID.String(),
		Email:           t.Email,
		PhoneNumber:     t.PhoneNumber,
		Name:            t.Name,
		IsUseMorningBus: t.IsUseMorningBus,
		IsUseEveningBus: t.IsUseEveningBus,
		CreatedAt:       &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:       &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
	}
}

func ToPbNurseryResponse(t *ent.Nursery) *pb.NurseryResponse {
	return &pb.NurseryResponse{
		Id:          t.ID.String(),
		NurseryCode: t.NurseryCode,
		Name:        t.Name,
		Email:       t.Email,
		Address:     t.Address,
		PhoneNumber: t.PhoneNumber,
		CreatedAt:   &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:   &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
	}
}

func ToPbStation(t *ent.Station) *pb.Station {
	return &pb.Station{
		Id:         t.ID.String(),
		GuardianId: t.Edges.Guardian.ID.String(),
		Latitude:   t.Latitude,
		Longitude:  t.Longitude,
		CreatedAt:  &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:  &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
	}
}

func ToPbBusRoute(t *ent.BusRoute) *pb.BusRoute {
	busType := ConvertBusTypeToPbBusType(t.BusType)
	return &pb.BusRoute{
		Id:      t.ID.String(),
		BusType: busType,
	}
}

func ConvertBusTypeToPbBusType(busType busRouteRepo.BusType) pb.BusType {
	switch busType {
	case busRouteRepo.BusTypeMorning:
		return pb.BusType_BUS_TYPE_MORNING
	case busRouteRepo.BusTypeEvening:
		return pb.BusType_BUS_TYPE_EVENING
	default:
		return pb.BusType_BUS_TYPE_UNSPECIFIED
	}
}

func ConvertPbBusTypeToEntBusType(pbBusType pb.BusType) (*busRouteRepo.BusType, error) {
	switch pbBusType {
	case pb.BusType_BUS_TYPE_MORNING:
		busType := busRouteRepo.BusTypeMorning
		return &busType, nil
	case pb.BusType_BUS_TYPE_EVENING:
		busType := busRouteRepo.BusTypeEvening
		return &busType, nil
	default:
		// 不正な値の場合はエラーを返す
		return nil, fmt.Errorf("invalid BusType value: %v", pbBusType)
	}
}

func HashPassword(password string) (string, error) {
	// 環境変数からペッパーを取得
	config, _ := config.New()
	pepper := config.PasswordPepper

	// パスワードにペッパーを追加
	passwordWithPepper := password + pepper

	// ハッシュ計算のコストを増やす（例: bcrypt.MinCost + 5）
	cost := bcrypt.MinCost + 5
	if cost > bcrypt.MaxCost {
		cost = bcrypt.MaxCost
	}

	// ペッパーを追加したパスワードをハッシュ化
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(passwordWithPepper), cost)
	if err != nil {
		return "", fmt.Errorf("failed to hash password: %w", err)
	}
	return string(hashedPassword), nil
}

// ハッシュ化されたパスワードと送られてきたパスワードを比較
func CheckPassword(hashedPassword string, plainPassword string) bool {
	config, _ := config.New()
	pepper := config.PasswordPepper

	//パスワードにペッパーを追加
	passwordWithPepper := plainPassword + pepper

	err := bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(passwordWithPepper))
	return err == nil
}

// RollbackTx はトランザクションのロールバックを試み、エラーがあればロギングします。
func RollbackTx(tx *ent.Tx, logger *slog.Logger) {
	// txがコミット済みの場合はロールバックしない
	if tx == nil {
		logger.Error("failed to rollback transaction", "error", "tx is nil")
		return
	}
	if err := tx.Rollback(); err != nil {
		if err != sql.ErrTxDone {
			logger.Error("failed to rollback transaction", "error", err)
		}
	}
}

func CheckAndFixBusStationCoordinates(logger slog.Logger, ctx context.Context, bus *ent.Bus) (is_ready bool, err error) {
	// バスのステーションを取得
	stations, err := bus.QueryBusRoute().QueryBusRouteAssociations().QueryStation().All(ctx) // !要チェック
	if err != nil {
		logger.Error("failed to get stations", "error", err)
		return false, err
	}

	// ステーションの座標を修正
	for _, station := range stations {
		// ステーションの座標が登録されていない場合は、バスのステータスをメンテナンスに設定
		if station.Latitude == 0 || station.Longitude == 0 {
			_, err := bus.Update().
				SetStatus(busRepo.StatusMaintenance).
				Save(ctx)
			if err != nil {
				logger.Error("failed to update bus status to maintenance due to missing station coordinates", "error", err)
				return false, err
			}
			return false, nil
		}

	}
	// Stationは正しく設定されているので、バスのステータスを訂正
	if bus.Status == busRepo.StatusMaintenance {
		print("バスのステータスを訂正します")
		_, err := bus.Update().SetStatus(busRepo.StatusStopped).Save(ctx)
		if err != nil {
			logger.Error("failed to update bus", "error", err)
			return false, err
		}
	}
	return true, nil
}
