// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.32.0
// 	protoc        (unknown)
// source: where_child_bus/v1/station.proto

package where_child_busv1

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	fieldmaskpb "google.golang.org/protobuf/types/known/fieldmaskpb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type UpdateStationLocationByGuardianIdRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	GuardianId string  `protobuf:"bytes,1,opt,name=guardian_id,json=guardianId,proto3" json:"guardian_id,omitempty"`
	Longitude  float64 `protobuf:"fixed64,2,opt,name=longitude,proto3" json:"longitude,omitempty"`
	Latitude   float64 `protobuf:"fixed64,3,opt,name=latitude,proto3" json:"latitude,omitempty"`
}

func (x *UpdateStationLocationByGuardianIdRequest) Reset() {
	*x = UpdateStationLocationByGuardianIdRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_station_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateStationLocationByGuardianIdRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateStationLocationByGuardianIdRequest) ProtoMessage() {}

func (x *UpdateStationLocationByGuardianIdRequest) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_station_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateStationLocationByGuardianIdRequest.ProtoReflect.Descriptor instead.
func (*UpdateStationLocationByGuardianIdRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_station_proto_rawDescGZIP(), []int{0}
}

func (x *UpdateStationLocationByGuardianIdRequest) GetGuardianId() string {
	if x != nil {
		return x.GuardianId
	}
	return ""
}

func (x *UpdateStationLocationByGuardianIdRequest) GetLongitude() float64 {
	if x != nil {
		return x.Longitude
	}
	return 0
}

func (x *UpdateStationLocationByGuardianIdRequest) GetLatitude() float64 {
	if x != nil {
		return x.Latitude
	}
	return 0
}

type UpdateStationLocationByGuardianIdResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Station *Station `protobuf:"bytes,1,opt,name=station,proto3" json:"station,omitempty"`
}

func (x *UpdateStationLocationByGuardianIdResponse) Reset() {
	*x = UpdateStationLocationByGuardianIdResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_station_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateStationLocationByGuardianIdResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateStationLocationByGuardianIdResponse) ProtoMessage() {}

func (x *UpdateStationLocationByGuardianIdResponse) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_station_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateStationLocationByGuardianIdResponse.ProtoReflect.Descriptor instead.
func (*UpdateStationLocationByGuardianIdResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_station_proto_rawDescGZIP(), []int{1}
}

func (x *UpdateStationLocationByGuardianIdResponse) GetStation() *Station {
	if x != nil {
		return x.Station
	}
	return nil
}

type GetStationListByBusIdRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	BusId string `protobuf:"bytes,1,opt,name=bus_id,json=busId,proto3" json:"bus_id,omitempty"`
}

func (x *GetStationListByBusIdRequest) Reset() {
	*x = GetStationListByBusIdRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_station_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetStationListByBusIdRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetStationListByBusIdRequest) ProtoMessage() {}

func (x *GetStationListByBusIdRequest) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_station_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetStationListByBusIdRequest.ProtoReflect.Descriptor instead.
func (*GetStationListByBusIdRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_station_proto_rawDescGZIP(), []int{2}
}

func (x *GetStationListByBusIdRequest) GetBusId() string {
	if x != nil {
		return x.BusId
	}
	return ""
}

type GetStationListByBusIdResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Stations  []*Station          `protobuf:"bytes,1,rep,name=stations,proto3" json:"stations,omitempty"`
	Guardians []*GuardianResponse `protobuf:"bytes,2,rep,name=guardians,proto3" json:"guardians,omitempty"`
	Children  []*Child            `protobuf:"bytes,3,rep,name=children,proto3" json:"children,omitempty"`
	Photos    []*ChildPhoto       `protobuf:"bytes,4,rep,name=photos,proto3" json:"photos,omitempty"`
}

func (x *GetStationListByBusIdResponse) Reset() {
	*x = GetStationListByBusIdResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_station_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetStationListByBusIdResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetStationListByBusIdResponse) ProtoMessage() {}

func (x *GetStationListByBusIdResponse) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_station_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetStationListByBusIdResponse.ProtoReflect.Descriptor instead.
func (*GetStationListByBusIdResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_station_proto_rawDescGZIP(), []int{3}
}

