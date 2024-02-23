package utils

import (
	"fmt"
	"time"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"golang.org/x/exp/slog"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func convertToTimestampPb(t time.Time) *timestamppb.Timestamp {
	return timestamppb.New(t)
}

func ToPbBus(bus *ent.Bus) (*pb.Bus, error) {
	if bus.Edges.Nursery == nil {
		return nil, fmt.Errorf("bus with ID: %s requires a non-nil Nursery edge", bus.ID)
	}
	if bus.Edges.NextStation == nil {
		return nil, fmt.Errorf("bus with ID: %s requires a non-nil NextStation edge", bus.ID)
	}
	if bus.Edges.LatestMorningRoute == nil || bus.Edges.LatestEveningRoute == nil {
		return nil, fmt.Errorf("bus with ID: %s requires non-nil LatestMorningRoute and LatestEveningRoute edges", bus.ID)
	}
	// ent.Status -> pb.BusStatus
	busStatus, err := ConvertEntStatusToPbStatus(bus.Status)
	if err != nil {
		return nil, err
	}
	return &pb.Bus{
		Id:                    bus.ID.String(),
		NurseryId:             bus.Edges.Nursery.ID.String(),
		Name:                  bus.Name,
		PlateNumber:           bus.PlateNumber,
		BusStatus:             busStatus,
		Latitude:              bus.Latitude,
		Longitude:             bus.Longitude,
		EnableFaceRecognition: bus.EnableFaceRecognition,
		NextStationId:         bus.Edges.NextStation.ID.String(),
		CreatedAt:             convertToTimestampPb(bus.CreatedAt),
		UpdatedAt:             convertToTimestampPb(bus.UpdatedAt),
		LatestMorningRouteId:  bus.Edges.LatestMorningRoute.ID.String(),
		LatestEveningRouteId:  bus.Edges.LatestEveningRoute.ID.String(),
	}, nil
}

// TODO: 実装
func ToPbBusRoute(busRoute *ent.BusRoute, logger slog.Logger) (*pb.BusRoute, error) {
	logger.Error("convertBusRoute function is not implemented")
	return nil, fmt.Errorf("convertBusRoute: not implemented")
}

func ToPbChild(child *ent.Child) (*pb.Child, error) {
	if child.Edges.Guardian == nil {
		return nil, fmt.Errorf("child with ID: %s requires a non-nil Guardian edge", child.ID)
	}
	sex, err := ConvertEntSexToPbSex(child.Sex)
	if err != nil {
		return nil, err
	}
	return &pb.Child{
		Id:                   child.ID.String(),
		GuardianId:           child.Edges.Guardian.ID.String(),
		Name:                 child.Name,
		Age:                  int32(child.Age),
		Sex:                  sex,
		CheckForMissingItems: child.CheckForMissingItems,
		HasBag:               child.HasBag,
		HasLunchBox:          child.HasLunchBox,
		HasWaterBottle:       child.HasWaterBottle,
		HasUmbrella:          child.HasUmbrella,
		HasOther:             child.HasOther,
		CreatedAt:            convertToTimestampPb(child.CreatedAt),
		UpdatedAt:            convertToTimestampPb(child.UpdatedAt),
	}, nil
}

func ToPbGuardian(guardian *ent.Guardian) (*pb.GuardianResponse, error) {
	if guardian.Edges.Nursery == nil {
		return nil, fmt.Errorf("guardian with ID: %s requires a non-nil Nursery edge", guardian.ID)
	}
	return &pb.GuardianResponse{
		Id:              guardian.ID.String(),
		NurseryId:       guardian.Edges.Nursery.ID.String(),
		Email:           guardian.Email,
		PhoneNumber:     guardian.PhoneNumber,
		Name:            guardian.Name,
		IsUseMorningBus: guardian.IsUseMorningBus,
		IsUseEveningBus: guardian.IsUseEveningBus,
		CreatedAt:       convertToTimestampPb(guardian.CreatedAt),
		UpdatedAt:       convertToTimestampPb(guardian.UpdatedAt),
	}, nil
}

func ToPbNursery(nursery *ent.Nursery) (*pb.NurseryResponse, error) {
	return &pb.NurseryResponse{
		Id:          nursery.ID.String(),
		NurseryCode: nursery.NurseryCode,
		Name:        nursery.Name,
		Email:       nursery.Email,
		Address:     nursery.Address,
		PhoneNumber: nursery.PhoneNumber,
		CreatedAt:   convertToTimestampPb(nursery.CreatedAt),
		UpdatedAt:   convertToTimestampPb(nursery.UpdatedAt),
	}, nil
}

func ToPbStation(station *ent.Station) (*pb.Station, error) {
	if station.Edges.Guardian == nil {
		return nil, fmt.Errorf("station with ID: %s requires a non-nil Guardian edge", station.ID)
	}
	return &pb.Station{
		Id:         station.ID.String(),
		GuardianId: station.Edges.Guardian.ID.String(),
		Latitude:   station.Latitude,
		Longitude:  station.Longitude,
		CreatedAt:  convertToTimestampPb(station.CreatedAt),
		UpdatedAt:  convertToTimestampPb(station.UpdatedAt),
	}, nil
}
