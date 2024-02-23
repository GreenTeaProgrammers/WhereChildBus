package utils

import (
	"fmt"

	busRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/bus"
	busRouteRepo "github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/busroute"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent/child"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
)

func ConvertEntSexToPbSex(sex child.Sex) (pb.Sex, error) {
	switch sex {
	case child.SexMan:
		return pb.Sex_SEX_MAN, nil
	case child.SexWoman:
		return pb.Sex_SEX_WOMAN, nil
	case child.SexOther:
		return pb.Sex_SEX_OTHER, nil
	default:
		return 0, fmt.Errorf("convertSexToPbSex: invalid child.Sex value: %v", sex)
	}
}

func ConvertPbSexToEntSex(pbSex pb.Sex) (child.Sex, error) {
	switch pbSex {
	case pb.Sex_SEX_MAN:
		return child.SexMan, nil
	case pb.Sex_SEX_WOMAN:
		return child.SexWoman, nil
	case pb.Sex_SEX_OTHER:
		return child.SexOther, nil
	default:
		return "", fmt.Errorf("ConvertPbSexToEntSex: invalid pb.Sex value: %v", pbSex)
	}
}

func ConvertPbStatusToEntStatus(pbStatus pb.BusStatus) (busRepo.Status, error) {
	switch pbStatus {
	case pb.BusStatus_BUS_STATUS_RUNNING:
		return busRepo.StatusRunning, nil
	case pb.BusStatus_BUS_STATUS_STOPPED:
		return busRepo.StatusStopped, nil
	case pb.BusStatus_BUS_STATUS_MAINTENANCE:
		return busRepo.StatusMaintenance, nil
	default:
		return "", fmt.Errorf("ConvertPbStatusToEntStatus: invalid pb.BusStatus value: %v", pbStatus)
	}
}

func ConvertEntStatusToPbStatus(status busRepo.Status) (pb.BusStatus, error) {
	switch status {
	case busRepo.StatusRunning:
		return pb.BusStatus_BUS_STATUS_RUNNING, nil
	case busRepo.StatusStopped:
		return pb.BusStatus_BUS_STATUS_STOPPED, nil
	case busRepo.StatusMaintenance:
		return pb.BusStatus_BUS_STATUS_MAINTENANCE, nil
	default:
		return 0, fmt.Errorf("convertStatusToPbStatus: invalid busRepo.Status value: %v", status)
	}
}

func ConvertEntBusTypeToPbBusType(busType busRouteRepo.BusType) (pb.BusType, error) {
	switch busType {
	case busRouteRepo.BusTypeMorning:
		return pb.BusType_BUS_TYPE_MORNING, nil
	case busRouteRepo.BusTypeEvening:
		return pb.BusType_BUS_TYPE_EVENING, nil
	default:
		return 0, fmt.Errorf("ConvertBusTypeToPbBusType: invalid busRouteRepo.BusType value: %v", busType)
	}
}

func ConvertPbBusTypeToEntBusType(pbBusType pb.BusType) (busRouteRepo.BusType, error) {
	switch pbBusType {
	case pb.BusType_BUS_TYPE_MORNING:
		return busRouteRepo.BusTypeMorning, nil
	case pb.BusType_BUS_TYPE_EVENING:
		return busRouteRepo.BusTypeEvening, nil
	default:
		return "", fmt.Errorf("ConvertPbBusTypeToEntBusType: invalid pb.BusType value: %v", pbBusType)
	}
}