func (x *GetStationListByBusIdResponse) GetStations() []*Station {
	if x != nil {
		return x.Stations
	}
	return nil
}

func (x *GetStationListByBusIdResponse) GetGuardians() []*GuardianResponse {
	if x != nil {
		return x.Guardians
	}
	return nil
}

func (x *GetStationListByBusIdResponse) GetChildren() []*Child {
	if x != nil {
		return x.Children
	}
	return nil
}

func (x *GetStationListByBusIdResponse) GetPhotos() []*ChildPhoto {
	if x != nil {
		return x.Photos
	}
	return nil
}

type UpdateStationRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id           string                 `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Latitude     float64                `protobuf:"fixed64,5,opt,name=latitude,proto3" json:"latitude,omitempty"`
	Longitude    float64                `protobuf:"fixed64,6,opt,name=longitude,proto3" json:"longitude,omitempty"`
	MorningOrder int32                  `protobuf:"varint,7,opt,name=morning_order,json=morningOrder,proto3" json:"morning_order,omitempty"`
	EveningOrder int32                  `protobuf:"varint,8,opt,name=evening_order,json=eveningOrder,proto3" json:"evening_order,omitempty"`
	UpdateMask   *fieldmaskpb.FieldMask `protobuf:"bytes,9,opt,name=update_mask,json=updateMask,proto3" json:"update_mask,omitempty"`
}

func (x *UpdateStationRequest) Reset() {
	*x = UpdateStationRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_station_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateStationRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateStationRequest) ProtoMessage() {}

func (x *UpdateStationRequest) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_station_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateStationRequest.ProtoReflect.Descriptor instead.
func (*UpdateStationRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_station_proto_rawDescGZIP(), []int{4}
}

func (x *UpdateStationRequest) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *UpdateStationRequest) GetLatitude() float64 {
	if x != nil {
		return x.Latitude
	}
	return 0
}

func (x *UpdateStationRequest) GetLongitude() float64 {
	if x != nil {
		return x.Longitude
	}
	return 0
}

func (x *UpdateStationRequest) GetMorningOrder() int32 {
	if x != nil {
		return x.MorningOrder
	}
	return 0
}

func (x *UpdateStationRequest) GetEveningOrder() int32 {
	if x != nil {
		return x.EveningOrder
	}
	return 0
}

func (x *UpdateStationRequest) GetUpdateMask() *fieldmaskpb.FieldMask {
	if x != nil {
		return x.UpdateMask
	}
	return nil
}

type UpdateStationResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Station *Station `protobuf:"bytes,1,opt,name=station,proto3" json:"station,omitempty"`
}

func (x *UpdateStationResponse) Reset() {
	*x = UpdateStationResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_station_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateStationResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateStationResponse) ProtoMessage() {}

func (x *UpdateStationResponse) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_station_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateStationResponse.ProtoReflect.Descriptor instead.
func (*UpdateStationResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_station_proto_rawDescGZIP(), []int{5}
}

func (x *UpdateStationResponse) GetStation() *Station {
	if x != nil {
		return x.Station
	}
	return nil
}

var File_where_child_bus_v1_station_proto protoreflect.FileDescriptor

var file_where_child_bus_v1_station_proto_rawDesc = []byte{
	0x0a, 0x20, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75,
	0x73, 0x2f, 0x76, 0x31, 0x2f, 0x73, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x12, 0x12, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f,
	0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x1a, 0x22, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68,
	0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2f, 0x76, 0x31, 0x2f, 0x72, 0x65, 0x73, 0x6f, 0x75,
	0x72, 0x63, 0x65, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x20, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x66, 0x69, 0x65, 0x6c,
	0x64, 0x5f, 0x6d, 0x61, 0x73, 0x6b, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x85, 0x01, 0x0a,
	0x28, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x6f,
	0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e,
	0x49, 0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1f, 0x0a, 0x0b, 0x67, 0x75, 0x61,
	0x72, 0x64, 0x69, 0x61, 0x6e, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a,
	0x67, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x64, 0x12, 0x1c, 0x0a, 0x09, 0x6c, 0x6f,
	0x6e, 0x67, 0x69, 0x74, 0x75, 0x64, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x01, 0x52, 0x09, 0x6c,
	0x6f, 0x6e, 0x67, 0x69, 0x74, 0x75, 0x64, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x6c, 0x61, 0x74, 0x69,
	0x74, 0x75, 0x64, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x01, 0x52, 0x08, 0x6c, 0x61, 0x74, 0x69,
	0x74, 0x75, 0x64, 0x65, 0x22, 0x62, 0x0a, 0x29, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74,
	0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x79, 0x47,
	0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x35, 0x0a, 0x07, 0x73, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x0b, 0x32, 0x1b, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64,
	0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52,
	0x07, 0x73, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x22, 0x35, 0x0a, 0x1c, 0x47, 0x65, 0x74, 0x53,
	0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x42, 0x75, 0x73, 0x49,
	0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x15, 0x0a, 0x06, 0x62, 0x75, 0x73, 0x5f,
	0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x62, 0x75, 0x73, 0x49, 0x64, 0x22,
	0x8b, 0x02, 0x0a, 0x1d, 0x47, 0x65, 0x74, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x69,
	0x73, 0x74, 0x42, 0x79, 0x42, 0x75, 0x73, 0x49, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x37, 0x0a, 0x08, 0x73, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x18, 0x01, 0x20,
	0x03, 0x28, 0x0b, 0x32, 0x1b, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c,
	0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x52, 0x08, 0x73, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x12, 0x42, 0x0a, 0x09, 0x67, 0x75,
	0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x73, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x24, 0x2e,
	0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e,
	0x76, 0x31, 0x2e, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x52, 0x09, 0x67, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x73, 0x12, 0x35,
	0x0a, 0x08, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x72, 0x65, 0x6e, 0x18, 0x03, 0x20, 0x03, 0x28, 0x0b,
	0x32, 0x19, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62,
	0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x08, 0x63, 0x68, 0x69,
	0x6c, 0x64, 0x72, 0x65, 0x6e, 0x12, 0x36, 0x0a, 0x06, 0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73, 0x18,
	0x04, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x1e, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68,
	0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64,
	0x50, 0x68, 0x6f, 0x74, 0x6f, 0x52, 0x06, 0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73, 0x22, 0xe7, 0x01,
	0x0a, 0x14, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x12, 0x1a, 0x0a, 0x08, 0x6c, 0x61, 0x74, 0x69, 0x74, 0x75,
	0x64, 0x65, 0x18, 0x05, 0x20, 0x01, 0x28, 0x01, 0x52, 0x08, 0x6c, 0x61, 0x74, 0x69, 0x74, 0x75,
	0x64, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x6c, 0x6f, 0x6e, 0x67, 0x69, 0x74, 0x75, 0x64, 0x65, 0x18,
	0x06, 0x20, 0x01, 0x28, 0x01, 0x52, 0x09, 0x6c, 0x6f, 0x6e, 0x67, 0x69, 0x74, 0x75, 0x64, 0x65,
	0x12, 0x23, 0x0a, 0x0d, 0x6d, 0x6f, 0x72, 0x6e, 0x69, 0x6e, 0x67, 0x5f, 0x6f, 0x72, 0x64, 0x65,
	0x72, 0x18, 0x07, 0x20, 0x01, 0x28, 0x05, 0x52, 0x0c, 0x6d, 0x6f, 0x72, 0x6e, 0x69, 0x6e, 0x67,
	0x4f, 0x72, 0x64, 0x65, 0x72, 0x12, 0x23, 0x0a, 0x0d, 0x65, 0x76, 0x65, 0x6e, 0x69, 0x6e, 0x67,
	0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x18, 0x08, 0x20, 0x01, 0x28, 0x05, 0x52, 0x0c, 0x65, 0x76,
	0x65, 0x6e, 0x69, 0x6e, 0x67, 0x4f, 0x72, 0x64, 0x65, 0x72, 0x12, 0x3b, 0x0a, 0x0b, 0x75, 0x70,
	0x64, 0x61, 0x74, 0x65, 0x5f, 0x6d, 0x61, 0x73, 0x6b, 0x18, 0x09, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2e, 0x46, 0x69, 0x65, 0x6c, 0x64, 0x4d, 0x61, 0x73, 0x6b, 0x52, 0x0a, 0x75, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x4d, 0x61, 0x73, 0x6b, 0x22, 0x4e, 0x0a, 0x15, 0x55, 0x70, 0x64, 0x61, 0x74,
	0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x35, 0x0a, 0x07, 0x73, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x1b, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f,
	0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x07,
	0x73, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x32, 0x97, 0x03, 0x0a, 0x0e, 0x53, 0x74, 0x61, 0x74,
	0x69, 0x6f, 0x6e, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0xa0, 0x01, 0x0a, 0x21, 0x55,
	0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x6f, 0x63, 0x61,
	0x74, 0x69, 0x6f, 0x6e, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x64,
	0x12, 0x3c, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62,
	0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x61, 0x74,
	0x69, 0x6f, 0x6e, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x79, 0x47, 0x75, 0x61,
	0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x3d,
	0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73,
	0x2e, 0x76, 0x31, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f,
	0x6e, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64,
	0x69, 0x61, 0x6e, 0x49, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x7c, 0x0a,
	0x15, 0x47, 0x65, 0x74, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x42,
	0x79, 0x42, 0x75, 0x73, 0x49, 0x64, 0x12, 0x30, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63,
	0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x53,
	0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x42, 0x75, 0x73, 0x49,
	0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x31, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65,
	0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65,
	0x74, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x42, 0x75,
	0x73, 0x49, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x64, 0x0a, 0x0d, 0x55,
	0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x28, 0x2e, 0x77,
	0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76,
	0x31, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x29, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63,
	0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x70, 0x64, 0x61,
	0x74, 0x65, 0x53, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x42, 0xef, 0x01, 0x0a, 0x16, 0x63, 0x6f, 0x6d, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f,
	0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x42, 0x0c, 0x53, 0x74,
	0x61, 0x74, 0x69, 0x6f, 0x6e, 0x50, 0x72, 0x6f, 0x74, 0x6f, 0x50, 0x01, 0x5a, 0x66, 0x67, 0x69,
	0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x47, 0x72, 0x65, 0x65, 0x6e, 0x54, 0x65,
	0x61, 0x50, 0x72, 0x6f, 0x67, 0x72, 0x61, 0x6d, 0x6d, 0x65, 0x72, 0x73, 0x2f, 0x57, 0x68, 0x65,
	0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x2f, 0x62, 0x61, 0x63, 0x6b, 0x65,
	0x6e, 0x64, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2d, 0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f, 0x2f,
	0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2f,
	0x76, 0x31, 0x3b, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62,
	0x75, 0x73, 0x76, 0x31, 0xa2, 0x02, 0x03, 0x57, 0x58, 0x58, 0xaa, 0x02, 0x10, 0x57, 0x68, 0x65,
	0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x2e, 0x56, 0x31, 0xca, 0x02, 0x10,
	0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x5c, 0x56, 0x31,
	0xe2, 0x02, 0x1c, 0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73,
	0x5c, 0x56, 0x31, 0x5c, 0x47, 0x50, 0x42, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0xea,
	0x02, 0x11, 0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x3a,
	0x3a, 0x56, 0x31, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_where_child_bus_v1_station_proto_rawDescOnce sync.Once
	file_where_child_bus_v1_station_proto_rawDescData = file_where_child_bus_v1_station_proto_rawDesc
)

func file_where_child_bus_v1_station_proto_rawDescGZIP() []byte {
	file_where_child_bus_v1_station_proto_rawDescOnce.Do(func() {
		file_where_child_bus_v1_station_proto_rawDescData = protoimpl.X.CompressGZIP(file_where_child_bus_v1_station_proto_rawDescData)
	})
	return file_where_child_bus_v1_station_proto_rawDescData
}

var file_where_child_bus_v1_station_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_where_child_bus_v1_station_proto_goTypes = []interface{}{
	(*UpdateStationLocationByGuardianIdRequest)(nil),  // 0: where_child_bus.v1.UpdateStationLocationByGuardianIdRequest
	(*UpdateStationLocationByGuardianIdResponse)(nil), // 1: where_child_bus.v1.UpdateStationLocationByGuardianIdResponse
	(*GetStationListByBusIdRequest)(nil),              // 2: where_child_bus.v1.GetStationListByBusIdRequest
	(*GetStationListByBusIdResponse)(nil),             // 3: where_child_bus.v1.GetStationListByBusIdResponse
	(*UpdateStationRequest)(nil),                      // 4: where_child_bus.v1.UpdateStationRequest
	(*UpdateStationResponse)(nil),                     // 5: where_child_bus.v1.UpdateStationResponse
	(*Station)(nil),                                   // 6: where_child_bus.v1.Station
	(*GuardianResponse)(nil),                          // 7: where_child_bus.v1.GuardianResponse
	(*Child)(nil),                                     // 8: where_child_bus.v1.Child
	(*ChildPhoto)(nil),                                // 9: where_child_bus.v1.ChildPhoto
	(*fieldmaskpb.FieldMask)(nil),                     // 10: google.protobuf.FieldMask
}
var file_where_child_bus_v1_station_proto_depIdxs = []int32{
	6,  // 0: where_child_bus.v1.UpdateStationLocationByGuardianIdResponse.station:type_name -> where_child_bus.v1.Station
	6,  // 1: where_child_bus.v1.GetStationListByBusIdResponse.stations:type_name -> where_child_bus.v1.Station
	7,  // 2: where_child_bus.v1.GetStationListByBusIdResponse.guardians:type_name -> where_child_bus.v1.GuardianResponse
	8,  // 3: where_child_bus.v1.GetStationListByBusIdResponse.children:type_name -> where_child_bus.v1.Child
	9,  // 4: where_child_bus.v1.GetStationListByBusIdResponse.photos:type_name -> where_child_bus.v1.ChildPhoto
	10, // 5: where_child_bus.v1.UpdateStationRequest.update_mask:type_name -> google.protobuf.FieldMask
	6,  // 6: where_child_bus.v1.UpdateStationResponse.station:type_name -> where_child_bus.v1.Station
	0,  // 7: where_child_bus.v1.StationService.UpdateStationLocationByGuardianId:input_type -> where_child_bus.v1.UpdateStationLocationByGuardianIdRequest
	2,  // 8: where_child_bus.v1.StationService.GetStationListByBusId:input_type -> where_child_bus.v1.GetStationListByBusIdRequest
	4,  // 9: where_child_bus.v1.StationService.UpdateStation:input_type -> where_child_bus.v1.UpdateStationRequest
	1,  // 10: where_child_bus.v1.StationService.UpdateStationLocationByGuardianId:output_type -> where_child_bus.v1.UpdateStationLocationByGuardianIdResponse
	3,  // 11: where_child_bus.v1.StationService.GetStationListByBusId:output_type -> where_child_bus.v1.GetStationListByBusIdResponse
	5,  // 12: where_child_bus.v1.StationService.UpdateStation:output_type -> where_child_bus.v1.UpdateStationResponse
	10, // [10:13] is the sub-list for method output_type
	7,  // [7:10] is the sub-list for method input_type
	7,  // [7:7] is the sub-list for extension type_name
	7,  // [7:7] is the sub-list for extension extendee
	0,  // [0:7] is the sub-list for field type_name
}

func init() { file_where_child_bus_v1_station_proto_init() }
func file_where_child_bus_v1_station_proto_init() {
	if File_where_child_bus_v1_station_proto != nil {
		return
	}
	file_where_child_bus_v1_resources_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_where_child_bus_v1_station_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateStationLocationByGuardianIdRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_where_child_bus_v1_station_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateStationLocationByGuardianIdResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_where_child_bus_v1_station_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetStationListByBusIdRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_where_child_bus_v1_station_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetStationListByBusIdResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_where_child_bus_v1_station_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateStationRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_where_child_bus_v1_station_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateStationResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_where_child_bus_v1_station_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_where_child_bus_v1_station_proto_goTypes,
		DependencyIndexes: file_where_child_bus_v1_station_proto_depIdxs,
		MessageInfos:      file_where_child_bus_v1_station_proto_msgTypes,
	}.Build()
	File_where_child_bus_v1_station_proto = out.File
	file_where_child_bus_v1_station_proto_rawDesc = nil
	file_where_child_bus_v1_station_proto_goTypes = nil
	file_where_child_bus_v1_station_proto_depIdxs = nil
}
