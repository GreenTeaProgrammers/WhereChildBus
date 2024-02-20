// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             (unknown)
// source: where_child_bus/v1/child_photo.proto

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
	ChildPhotoService_DuplicationCheck_FullMethodName = "/where_child_bus.v1.ChildPhotoService/DuplicationCheck"
	ChildPhotoService_DeleteChildPhoto_FullMethodName = "/where_child_bus.v1.ChildPhotoService/DeleteChildPhoto"
	ChildPhotoService_GetChildPhoto_FullMethodName    = "/where_child_bus.v1.ChildPhotoService/GetChildPhoto"
)

// ChildPhotoServiceClient is the client API for ChildPhotoService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type ChildPhotoServiceClient interface {
	DuplicationCheck(ctx context.Context, in *DuplicationCheckRequest, opts ...grpc.CallOption) (*DuplicationCheckResponse, error)
	DeleteChildPhoto(ctx context.Context, in *DeleteChildPhotoRequest, opts ...grpc.CallOption) (*DeleteChildPhotoResponse, error)
	GetChildPhoto(ctx context.Context, in *GetChildPhotoRequest, opts ...grpc.CallOption) (*GetChildPhotoResponse, error)
}

type childPhotoServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewChildPhotoServiceClient(cc grpc.ClientConnInterface) ChildPhotoServiceClient {
	return &childPhotoServiceClient{cc}
}

func (c *childPhotoServiceClient) DuplicationCheck(ctx context.Context, in *DuplicationCheckRequest, opts ...grpc.CallOption) (*DuplicationCheckResponse, error) {
	out := new(DuplicationCheckResponse)
	err := c.cc.Invoke(ctx, ChildPhotoService_DuplicationCheck_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *childPhotoServiceClient) DeleteChildPhoto(ctx context.Context, in *DeleteChildPhotoRequest, opts ...grpc.CallOption) (*DeleteChildPhotoResponse, error) {
	out := new(DeleteChildPhotoResponse)
	err := c.cc.Invoke(ctx, ChildPhotoService_DeleteChildPhoto_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *childPhotoServiceClient) GetChildPhoto(ctx context.Context, in *GetChildPhotoRequest, opts ...grpc.CallOption) (*GetChildPhotoResponse, error) {
	out := new(GetChildPhotoResponse)
	err := c.cc.Invoke(ctx, ChildPhotoService_GetChildPhoto_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ChildPhotoServiceServer is the server API for ChildPhotoService service.
// All implementations should embed UnimplementedChildPhotoServiceServer
// for forward compatibility
type ChildPhotoServiceServer interface {
	DuplicationCheck(context.Context, *DuplicationCheckRequest) (*DuplicationCheckResponse, error)
	DeleteChildPhoto(context.Context, *DeleteChildPhotoRequest) (*DeleteChildPhotoResponse, error)
	GetChildPhoto(context.Context, *GetChildPhotoRequest) (*GetChildPhotoResponse, error)
}

// UnimplementedChildPhotoServiceServer should be embedded to have forward compatible implementations.
type UnimplementedChildPhotoServiceServer struct {
}

func (UnimplementedChildPhotoServiceServer) DuplicationCheck(context.Context, *DuplicationCheckRequest) (*DuplicationCheckResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DuplicationCheck not implemented")
}
func (UnimplementedChildPhotoServiceServer) DeleteChildPhoto(context.Context, *DeleteChildPhotoRequest) (*DeleteChildPhotoResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteChildPhoto not implemented")
}
func (UnimplementedChildPhotoServiceServer) GetChildPhoto(context.Context, *GetChildPhotoRequest) (*GetChildPhotoResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetChildPhoto not implemented")
}

// UnsafeChildPhotoServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to ChildPhotoServiceServer will
// result in compilation errors.
type UnsafeChildPhotoServiceServer interface {
	mustEmbedUnimplementedChildPhotoServiceServer()
}

func RegisterChildPhotoServiceServer(s grpc.ServiceRegistrar, srv ChildPhotoServiceServer) {
	s.RegisterService(&ChildPhotoService_ServiceDesc, srv)
}

func _ChildPhotoService_DuplicationCheck_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DuplicationCheckRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildPhotoServiceServer).DuplicationCheck(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildPhotoService_DuplicationCheck_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildPhotoServiceServer).DuplicationCheck(ctx, req.(*DuplicationCheckRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChildPhotoService_DeleteChildPhoto_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DeleteChildPhotoRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildPhotoServiceServer).DeleteChildPhoto(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildPhotoService_DeleteChildPhoto_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildPhotoServiceServer).DeleteChildPhoto(ctx, req.(*DeleteChildPhotoRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChildPhotoService_GetChildPhoto_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetChildPhotoRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChildPhotoServiceServer).GetChildPhoto(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChildPhotoService_GetChildPhoto_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChildPhotoServiceServer).GetChildPhoto(ctx, req.(*GetChildPhotoRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// ChildPhotoService_ServiceDesc is the grpc.ServiceDesc for ChildPhotoService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var ChildPhotoService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "where_child_bus.v1.ChildPhotoService",
	HandlerType: (*ChildPhotoServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "DuplicationCheck",
			Handler:    _ChildPhotoService_DuplicationCheck_Handler,
		},
		{
			MethodName: "DeleteChildPhoto",
			Handler:    _ChildPhotoService_DeleteChildPhoto_Handler,
		},
		{
			MethodName: "GetChildPhoto",
			Handler:    _ChildPhotoService_GetChildPhoto_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "where_child_bus/v1/child_photo.proto",
}
