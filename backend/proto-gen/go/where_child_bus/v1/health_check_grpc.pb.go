// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             (unknown)
// source: where_child_bus/v1/health_check.proto

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
	HealthcheckService_Ping_FullMethodName = "/where_child_bus.v1.HealthcheckService/Ping"
)

// HealthcheckServiceClient is the client API for HealthcheckService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type HealthcheckServiceClient interface {
	Ping(ctx context.Context, in *PingRequest, opts ...grpc.CallOption) (*PingResponse, error)
}

type healthcheckServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewHealthcheckServiceClient(cc grpc.ClientConnInterface) HealthcheckServiceClient {
	return &healthcheckServiceClient{cc}
}

func (c *healthcheckServiceClient) Ping(ctx context.Context, in *PingRequest, opts ...grpc.CallOption) (*PingResponse, error) {
	out := new(PingResponse)
	err := c.cc.Invoke(ctx, HealthcheckService_Ping_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// HealthcheckServiceServer is the server API for HealthcheckService service.
// All implementations should embed UnimplementedHealthcheckServiceServer
// for forward compatibility
type HealthcheckServiceServer interface {
	Ping(context.Context, *PingRequest) (*PingResponse, error)
}

// UnimplementedHealthcheckServiceServer should be embedded to have forward compatible implementations.
type UnimplementedHealthcheckServiceServer struct {
}

func (UnimplementedHealthcheckServiceServer) Ping(context.Context, *PingRequest) (*PingResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Ping not implemented")
}

// UnsafeHealthcheckServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to HealthcheckServiceServer will
// result in compilation errors.
type UnsafeHealthcheckServiceServer interface {
	mustEmbedUnimplementedHealthcheckServiceServer()
}

func RegisterHealthcheckServiceServer(s grpc.ServiceRegistrar, srv HealthcheckServiceServer) {
	s.RegisterService(&HealthcheckService_ServiceDesc, srv)
}

func _HealthcheckService_Ping_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(PingRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(HealthcheckServiceServer).Ping(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: HealthcheckService_Ping_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(HealthcheckServiceServer).Ping(ctx, req.(*PingRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// HealthcheckService_ServiceDesc is the grpc.ServiceDesc for HealthcheckService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var HealthcheckService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "where_child_bus.v1.HealthcheckService",
	HandlerType: (*HealthcheckServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Ping",
			Handler:    _HealthcheckService_Ping_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "where_child_bus/v1/health_check.proto",
}
