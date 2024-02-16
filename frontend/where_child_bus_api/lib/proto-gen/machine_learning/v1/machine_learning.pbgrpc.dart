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

import 'machine_learning.pb.dart' as $1;

export 'machine_learning.pb.dart';

@$pb.GrpcServiceName('machine_learning.v1.MachineLearningService')
class MachineLearningServiceClient extends $grpc.Client {
  static final _$train = $grpc.ClientMethod<$1.TrainRequest, $1.TrainResponse>(
      '/machine_learning.v1.MachineLearningService/Train',
      ($1.TrainRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.TrainResponse.fromBuffer(value));
  static final _$eval = $grpc.ClientMethod<$1.EvalRequest, $1.EvalResponse>(
      '/machine_learning.v1.MachineLearningService/Eval',
      ($1.EvalRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.EvalResponse.fromBuffer(value));
  static final _$faceDetectAndClip = $grpc.ClientMethod<$1.FaceAndClipRequest, $1.FaceDetectAndClipResponse>(
      '/machine_learning.v1.MachineLearningService/FaceDetectAndClip',
      ($1.FaceAndClipRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.FaceDetectAndClipResponse.fromBuffer(value));

  MachineLearningServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.TrainResponse> train($1.TrainRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$train, request, options: options);
  }

  $grpc.ResponseStream<$1.EvalResponse> eval($async.Stream<$1.EvalRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$eval, request, options: options);
  }

  $grpc.ResponseFuture<$1.FaceDetectAndClipResponse> faceDetectAndClip($1.FaceAndClipRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$faceDetectAndClip, request, options: options);
  }
}

@$pb.GrpcServiceName('machine_learning.v1.MachineLearningService')
abstract class MachineLearningServiceBase extends $grpc.Service {
  $core.String get $name => 'machine_learning.v1.MachineLearningService';

  MachineLearningServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.TrainRequest, $1.TrainResponse>(
        'Train',
        train_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TrainRequest.fromBuffer(value),
        ($1.TrainResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.EvalRequest, $1.EvalResponse>(
        'Eval',
        eval,
        true,
        true,
        ($core.List<$core.int> value) => $1.EvalRequest.fromBuffer(value),
        ($1.EvalResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FaceAndClipRequest, $1.FaceDetectAndClipResponse>(
        'FaceDetectAndClip',
        faceDetectAndClip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FaceAndClipRequest.fromBuffer(value),
        ($1.FaceDetectAndClipResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.TrainResponse> train_Pre($grpc.ServiceCall call, $async.Future<$1.TrainRequest> request) async {
    return train(call, await request);
  }

  $async.Future<$1.FaceDetectAndClipResponse> faceDetectAndClip_Pre($grpc.ServiceCall call, $async.Future<$1.FaceAndClipRequest> request) async {
    return faceDetectAndClip(call, await request);
  }

  $async.Future<$1.TrainResponse> train($grpc.ServiceCall call, $1.TrainRequest request);
  $async.Stream<$1.EvalResponse> eval($grpc.ServiceCall call, $async.Stream<$1.EvalRequest> request);
  $async.Future<$1.FaceDetectAndClipResponse> faceDetectAndClip($grpc.ServiceCall call, $1.FaceAndClipRequest request);
}
