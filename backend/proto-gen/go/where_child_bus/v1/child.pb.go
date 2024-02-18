// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.32.0
// 	protoc        (unknown)
// source: where_child_bus/v1/child.proto

package where_child_busv1

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type CreateChildRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	NurseryId  string   `protobuf:"bytes,1,opt,name=nursery_id,json=nurseryId,proto3" json:"nursery_id,omitempty"`
	GuardianId string   `protobuf:"bytes,2,opt,name=guardian_id,json=guardianId,proto3" json:"guardian_id,omitempty"`
	Name       string   `protobuf:"bytes,3,opt,name=name,proto3" json:"name,omitempty"`
	Age        int32    `protobuf:"varint,4,opt,name=age,proto3" json:"age,omitempty"`
	Sex        Sex      `protobuf:"varint,5,opt,name=sex,proto3,enum=where_child_bus.v1.Sex" json:"sex,omitempty"`
	Photos     [][]byte `protobuf:"bytes,6,rep,name=photos,proto3" json:"photos,omitempty"`
}

func (x *CreateChildRequest) Reset() {
	*x = CreateChildRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateChildRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateChildRequest) ProtoMessage() {}

func (x *CreateChildRequest) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateChildRequest.ProtoReflect.Descriptor instead.
func (*CreateChildRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{0}
}

func (x *CreateChildRequest) GetNurseryId() string {
	if x != nil {
		return x.NurseryId
	}
	return ""
}

func (x *CreateChildRequest) GetGuardianId() string {
	if x != nil {
		return x.GuardianId
	}
	return ""
}

func (x *CreateChildRequest) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *CreateChildRequest) GetAge() int32 {
	if x != nil {
		return x.Age
	}
	return 0
}

func (x *CreateChildRequest) GetSex() Sex {
	if x != nil {
		return x.Sex
	}
	return Sex_SEX_UNSPECIFIED
}

func (x *CreateChildRequest) GetPhotos() [][]byte {
	if x != nil {
		return x.Photos
	}
	return nil
}

type CreateChildResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Child *Child `protobuf:"bytes,1,opt,name=child,proto3" json:"child,omitempty"`
}

func (x *CreateChildResponse) Reset() {
	*x = CreateChildResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateChildResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateChildResponse) ProtoMessage() {}

func (x *CreateChildResponse) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateChildResponse.ProtoReflect.Descriptor instead.
func (*CreateChildResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{1}
}

func (x *CreateChildResponse) GetChild() *Child {
	if x != nil {
		return x.Child
	}
	return nil
}

type GetChildListByNurseryIDRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	NurseryId string `protobuf:"bytes,1,opt,name=nursery_id,json=nurseryId,proto3" json:"nursery_id,omitempty"`
}

func (x *GetChildListByNurseryIDRequest) Reset() {
	*x = GetChildListByNurseryIDRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByNurseryIDRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByNurseryIDRequest) ProtoMessage() {}

func (x *GetChildListByNurseryIDRequest) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetChildListByNurseryIDRequest.ProtoReflect.Descriptor instead.
func (*GetChildListByNurseryIDRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{2}
}

func (x *GetChildListByNurseryIDRequest) GetNurseryId() string {
	if x != nil {
		return x.NurseryId
	}
	return ""
}

type GetChildListByNurseryIDResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Children []*Child      `protobuf:"bytes,1,rep,name=children,proto3" json:"children,omitempty"`
	Photos   []*ChildPhoto `protobuf:"bytes,2,rep,name=photos,proto3" json:"photos,omitempty"`
}

func (x *GetChildListByNurseryIDResponse) Reset() {
	*x = GetChildListByNurseryIDResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByNurseryIDResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByNurseryIDResponse) ProtoMessage() {}

func (x *GetChildListByNurseryIDResponse) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetChildListByNurseryIDResponse.ProtoReflect.Descriptor instead.
func (*GetChildListByNurseryIDResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{3}
}

func (x *GetChildListByNurseryIDResponse) GetChildren() []*Child {
	if x != nil {
		return x.Children
	}
	return nil
}

func (x *GetChildListByNurseryIDResponse) GetPhotos() []*ChildPhoto {
	if x != nil {
		return x.Photos
	}
	return nil
}

type GetChildListByGuardianIDRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	GuardianId string `protobuf:"bytes,1,opt,name=guardian_id,json=guardianId,proto3" json:"guardian_id,omitempty"`
}

func (x *GetChildListByGuardianIDRequest) Reset() {
	*x = GetChildListByGuardianIDRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByGuardianIDRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByGuardianIDRequest) ProtoMessage() {}

func (x *GetChildListByGuardianIDRequest) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetChildListByGuardianIDRequest.ProtoReflect.Descriptor instead.
func (*GetChildListByGuardianIDRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{4}
}

func (x *GetChildListByGuardianIDRequest) GetGuardianId() string {
	if x != nil {
		return x.GuardianId
	}
	return ""
}

type GetChildListByGuardianIDResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Children []*Child      `protobuf:"bytes,1,rep,name=children,proto3" json:"children,omitempty"`
	Photos   []*ChildPhoto `protobuf:"bytes,2,rep,name=photos,proto3" json:"photos,omitempty"`
}

func (x *GetChildListByGuardianIDResponse) Reset() {
	*x = GetChildListByGuardianIDResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByGuardianIDResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByGuardianIDResponse) ProtoMessage() {}

func (x *GetChildListByGuardianIDResponse) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetChildListByGuardianIDResponse.ProtoReflect.Descriptor instead.
func (*GetChildListByGuardianIDResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{5}
}

func (x *GetChildListByGuardianIDResponse) GetChildren() []*Child {
	if x != nil {
		return x.Children
	}
	return nil
}

func (x *GetChildListByGuardianIDResponse) GetPhotos() []*ChildPhoto {
	if x != nil {
		return x.Photos
	}
	return nil
}

type GetChildListByBusIDRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	BusId string `protobuf:"bytes,1,opt,name=bus_id,json=busId,proto3" json:"bus_id,omitempty"`
}

func (x *GetChildListByBusIDRequest) Reset() {
	*x = GetChildListByBusIDRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByBusIDRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByBusIDRequest) ProtoMessage() {}

func (x *GetChildListByBusIDRequest) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetChildListByBusIDRequest.ProtoReflect.Descriptor instead.
func (*GetChildListByBusIDRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{6}
}

func (x *GetChildListByBusIDRequest) GetBusId() string {
	if x != nil {
		return x.BusId
	}
	return ""
}

type GetChildListByBusIDResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Children []*Child      `protobuf:"bytes,1,rep,name=children,proto3" json:"children,omitempty"`
	Photos   []*ChildPhoto `protobuf:"bytes,2,rep,name=photos,proto3" json:"photos,omitempty"`
}

func (x *GetChildListByBusIDResponse) Reset() {
	*x = GetChildListByBusIDResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[7]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByBusIDResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByBusIDResponse) ProtoMessage() {}

