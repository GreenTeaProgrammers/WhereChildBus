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

type GetChildListByNurseryIDRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	NurseryId string `protobuf:"bytes,1,opt,name=nursery_id,json=nurseryId,proto3" json:"nursery_id,omitempty"`
}

func (x *GetChildListByNurseryIDRequest) Reset() {
	*x = GetChildListByNurseryIDRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByNurseryIDRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByNurseryIDRequest) ProtoMessage() {}

func (x *GetChildListByNurseryIDRequest) ProtoReflect() protoreflect.Message {
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

// Deprecated: Use GetChildListByNurseryIDRequest.ProtoReflect.Descriptor instead.
func (*GetChildListByNurseryIDRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{0}
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

	Children []*Child `protobuf:"bytes,1,rep,name=children,proto3" json:"children,omitempty"`
}

func (x *GetChildListByNurseryIDResponse) Reset() {
	*x = GetChildListByNurseryIDResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByNurseryIDResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByNurseryIDResponse) ProtoMessage() {}

func (x *GetChildListByNurseryIDResponse) ProtoReflect() protoreflect.Message {
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

// Deprecated: Use GetChildListByNurseryIDResponse.ProtoReflect.Descriptor instead.
func (*GetChildListByNurseryIDResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{1}
}

func (x *GetChildListByNurseryIDResponse) GetChildren() []*Child {
	if x != nil {
		return x.Children
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
		mi := &file_where_child_bus_v1_child_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByGuardianIDRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByGuardianIDRequest) ProtoMessage() {}

func (x *GetChildListByGuardianIDRequest) ProtoReflect() protoreflect.Message {
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

// Deprecated: Use GetChildListByGuardianIDRequest.ProtoReflect.Descriptor instead.
func (*GetChildListByGuardianIDRequest) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{2}
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

	Children []*Child `protobuf:"bytes,1,rep,name=children,proto3" json:"children,omitempty"`
}

func (x *GetChildListByGuardianIDResponse) Reset() {
	*x = GetChildListByGuardianIDResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_where_child_bus_v1_child_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetChildListByGuardianIDResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetChildListByGuardianIDResponse) ProtoMessage() {}

func (x *GetChildListByGuardianIDResponse) ProtoReflect() protoreflect.Message {
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

// Deprecated: Use GetChildListByGuardianIDResponse.ProtoReflect.Descriptor instead.
func (*GetChildListByGuardianIDResponse) Descriptor() ([]byte, []int) {
	return file_where_child_bus_v1_child_proto_rawDescGZIP(), []int{3}
}

func (x *GetChildListByGuardianIDResponse) GetChildren() []*Child {
	if x != nil {
		return x.Children
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
	0x65, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x3f, 0x0a, 0x1e, 0x47, 0x65, 0x74, 0x43,
	0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72,
	0x79, 0x49, 0x44, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1d, 0x0a, 0x0a, 0x6e, 0x75,
	0x72, 0x73, 0x65, 0x72, 0x79, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09,
	0x6e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x64, 0x22, 0x58, 0x0a, 0x1f, 0x47, 0x65, 0x74,
	0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65,
	0x72, 0x79, 0x49, 0x44, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x35, 0x0a, 0x08,
	0x63, 0x68, 0x69, 0x6c, 0x64, 0x72, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x19,
	0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73,
	0x2e, 0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x08, 0x63, 0x68, 0x69, 0x6c, 0x64,
	0x72, 0x65, 0x6e, 0x22, 0x42, 0x0a, 0x1f, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c,
	0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x44, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1f, 0x0a, 0x0b, 0x67, 0x75, 0x61, 0x72, 0x64, 0x69,
	0x61, 0x6e, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x67, 0x75, 0x61,
	0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x64, 0x22, 0x59, 0x0a, 0x20, 0x47, 0x65, 0x74, 0x43, 0x68,
	0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61,
	0x6e, 0x49, 0x44, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x35, 0x0a, 0x08, 0x63,
	0x68, 0x69, 0x6c, 0x64, 0x72, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x19, 0x2e,
	0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e,
	0x76, 0x31, 0x2e, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x08, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x72,
	0x65, 0x6e, 0x32, 0x9b, 0x02, 0x0a, 0x0c, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x53, 0x65, 0x72, 0x76,
	0x69, 0x63, 0x65, 0x12, 0x82, 0x01, 0x0a, 0x17, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64,
	0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44, 0x12,
	0x32, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75,
	0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73,
	0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x1a, 0x33, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c,
	0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c,
	0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x4e, 0x75, 0x72, 0x73, 0x65, 0x72, 0x79, 0x49, 0x44,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x85, 0x01, 0x0a, 0x18, 0x47, 0x65, 0x74,
	0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64,
	0x69, 0x61, 0x6e, 0x49, 0x44, 0x12, 0x33, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68,
	0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x68,
	0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75, 0x61, 0x72, 0x64, 0x69, 0x61,
	0x6e, 0x49, 0x44, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x34, 0x2e, 0x77, 0x68, 0x65,
	0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x2e,
	0x47, 0x65, 0x74, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x4c, 0x69, 0x73, 0x74, 0x42, 0x79, 0x47, 0x75,
	0x61, 0x72, 0x64, 0x69, 0x61, 0x6e, 0x49, 0x44, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x42, 0xed, 0x01, 0x0a, 0x16, 0x63, 0x6f, 0x6d, 0x2e, 0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63,
	0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2e, 0x76, 0x31, 0x42, 0x0a, 0x43, 0x68, 0x69,
	0x6c, 0x64, 0x50, 0x72, 0x6f, 0x74, 0x6f, 0x50, 0x01, 0x5a, 0x66, 0x67, 0x69, 0x74, 0x68, 0x75,
	0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x47, 0x72, 0x65, 0x65, 0x6e, 0x54, 0x65, 0x61, 0x50, 0x72,
	0x6f, 0x67, 0x72, 0x61, 0x6d, 0x6d, 0x65, 0x72, 0x73, 0x2f, 0x57, 0x68, 0x65, 0x72, 0x65, 0x43,
	0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x2f, 0x62, 0x61, 0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2d, 0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f, 0x2f, 0x77, 0x68, 0x65,
	0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x2f, 0x76, 0x31, 0x3b,
	0x77, 0x68, 0x65, 0x72, 0x65, 0x5f, 0x63, 0x68, 0x69, 0x6c, 0x64, 0x5f, 0x62, 0x75, 0x73, 0x76,
	0x31, 0xa2, 0x02, 0x03, 0x57, 0x58, 0x58, 0xaa, 0x02, 0x10, 0x57, 0x68, 0x65, 0x72, 0x65, 0x43,
	0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x2e, 0x56, 0x31, 0xca, 0x02, 0x10, 0x57, 0x68, 0x65,
	0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x5c, 0x56, 0x31, 0xe2, 0x02, 0x1c,
	0x57, 0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x5c, 0x56, 0x31,
	0x5c, 0x47, 0x50, 0x42, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0xea, 0x02, 0x11, 0x57,
	0x68, 0x65, 0x72, 0x65, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x42, 0x75, 0x73, 0x3a, 0x3a, 0x56, 0x31,
	0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
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

var file_where_child_bus_v1_child_proto_msgTypes = make([]protoimpl.MessageInfo, 4)
var file_where_child_bus_v1_child_proto_goTypes = []interface{}{
	(*GetChildListByNurseryIDRequest)(nil),   // 0: where_child_bus.v1.GetChildListByNurseryIDRequest
	(*GetChildListByNurseryIDResponse)(nil),  // 1: where_child_bus.v1.GetChildListByNurseryIDResponse
	(*GetChildListByGuardianIDRequest)(nil),  // 2: where_child_bus.v1.GetChildListByGuardianIDRequest
	(*GetChildListByGuardianIDResponse)(nil), // 3: where_child_bus.v1.GetChildListByGuardianIDResponse
	(*Child)(nil),                            // 4: where_child_bus.v1.Child
}
var file_where_child_bus_v1_child_proto_depIdxs = []int32{
	4, // 0: where_child_bus.v1.GetChildListByNurseryIDResponse.children:type_name -> where_child_bus.v1.Child
	4, // 1: where_child_bus.v1.GetChildListByGuardianIDResponse.children:type_name -> where_child_bus.v1.Child
	0, // 2: where_child_bus.v1.ChildService.GetChildListByNurseryID:input_type -> where_child_bus.v1.GetChildListByNurseryIDRequest
	2, // 3: where_child_bus.v1.ChildService.GetChildListByGuardianID:input_type -> where_child_bus.v1.GetChildListByGuardianIDRequest
	1, // 4: where_child_bus.v1.ChildService.GetChildListByNurseryID:output_type -> where_child_bus.v1.GetChildListByNurseryIDResponse
	3, // 5: where_child_bus.v1.ChildService.GetChildListByGuardianID:output_type -> where_child_bus.v1.GetChildListByGuardianIDResponse
	4, // [4:6] is the sub-list for method output_type
	2, // [2:4] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_where_child_bus_v1_child_proto_init() }
func file_where_child_bus_v1_child_proto_init() {
	if File_where_child_bus_v1_child_proto != nil {
		return
	}
	file_where_child_bus_v1_resources_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_where_child_bus_v1_child_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
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
		file_where_child_bus_v1_child_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
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
		file_where_child_bus_v1_child_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
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
		file_where_child_bus_v1_child_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
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
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_where_child_bus_v1_child_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   4,
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