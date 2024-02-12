package utils

import (
	"fmt"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"google.golang.org/protobuf/types/known/timestamppb"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
)

func ToPbChild(t *ent.Child) *pb.Child {
	sex := convertSexToPbSex(t.Sex)
	return &pb.Child{
		Id:                   t.ID.String(),
		NurseryId:            t.Edges.Nursery.ID.String(),
		GuardianId:           t.Edges.Guardian.ID.String(),
		Name:                 t.Name,
		Age:                  int32(t.Age),
		Sex:                  sex,
		IsRideMorningBus:     t.IsRideMorningBus,
		IsRideEveningBus:     t.IsRideEveningBus,
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

func ToPbBus(t *ent.Bus) *pb.Bus {
	status := convertStatusToPbStatus(t.Status)
	return &pb.Bus{
		Id:          t.ID.String(),
		NurseryId:   t.Edges.Nursery.ID.String(),
		Name:        t.Name,
		PlateNumber: t.PlateNumber,
		Latitude:    t.Latitude,
		Longitude:   t.Longitude,
		Status:      status,
		CreatedAt:   &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:   &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
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
		Id:          t.ID.String(),
		NurseryId:   t.Edges.Nursery.ID.String(),
		Email:       t.Email,
		PhoneNumber: t.PhoneNumber,
		Name:        t.Name,
		CreatedAt:   &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:   &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
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
