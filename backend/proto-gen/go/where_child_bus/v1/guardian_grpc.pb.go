// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             (unknown)
// source: where_child_bus/v1/guardian.proto

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
	GuardianService_GuardianLogin_FullMethodName = "/where_child_bus.v1.GuardianService/GuardianLogin"
)

// GuardianServiceClient is the client API for GuardianService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type GuardianServiceClient interface {
	GuardianLogin(ctx context.Context, in *GuardianLoginRequest, opts ...grpc.CallOption) (*GuardianLoginResponse, error)
}

type guardianServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewGuardianServiceClient(cc grpc.ClientConnInterface) GuardianServiceClient {
	return &guardianServiceClient{cc}
}

func (c *guardianServiceClient) GuardianLogin(ctx context.Context, in *GuardianLoginRequest, opts ...grpc.CallOption) (*GuardianLoginResponse, error) {
	out := new(GuardianLoginResponse)
	err := c.cc.Invoke(ctx, GuardianService_GuardianLogin_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// GuardianServiceServer is the server API for GuardianService service.
// All implementations should embed UnimplementedGuardianServiceServer
// for forward compatibility
type GuardianServiceServer interface {
	GuardianLogin(context.Context, *GuardianLoginRequest) (*GuardianLoginResponse, error)
}

// UnimplementedGuardianServiceServer should be embedded to have forward compatible implementations.
type UnimplementedGuardianServiceServer struct {
}

func (UnimplementedGuardianServiceServer) GuardianLogin(context.Context, *GuardianLoginRequest) (*GuardianLoginResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GuardianLogin not implemented")
}

// UnsafeGuardianServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to GuardianServiceServer will
// result in compilation errors.
type UnsafeGuardianServiceServer interface {
	mustEmbedUnimplementedGuardianServiceServer()
}

func RegisterGuardianServiceServer(s grpc.ServiceRegistrar, srv GuardianServiceServer) {
	s.RegisterService(&GuardianService_ServiceDesc, srv)
}

func _GuardianService_GuardianLogin_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GuardianLoginRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(GuardianServiceServer).GuardianLogin(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: GuardianService_GuardianLogin_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(GuardianServiceServer).GuardianLogin(ctx, req.(*GuardianLoginRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// GuardianService_ServiceDesc is the grpc.ServiceDesc for GuardianService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var GuardianService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "where_child_bus.v1.GuardianService",
	HandlerType: (*GuardianServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "GuardianLogin",
			Handler:    _GuardianService_GuardianLogin_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "where_child_bus/v1/guardian.proto",
}