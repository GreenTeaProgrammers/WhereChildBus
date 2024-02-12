// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             (unknown)
// source: where_child_bus/v1/station.proto

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
	StationService_CreateStation_FullMethodName         = "/where_child_bus.v1.StationService/CreateStation"
	StationService_GetStationListByBusId_FullMethodName = "/where_child_bus.v1.StationService/GetStationListByBusId"
)

// StationServiceClient is the client API for StationService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type StationServiceClient interface {
	CreateStation(ctx context.Context, in *CreateStationRequest, opts ...grpc.CallOption) (*CreateStationResponse, error)
	GetStationListByBusId(ctx context.Context, in *GetStationListByBusIdRequest, opts ...grpc.CallOption) (*GetStationListByBusIdResponse, error)
}

type stationServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewStationServiceClient(cc grpc.ClientConnInterface) StationServiceClient {
	return &stationServiceClient{cc}
}

func (c *stationServiceClient) CreateStation(ctx context.Context, in *CreateStationRequest, opts ...grpc.CallOption) (*CreateStationResponse, error) {
	out := new(CreateStationResponse)
	err := c.cc.Invoke(ctx, StationService_CreateStation_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *stationServiceClient) GetStationListByBusId(ctx context.Context, in *GetStationListByBusIdRequest, opts ...grpc.CallOption) (*GetStationListByBusIdResponse, error) {
	out := new(GetStationListByBusIdResponse)
	err := c.cc.Invoke(ctx, StationService_GetStationListByBusId_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// StationServiceServer is the server API for StationService service.
// All implementations should embed UnimplementedStationServiceServer
// for forward compatibility
type StationServiceServer interface {
	CreateStation(context.Context, *CreateStationRequest) (*CreateStationResponse, error)
	GetStationListByBusId(context.Context, *GetStationListByBusIdRequest) (*GetStationListByBusIdResponse, error)
}

// UnimplementedStationServiceServer should be embedded to have forward compatible implementations.
type UnimplementedStationServiceServer struct {
}

func (UnimplementedStationServiceServer) CreateStation(context.Context, *CreateStationRequest) (*CreateStationResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateStation not implemented")
}
func (UnimplementedStationServiceServer) GetStationListByBusId(context.Context, *GetStationListByBusIdRequest) (*GetStationListByBusIdResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetStationListByBusId not implemented")
}

// UnsafeStationServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to StationServiceServer will
// result in compilation errors.
type UnsafeStationServiceServer interface {
	mustEmbedUnimplementedStationServiceServer()
}

func RegisterStationServiceServer(s grpc.ServiceRegistrar, srv StationServiceServer) {
	s.RegisterService(&StationService_ServiceDesc, srv)
}

func _StationService_CreateStation_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateStationRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(StationServiceServer).CreateStation(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: StationService_CreateStation_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(StationServiceServer).CreateStation(ctx, req.(*CreateStationRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _StationService_GetStationListByBusId_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetStationListByBusIdRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(StationServiceServer).GetStationListByBusId(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: StationService_GetStationListByBusId_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(StationServiceServer).GetStationListByBusId(ctx, req.(*GetStationListByBusIdRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// StationService_ServiceDesc is the grpc.ServiceDesc for StationService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var StationService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "where_child_bus.v1.StationService",
	HandlerType: (*StationServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateStation",
			Handler:    _StationService_CreateStation_Handler,
		},
		{
			MethodName: "GetStationListByBusId",
			Handler:    _StationService_GetStationListByBusId_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "where_child_bus/v1/station.proto",
}
