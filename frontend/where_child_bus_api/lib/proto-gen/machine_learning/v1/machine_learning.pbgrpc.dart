//
//  Generated code. Do not modify.
//  source: machine_learning/v1/machine_learning.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../where_child_bus/v1/bus.pb.dart' as $1;
import 'machine_learning.pb.dart' as $2;

export 'machine_learning.pb.dart';

@$pb.GrpcServiceName('machine_learning.v1.MachineLearningService')
class MachineLearningServiceClient extends $grpc.Client {
  static final _$train = $grpc.ClientMethod<$2.TrainRequest, $2.TrainResponse>(
      '/machine_learning.v1.MachineLearningService/Train',
      ($2.TrainRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TrainResponse.fromBuffer(value));
  static final _$pred = $grpc.ClientMethod<$1.StreamBusVideoRequest, $2.PredResponse>(
      '/machine_learning.v1.MachineLearningService/Pred',
      ($1.StreamBusVideoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.PredResponse.fromBuffer(value));
  static final _$faceDetectAndClip = $grpc.ClientMethod<$2.FaceDetectAndClipRequest, $2.FaceDetectAndClipResponse>(
      '/machine_learning.v1.MachineLearningService/FaceDetectAndClip',
      ($2.FaceDetectAndClipRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.FaceDetectAndClipResponse.fromBuffer(value));

  MachineLearningServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$2.TrainResponse> train($2.TrainRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$train, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$2.PredResponse> pred($async.Stream<$1.StreamBusVideoRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$pred, request, options: options);
  }

  $grpc.ResponseFuture<$2.FaceDetectAndClipResponse> faceDetectAndClip($2.FaceDetectAndClipRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$faceDetectAndClip, request, options: options);
  }
}

@$pb.GrpcServiceName('machine_learning.v1.MachineLearningService')
abstract class MachineLearningServiceBase extends $grpc.Service {
  $core.String get $name => 'machine_learning.v1.MachineLearningService';

  MachineLearningServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.TrainRequest, $2.TrainResponse>(
        'Train',
        train_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.TrainRequest.fromBuffer(value),
        ($2.TrainResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StreamBusVideoRequest, $2.PredResponse>(
        'Pred',
        pred,
        true,
        true,
        ($core.List<$core.int> value) => $1.StreamBusVideoRequest.fromBuffer(value),
        ($2.PredResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FaceDetectAndClipRequest, $2.FaceDetectAndClipResponse>(
        'FaceDetectAndClip',
        faceDetectAndClip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FaceDetectAndClipRequest.fromBuffer(value),
        ($2.FaceDetectAndClipResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$2.TrainResponse> train_Pre($grpc.ServiceCall call, $async.Future<$2.TrainRequest> request) async* {
    yield* train(call, await request);
  }

  $async.Future<$2.FaceDetectAndClipResponse> faceDetectAndClip_Pre($grpc.ServiceCall call, $async.Future<$2.FaceDetectAndClipRequest> request) async {
    return faceDetectAndClip(call, await request);
  }

  $async.Stream<$2.TrainResponse> train($grpc.ServiceCall call, $2.TrainRequest request);
  $async.Stream<$2.PredResponse> pred($grpc.ServiceCall call, $async.Stream<$1.StreamBusVideoRequest> request);
  $async.Future<$2.FaceDetectAndClipResponse> faceDetectAndClip($grpc.ServiceCall call, $2.FaceDetectAndClipRequest request);
}
