package utils

import (
	"fmt"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/config"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"golang.org/x/crypto/bcrypt"
	"google.golang.org/protobuf/types/known/timestamppb"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
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

func ConvertPbStatusToEntStatus(pbStatus pb.Status) (*bus.Status, error) {
        switch pbStatus {
        case pb.Status_STATUS_RUNNING:
                status := bus.StatusRunning
                return &status, nil
        case pb.Status_STATUS_STOPPED:
                status := bus.StatusStopped
                return &status, nil
        default:
                // 不正な値の場合はエラーを返す
                return nil, fmt.Errorf("invalid Status value: %v", pbStatus)
        }
}

func ToPbBus(t *ent.Bus) *pb.Bus {
	status := convertStatusToPbStatus(t.Status)
	return &pb.Bus{
		Id:                    t.ID.String(),
		NurseryId:             t.Edges.Nursery.ID.String(),
		Name:                  t.Name,
		PlateNumber:           t.PlateNumber,
		Status:                status,
		Latitude:              t.Latitude,
		Longitude:             t.Longitude,
		EnableFaceRecognition: t.EnableFaceRecognition,
		CreatedAt:             &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:             &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
	}
}

func ConvertPbSexToEntSex(pbSex pb.Sex) (*child.Sex, error) {
	switch pbSex {
	case pb.Sex_SEX_MAN:
		sex := child.SexMan
		return &sex, nil
	case pb.Sex_SEX_WOMAN: // 修正: WOMEN -> WOMAN
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

func convertStatusToPbStatus(status bus.Status) pb.Status {
	switch status {
	case bus.StatusRunning:
		return pb.Status_STATUS_RUNNING
	case bus.StatusStopped:
		return pb.Status_STATUS_STOPPED
	default:
		return pb.Status_STATUS_UNSPECIFIED
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

func ToPbStation(t *ent.Station, morningNextStationID, eveningNextStationID string) *pb.Station {
	return &pb.Station{
		Id:                   t.ID.String(),
		GuardianId:           t.Edges.Guardian.ID.String(),
		MorningNextStationId: morningNextStationID,
		EveningNextStationId: eveningNextStationID,
		Latitude:             t.Latitude,
		Longitude:            t.Longitude,
		CreatedAt:            &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:            &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
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
