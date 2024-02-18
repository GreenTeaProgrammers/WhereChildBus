// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             (unknown)
// source: where_child_bus/v1/child.proto

package where_child_busv1

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

const (
	ChildService_CreateChild_FullMethodName              = "/where_child_bus.v1.ChildService/CreateChild"
	ChildService_GetChildListByNurseryID_FullMethodName  = "/where_child_bus.v1.ChildService/GetChildListByNurseryID"
	ChildService_GetChildListByGuardianID_FullMethodName = "/where_child_bus.v1.ChildService/GetChildListByGuardianID"
	ChildService_GetChildListByBusID_FullMethodName      = "/where_child_bus.v1.ChildService/GetChildListByBusID"
	ChildService_CheckIsChildInBus_FullMethodName        = "/where_child_bus.v1.ChildService/CheckIsChildInBus"
)

// ChildServiceClient is the client API for ChildService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type ChildServiceClient interface {
	CreateChild(ctx context.Context, in *CreateChildRequest, opts ...grpc.CallOption) (*CreateChildResponse, error)
	GetChildListByNurseryID(ctx context.Context, in *GetChildListByNurseryIDRequest, opts ...grpc.CallOption) (*GetChildListByNurseryIDResponse, error)
	GetChildListByGuardianID(ctx context.Context, in *GetChildListByGuardianIDRequest, opts ...grpc.CallOption) (*GetChildListByGuardianIDResponse, error)
	GetChildListByBusID(ctx context.Context, in *GetChildListByBusIDRequest, opts ...grpc.CallOption) (*GetChildListByBusIDResponse, error)
	CheckIsChildInBus(ctx context.Context, in *CheckIsChildInBusRequest, opts ...grpc.CallOption) (*CheckIsChildInBusResponse, error)
}

type childServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewChildServiceClient(cc grpc.ClientConnInterface) ChildServiceClient {
	return &childServiceClient{cc}
}

