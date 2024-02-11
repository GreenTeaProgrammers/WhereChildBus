package utils

import (
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
		HasUmbrera:           t.HasUmbrella,
		HasOther:             t.HasOther,
		CreatedAt:            &timestamppb.Timestamp{Seconds: t.CreatedAt.Unix()},
		UpdatedAt:            &timestamppb.Timestamp{Seconds: t.UpdatedAt.Unix()},
	}
}

func convertSexToPbSex(sex child.Sex) pb.Child_Sex {
	switch sex {
	case child.SexMan:
		return pb.Child_SEX_MAN
	case child.SexWomen:
		return pb.Child_SEX_WOMEN
	case child.SexOther:
		return pb.Child_SEX_OTHER
	default:
		return pb.Child_SEX_UNSPECIFIED
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

func convertStatusToPbStatus(status bus.Status) pb.Bus_Status {
	switch status {
	case bus.StatusRunning:
		return pb.Bus_STATUS_RUNNING
	case bus.StatusStopped:
		return pb.Bus_STATUS_STOPPED
	default:
		return pb.Bus_STATUS_UNSPECIFIED
	}
}
