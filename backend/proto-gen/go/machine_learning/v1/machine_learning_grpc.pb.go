// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             (unknown)
// source: machine_learning/v1/machine_learning.proto

package machine_learningv1

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
	MachineLearningService_Train_FullMethodName             = "/machine_learning.v1.MachineLearningService/Train"
	MachineLearningService_Pred_FullMethodName              = "/machine_learning.v1.MachineLearningService/Pred"
	MachineLearningService_FaceDetectAndClip_FullMethodName = "/machine_learning.v1.MachineLearningService/FaceDetectAndClip"
)

// MachineLearningServiceClient is the client API for MachineLearningService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type MachineLearningServiceClient interface {
	Train(ctx context.Context, in *TrainRequest, opts ...grpc.CallOption) (*TrainResponse, error)
	Pred(ctx context.Context, opts ...grpc.CallOption) (MachineLearningService_PredClient, error)
	FaceDetectAndClip(ctx context.Context, in *FaceDetectAndClipRequest, opts ...grpc.CallOption) (*FaceDetectAndClipResponse, error)
}

type machineLearningServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewMachineLearningServiceClient(cc grpc.ClientConnInterface) MachineLearningServiceClient {
	return &machineLearningServiceClient{cc}
}

func (c *machineLearningServiceClient) Train(ctx context.Context, in *TrainRequest, opts ...grpc.CallOption) (*TrainResponse, error) {
	out := new(TrainResponse)
	err := c.cc.Invoke(ctx, MachineLearningService_Train_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *machineLearningServiceClient) Pred(ctx context.Context, opts ...grpc.CallOption) (MachineLearningService_PredClient, error) {
	stream, err := c.cc.NewStream(ctx, &MachineLearningService_ServiceDesc.Streams[0], MachineLearningService_Pred_FullMethodName, opts...)
	if err != nil {
		return nil, err
	}
	x := &machineLearningServicePredClient{stream}
	return x, nil
}

type MachineLearningService_PredClient interface {
	Send(*PredRequest) error
	Recv() (*PredResponse, error)
	grpc.ClientStream
}

type machineLearningServicePredClient struct {
	grpc.ClientStream
}

func (x *machineLearningServicePredClient) Send(m *PredRequest) error {
	return x.ClientStream.SendMsg(m)
}

func (x *machineLearningServicePredClient) Recv() (*PredResponse, error) {
	m := new(PredResponse)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *machineLearningServiceClient) FaceDetectAndClip(ctx context.Context, in *FaceDetectAndClipRequest, opts ...grpc.CallOption) (*FaceDetectAndClipResponse, error) {
	out := new(FaceDetectAndClipResponse)
	err := c.cc.Invoke(ctx, MachineLearningService_FaceDetectAndClip_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// MachineLearningServiceServer is the server API for MachineLearningService service.
// All implementations should embed UnimplementedMachineLearningServiceServer
// for forward compatibility
type MachineLearningServiceServer interface {
	Train(context.Context, *TrainRequest) (*TrainResponse, error)
	Pred(MachineLearningService_PredServer) error
	FaceDetectAndClip(context.Context, *FaceDetectAndClipRequest) (*FaceDetectAndClipResponse, error)
}

// UnimplementedMachineLearningServiceServer should be embedded to have forward compatible implementations.
type UnimplementedMachineLearningServiceServer struct {
}

func (UnimplementedMachineLearningServiceServer) Train(context.Context, *TrainRequest) (*TrainResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Train not implemented")
}
func (UnimplementedMachineLearningServiceServer) Pred(MachineLearningService_PredServer) error {
	return status.Errorf(codes.Unimplemented, "method Pred not implemented")
}
func (UnimplementedMachineLearningServiceServer) FaceDetectAndClip(context.Context, *FaceDetectAndClipRequest) (*FaceDetectAndClipResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method FaceDetectAndClip not implemented")
}

// UnsafeMachineLearningServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to MachineLearningServiceServer will
// result in compilation errors.
type UnsafeMachineLearningServiceServer interface {
	mustEmbedUnimplementedMachineLearningServiceServer()
}

func RegisterMachineLearningServiceServer(s grpc.ServiceRegistrar, srv MachineLearningServiceServer) {
	s.RegisterService(&MachineLearningService_ServiceDesc, srv)
}

func _MachineLearningService_Train_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(TrainRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MachineLearningServiceServer).Train(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: MachineLearningService_Train_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MachineLearningServiceServer).Train(ctx, req.(*TrainRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _MachineLearningService_Pred_Handler(srv interface{}, stream grpc.ServerStream) error {
	return srv.(MachineLearningServiceServer).Pred(&machineLearningServicePredServer{stream})
}

type MachineLearningService_PredServer interface {
	Send(*PredResponse) error
	Recv() (*PredRequest, error)
	grpc.ServerStream
}

type machineLearningServicePredServer struct {
	grpc.ServerStream
}

func (x *machineLearningServicePredServer) Send(m *PredResponse) error {
	return x.ServerStream.SendMsg(m)
}

func (x *machineLearningServicePredServer) Recv() (*PredRequest, error) {
	m := new(PredRequest)
	if err := x.ServerStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func _MachineLearningService_FaceDetectAndClip_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(FaceDetectAndClipRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MachineLearningServiceServer).FaceDetectAndClip(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: MachineLearningService_FaceDetectAndClip_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MachineLearningServiceServer).FaceDetectAndClip(ctx, req.(*FaceDetectAndClipRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// MachineLearningService_ServiceDesc is the grpc.ServiceDesc for MachineLearningService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var MachineLearningService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "machine_learning.v1.MachineLearningService",
	HandlerType: (*MachineLearningServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Train",
			Handler:    _MachineLearningService_Train_Handler,
		},
		{
			MethodName: "FaceDetectAndClip",
			Handler:    _MachineLearningService_FaceDetectAndClip_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "Pred",
			Handler:       _MachineLearningService_Pred_Handler,
			ServerStreams: true,
			ClientStreams: true,
		},
	},
	Metadata: "machine_learning/v1/machine_learning.proto",
}