func (c *childServiceClient) CreateChild(ctx context.Context, in *CreateChildRequest, opts ...grpc.CallOption) (*CreateChildResponse, error) {
	out := new(CreateChildResponse)
	err := c.cc.Invoke(ctx, ChildService_CreateChild_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *childServiceClient) GetChildListByNurseryID(ctx context.Context, in *GetChildListByNurseryIDRequest, opts ...grpc.CallOption) (*GetChildListByNurseryIDResponse, error) {
	out := new(GetChildListByNurseryIDResponse)
	err := c.cc.Invoke(ctx, ChildService_GetChildListByNurseryID_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *childServiceClient) GetChildListByGuardianID(ctx context.Context, in *GetChildListByGuardianIDRequest, opts ...grpc.CallOption) (*GetChildListByGuardianIDResponse, error) {
	out := new(GetChildListByGuardianIDResponse)
	err := c.cc.Invoke(ctx, ChildService_GetChildListByGuardianID_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *childServiceClient) GetChildListByBusID(ctx context.Context, in *GetChildListByBusIDRequest, opts ...grpc.CallOption) (*GetChildListByBusIDResponse, error) {
	out := new(GetChildListByBusIDResponse)
	err := c.cc.Invoke(ctx, ChildService_GetChildListByBusID_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *childServiceClient) CheckIsChildInBus(ctx context.Context, in *CheckIsChildInBusRequest, opts ...grpc.CallOption) (*CheckIsChildInBusResponse, error) {
	out := new(CheckIsChildInBusResponse)
	err := c.cc.Invoke(ctx, ChildService_CheckIsChildInBus_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ChildServiceServer is the server API for ChildService service.
// All implementations should embed UnimplementedChildServiceServer
// for forward compatibility
type ChildServiceServer interface {
	CreateChild(context.Context, *CreateChildRequest) (*CreateChildResponse, error)
	GetChildListByNurseryID(context.Context, *GetChildListByNurseryIDRequest) (*GetChildListByNurseryIDResponse, error)
	GetChildListByGuardianID(context.Context, *GetChildListByGuardianIDRequest) (*GetChildListByGuardianIDResponse, error)
	GetChildListByBusID(context.Context, *GetChildListByBusIDRequest) (*GetChildListByBusIDResponse, error)
	CheckIsChildInBus(context.Context, *CheckIsChildInBusRequest) (*CheckIsChildInBusResponse, error)
}

// UnimplementedChildServiceServer should be embedded to have forward compatible implementations.
type UnimplementedChildServiceServer struct {
}

func (UnimplementedChildServiceServer) CreateChild(context.Context, *CreateChildRequest) (*CreateChildResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateChild not implemented")
}
func (UnimplementedChildServiceServer) GetChildListByNurseryID(context.Context, *GetChildListByNurseryIDRequest) (*GetChildListByNurseryIDResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetChildListByNurseryID not implemented")
}
func (UnimplementedChildServiceServer) GetChildListByGuardianID(context.Context, *GetChildListByGuardianIDRequest) (*GetChildListByGuardianIDResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetChildListByGuardianID not implemented")
}
func (UnimplementedChildServiceServer) GetChildListByBusID(context.Context, *GetChildListByBusIDRequest) (*GetChildListByBusIDResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetChildListByBusID not implemented")
}
func (UnimplementedChildServiceServer) CheckIsChildInBus(context.Context, *CheckIsChildInBusRequest) (*CheckIsChildInBusResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CheckIsChildInBus not implemented")
}

// UnsafeChildServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to ChildServiceServer will
// result in compilation errors.
type UnsafeChildServiceServer interface {
	mustEmbedUnimplementedChildServiceServer()
}

func RegisterChildServiceServer(s grpc.ServiceRegistrar, srv ChildServiceServer) {
	s.RegisterService(&ChildService_ServiceDesc, srv)
}

func _ChildService_CreateChild_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateChildRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildServiceServer).CreateChild(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildService_CreateChild_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildServiceServer).CreateChild(ctx, req.(*CreateChildRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChildService_GetChildListByNurseryID_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetChildListByNurseryIDRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildServiceServer).GetChildListByNurseryID(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildService_GetChildListByNurseryID_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildServiceServer).GetChildListByNurseryID(ctx, req.(*GetChildListByNurseryIDRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChildService_GetChildListByGuardianID_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetChildListByGuardianIDRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildServiceServer).GetChildListByGuardianID(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildService_GetChildListByGuardianID_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildServiceServer).GetChildListByGuardianID(ctx, req.(*GetChildListByGuardianIDRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChildService_GetChildListByBusID_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetChildListByBusIDRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildServiceServer).GetChildListByBusID(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildService_GetChildListByBusID_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildServiceServer).GetChildListByBusID(ctx, req.(*GetChildListByBusIDRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChildService_CheckIsChildInBus_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CheckIsChildInBusRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildServiceServer).CheckIsChildInBus(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildService_CheckIsChildInBus_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildServiceServer).CheckIsChildInBus(ctx, req.(*CheckIsChildInBusRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// ChildService_ServiceDesc is the grpc.ServiceDesc for ChildService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var ChildService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "where_child_bus.v1.ChildService",
	HandlerType: (*ChildServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateChild",
			Handler:    _ChildService_CreateChild_Handler,
		},
		{
			MethodName: "GetChildListByNurseryID",
			Handler:    _ChildService_GetChildListByNurseryID_Handler,
		},
		{
			MethodName: "GetChildListByGuardianID",
			Handler:    _ChildService_GetChildListByGuardianID_Handler,
		},
		{
			MethodName: "GetChildListByBusID",
			Handler:    _ChildService_GetChildListByBusID_Handler,
		},
		{
			MethodName: "CheckIsChildInBus",
			Handler:    _ChildService_CheckIsChildInBus_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "where_child_bus/v1/child.proto",
}