func (x *GetChildListByBusIDResponse) ProtoReflect() protoreflect.Message {
	mi := &file_where_child_bus_v1_child_proto_msgTypes[7]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetChildListByBusIDResponse.ProtoReflect.Descriptor instead.
func (*GetChildListByBusIDResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{7}
}

func (x *GetChildListByBusIDResponse) GetChildren() []*Child {
	if x != nil {
		return x.Children
	}
	return nil
}

func (x *GetChildListByBusIDResponse) GetPhotos() []*ChildPhoto {
	if x != nil {
		return x.Photos
	}
	return nil
}

var File_where_child_bus_v1_child_proto protoreflect.FileDescriptor

var file_where_child_bus_v1_child_proto_rawDesc = []byte{
	0x0a, 0x1e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75,
	0x73, 0x2f, 0x76, 0x31, 0x2f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x12, 0x12, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75,
	0x73, 0x2e, 0x76, 0x31, 0x1a, 0x22, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c,
	0x64, 0x5f, 0x62, 0x75, 0x73, 0x2f, 0x76, 0x31, 0x2f, 0x72, 0x65, 0x73, 0x6f, 0x75, 0x72, 0x63,
	0x65, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xbd, 0x01, 0x0a, 0x12, 0x43, 0x72, 0x65,
	0x61, 0x74, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12,
	0x1d, 0x0a, 0x0a, 0x6e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x09, 0x6e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x64, 0x12, 0x1f,
	0x0a, 0x0b, 0x67, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x5f, 0x69, 0x64, 0x18, 0x02, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x0a, 0x67, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x64, 0x12,
	0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e,
	0x61, 0x6d, 0x65, 0x12, 0x10, 0x0a, 0x03, 0x61, 0x67, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x05,
	0x52, 0x03, 0x61, 0x67, 0x65, 0x12, 0x29, 0x0a, 0x03, 0x73, 0x65, 0x78, 0x18, 0x05, 0x20, 0x01,
	0x28, 0x0e, 0x32, 0x17, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64,
	0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x65, 0x78, 0x52, 0x03, 0x73, 0x65, 0x78,
	0x12, 0x16, 0x0a, 0x06, 0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73, 0x18, 0x06, 0x20, 0x03, 0x28, 0x0c,
	0x52, 0x06, 0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73, 0x22, 0x46, 0x0a, 0x13, 0x43, 0x72, 0x65, 0x61,
	0x74, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12,
	0x2f, 0x0a, 0x05, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x19,
	0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73,
	0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x05, 0x63, 0x68, 0x69, 0x6c, 0x64,
	0x22, 0x3f, 0x0a, 0x1e, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74,
	0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x1d, 0x0a, 0x0a, 0x6e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x5f, 0x69, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x6e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49,
	0x64, 0x22, 0x90, 0x01, 0x0a, 0x1f, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69,
	0x73, 0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44, 0x52, 0x65, 0x73,
	0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x35, 0x0a, 0x08, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x72, 0x65,
	0x6e, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x19, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f,
	0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69,
	0x6c, 0x64, 0x52, 0x08, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x72, 0x65, 0x6e, 0x12, 0x36, 0x0a, 0x06,
	0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x1e, 0x2e, 0x77,
	0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76,
	0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x50, 0x68, 0x6f, 0x74, 0x6f, 0x52, 0x06, 0x70, 0x68,
	0x6f, 0x74, 0x6f, 0x73, 0x22, 0x42, 0x0a, 0x1f, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64,
	0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x44,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1f, 0x0a, 0x0b, 0x67, 0x75, 0x61, 0x72, 0x64,
	0x69, 0x61, 0x6e, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x67, 0x75,
	0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x64, 0x22, 0x91, 0x01, 0x0a, 0x20, 0x47, 0x65, 0x74,
	0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64,
	0x69, 0x61, 0x6e, 0x49, 0x44, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x35, 0x0a,
	0x08, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x72, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32,
	0x19, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75,
	0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x08, 0x63, 0x68, 0x69, 0x6c,
	0x64, 0x72, 0x65, 0x6e, 0x12, 0x36, 0x0a, 0x06, 0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73, 0x18, 0x02,
	0x20, 0x03, 0x28, 0x0b, 0x32, 0x1e, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69,
	0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x50,
	0x68, 0x6f, 0x74, 0x6f, 0x52, 0x06, 0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73, 0x22, 0x33, 0x0a, 0x1a,
	0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x42, 0x75,
	0x73, 0x49, 0x44, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x15, 0x0a, 0x06, 0x62, 0x75,
	0x73, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x62, 0x75, 0x73, 0x49,
	0x64, 0x22, 0x8c, 0x01, 0x0a, 0x1b, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69,
	0x73, 0x74, 0x42, 0x79, 0x42, 0x75, 0x73, 0x49, 0x44, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x35, 0x0a, 0x08, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x72, 0x65, 0x6e, 0x18, 0x01, 0x20,
	0x03, 0x28, 0x0b, 0x32, 0x19, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c,
	0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x08,
	0x63, 0x68, 0x69, 0x6c, 0x64, 0x72, 0x65, 0x6e, 0x12, 0x36, 0x0a, 0x06, 0x70, 0x68, 0x6f, 0x74,
	0x6f, 0x73, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x1e, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65,
	0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68,
	0x69, 0x6c, 0x64, 0x50, 0x68, 0x6f, 0x74, 0x6f, 0x52, 0x06, 0x70, 0x68, 0x6f, 0x74, 0x6f, 0x73,
	0x32, 0xf3, 0x03, 0x0a, 0x0c, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63,
	0x65, 0x12, 0x5e, 0x0a, 0x0b, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64,
	0x12, 0x26, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62,
	0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x68, 0x69, 0x6c,
	0x64, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x27, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65,
	0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x72,
	0x65, 0x61, 0x74, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x82, 0x01, 0x0a, 0x17, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69,
	0x73, 0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44, 0x12, 0x32, 0x2e,
	0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e,
	0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42,
	0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x33, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f,
	0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c,
	0x69, 0x73, 0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x85, 0x01, 0x0a, 0x18, 0x47, 0x65, 0x74, 0x43, 0x68,
	0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61,
	0x6e, 0x49, 0x44, 0x12, 0x33, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c,
	0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c,
	0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49,
	0x44, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x34, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65,
	0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65,
	0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72,
	0x64, 0x69, 0x61, 0x6e, 0x49, 0x44, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x76,
	0x0a, 0x13, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79,
	0x42, 0x75, 0x73, 0x49, 0x44, 0x12, 0x2e, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68,
	0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68,
	0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x42, 0x75, 0x73, 0x49, 0x44, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x2f, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68,
	0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68,
	0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x42, 0x75, 0x73, 0x49, 0x44, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42, 0xed, 0x01, 0x0a, 0x16, 0x63, 0x6f, 0x6d, 0x2e, 0x77,
	0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76,
	0x31, 0x42, 0x0a, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x50, 0x72, 0x6f, 0x74, 0x6f, 0x50, 0x01, 0x5a,
	0x66, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x47, 0x72, 0x65, 0x65,
	0x6e, 0x54, 0x65, 0x61, 0x50, 0x72, 0x6f, 0x67, 0x72, 0x61, 0x6d, 0x6d, 0x65, 0x72, 0x73, 0x2f,
	0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x2f, 0x62, 0x61,
	0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2d, 0x67, 0x65, 0x6e, 0x2f,
	0x67, 0x6f, 0x2f, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62,
	0x75, 0x73, 0x2f, 0x76, 0x31, 0x3b, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c,
	0x64, 0x5f, 0x62, 0x75, 0x73, 0x76, 0x31, 0xa2, 0x02, 0x03, 0x57, 0x58, 0x58, 0xaa, 0x02, 0x10,
	0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x2e, 0x56, 0x31,
	0xca, 0x02, 0x10, 0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73,
	0x5c, 0x56, 0x31, 0xe2, 0x02, 0x1c, 0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64,
	0x42, 0x75, 0x73, 0x5c, 0x56, 0x31, 0x5c, 0x47, 0x50, 0x42, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61,
	0x74, 0x61, 0xea, 0x02, 0x11, 0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42,
	0x75, 0x73, 0x3a, 0x3a, 0x56, 0x31, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_where_child_bus_v1_child_proto_rawDescOnce sync.Once
	file_where_child_bus_v1_child_proto_rawDescData = file_where_child_bus_v1_child_proto_rawDesc
)

func file_where_child_bus_v1_child_proto_rawDescGZIP() []byte {
	file_where_child_bus_v1_child_proto_rawDescOnce.Do(func() {
		file_where_child_bus_v1_child_proto_rawDescData = protoimpl.X.CompressGZIP(file_where_child_bus_v1_child_proto_rawDescData)
	})
	return file_where_child_bus_v1_child_proto_rawDescData
}

var file_where_child_bus_v1_child_proto_msgTypes = make([]protoimpl.MessageInfo, 8)
var file_where_child_bus_v1_child_proto_goTypes = []interface{}{
	(*CreateChildRequest)(nil),               // 0: where_child_bus.v1.CreateChildRequest
	(*CreateChildResponse)(nil),              // 1: where_child_bus.v1.CreateChildResponse
	(*GetChildListByNurseryIDRequest)(nil),   // 2: where_child_bus.v1.GetChildListByNurseryIDRequest
	(*GetChildListByNurseryIDResponse)(nil),  // 3: where_child_bus.v1.GetChildListByNurseryIDResponse
	(*GetChildListByGuardianIDRequest)(nil),  // 4: where_child_bus.v1.GetChildListByGuardianIDRequest
	(*GetChildListByGuardianIDResponse)(nil), // 5: where_child_bus.v1.GetChildListByGuardianIDResponse
	(*GetChildListByBusIDRequest)(nil),       // 6: where_child_bus.v1.GetChildListByBusIDRequest
	(*GetChildListByBusIDResponse)(nil),      // 7: where_child_bus.v1.GetChildListByBusIDResponse
	(Sex)(0),                                 // 8: where_child_bus.v1.Sex
	(*Child)(nil),                            // 9: where_child_bus.v1.Child
	(*ChildPhoto)(nil),                       // 10: where_child_bus.v1.ChildPhoto
}
var file_where_child_bus_v1_child_proto_depIdxs = []int32{
	8,  // 0: where_child_bus.v1.CreateChildRequest.sex:type_name -> where_child_bus.v1.Sex
	9,  // 1: where_child_bus.v1.CreateChildResponse.child:type_name -> where_child_bus.v1.Child
	9,  // 2: where_child_bus.v1.GetChildListByNurseryIDResponse.children:type_name -> where_child_bus.v1.Child
	10, // 3: where_child_bus.v1.GetChildListByNurseryIDResponse.photos:type_name -> where_child_bus.v1.ChildPhoto
	9,  // 4: where_child_bus.v1.GetChildListByGuardianIDResponse.children:type_name -> where_child_bus.v1.Child
	10, // 5: where_child_bus.v1.GetChildListByGuardianIDResponse.photos:type_name -> where_child_bus.v1.ChildPhoto
	9,  // 6: where_child_bus.v1.GetChildListByBusIDResponse.children:type_name -> where_child_bus.v1.Child
	10, // 7: where_child_bus.v1.GetChildListByBusIDResponse.photos:type_name -> where_child_bus.v1.ChildPhoto
	0,  // 8: where_child_bus.v1.ChildService.CreateChild:input_type -> where_child_bus.v1.CreateChildRequest
	2,  // 9: where_child_bus.v1.ChildService.GetChildListByNurseryID:input_type -> where_child_bus.v1.GetChildListByNurseryIDRequest
	4,  // 10: where_child_bus.v1.ChildService.GetChildListByGuardianID:input_type -> where_child_bus.v1.GetChildListByGuardianIDRequest
	6,  // 11: where_child_bus.v1.ChildService.GetChildListByBusID:input_type -> where_child_bus.v1.GetChildListByBusIDRequest
	1,  // 12: where_child_bus.v1.ChildService.CreateChild:output_type -> where_child_bus.v1.CreateChildResponse
	3,  // 13: where_child_bus.v1.ChildService.GetChildListByNurseryID:output_type -> where_child_bus.v1.GetChildListByNurseryIDResponse
	5,  // 14: where_child_bus.v1.ChildService.GetChildListByGuardianID:output_type -> where_child_bus.v1.GetChildListByGuardianIDResponse
	7,  // 15: where_child_bus.v1.ChildService.GetChildListByBusID:output_type -> where_child_bus.v1.GetChildListByBusIDResponse
	12, // [12:16] is the sub-list for method output_type
	8,  // [8:12] is the sub-list for method input_type
	8,  // [8:8] is the sub-list for extension type_name
	8,  // [8:8] is the sub-list for extension extendee
	0,  // [0:8] is the sub-list for field type_name
}

func init() { file_where_child_bus_v1_child_proto_init() }
func file_where_child_bus_v1_child_proto_init() {
	if File_where_child_bus_v1_child_proto != nil {
		return
	}
	file_where_child_bus_v1_resources_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_where_child_bus_v1_child_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateChildRequest); i {
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
		file_where_child_bus_v1_child_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateChildResponse); i {
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
		file_where_child_bus_v1_child_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetChildListByNurseryIDRequest); i {
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
		file_where_child_bus_v1_child_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetChildListByNurseryIDResponse); i {
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
		file_where_child_bus_v1_child_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetChildListByGuardianIDRequest); i {
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
		file_where_child_bus_v1_child_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetChildListByGuardianIDResponse); i {
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
		file_where_child_bus_v1_child_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetChildListByBusIDRequest); i {
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
		file_where_child_bus_v1_child_proto_msgTypes[7].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetChildListByBusIDResponse); i {
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
			RawDescriptor: file_where_child_bus_v1_child_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   8,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_where_child_bus_v1_child_proto_goTypes,
		DependencyIndexes: file_where_child_bus_v1_child_proto_depIdxs,
		MessageInfos:      file_where_child_bus_v1_child_proto_msgTypes,
	}.Build()
	File_where_child_bus_v1_child_proto = out.File
	file_where_child_bus_v1_child_proto_rawDesc = nil
	file_where_child_bus_v1_child_proto_goTypes = nil
	file_where_child_bus_v1_child_proto_depIdxs = nil
}
