//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/nursery.proto
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

import 'nursery.pb.dart' as $5;

export 'nursery.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.NurseryService')
class NurseryServiceClient extends $grpc.Client {
  static final _$getNurseryByGuardianId = $grpc.ClientMethod<$5.GetNurseryByGuardianIdRequest, $5.GetNurseryByGuardianIdResponse>(
      '/where_child_bus.v1.NurseryService/GetNurseryByGuardianId',
      ($5.GetNurseryByGuardianIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.GetNurseryByGuardianIdResponse.fromBuffer(value));
  static final _$createNursery = $grpc.ClientMethod<$5.CreateNurseryRequest, $5.CreateNurseryResponse>(
      '/where_child_bus.v1.NurseryService/CreateNursery',
      ($5.CreateNurseryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.CreateNurseryResponse.fromBuffer(value));
  static final _$nurseryLogin = $grpc.ClientMethod<$5.NurseryLoginRequest, $5.NurseryLoginResponse>(
      '/where_child_bus.v1.NurseryService/NurseryLogin',
      ($5.NurseryLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.NurseryLoginResponse.fromBuffer(value));
  static final _$updateNursery = $grpc.ClientMethod<$5.UpdateNurseryRequest, $5.UpdateNurseryResponse>(
      '/where_child_bus.v1.NurseryService/UpdateNursery',
      ($5.UpdateNurseryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.UpdateNurseryResponse.fromBuffer(value));

  NurseryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$5.GetNurseryByGuardianIdResponse> getNurseryByGuardianId($5.GetNurseryByGuardianIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNurseryByGuardianId, request, options: options);
  }

  $grpc.ResponseFuture<$5.CreateNurseryResponse> createNursery($5.CreateNurseryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createNursery, request, options: options);
  }

  $grpc.ResponseFuture<$5.NurseryLoginResponse> nurseryLogin($5.NurseryLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$nurseryLogin, request, options: options);
  }

  $grpc.ResponseFuture<$5.UpdateNurseryResponse> updateNursery($5.UpdateNurseryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateNursery, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.NurseryService')
abstract class NurseryServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.NurseryService';

  NurseryServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.GetNurseryByGuardianIdRequest, $5.GetNurseryByGuardianIdResponse>(
        'GetNurseryByGuardianId',
        getNurseryByGuardianId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GetNurseryByGuardianIdRequest.fromBuffer(value),
        ($5.GetNurseryByGuardianIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.CreateNurseryRequest, $5.CreateNurseryResponse>(
        'CreateNursery',
        createNursery_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.CreateNurseryRequest.fromBuffer(value),
        ($5.CreateNurseryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.NurseryLoginRequest, $5.NurseryLoginResponse>(
        'NurseryLogin',
        nurseryLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.NurseryLoginRequest.fromBuffer(value),
        ($5.NurseryLoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.UpdateNurseryRequest, $5.UpdateNurseryResponse>(
        'UpdateNursery',
        updateNursery_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.UpdateNurseryRequest.fromBuffer(value),
        ($5.UpdateNurseryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.GetNurseryByGuardianIdResponse> getNurseryByGuardianId_Pre($grpc.ServiceCall call, $async.Future<$5.GetNurseryByGuardianIdRequest> request) async {
    return getNurseryByGuardianId(call, await request);
  }

  $async.Future<$5.CreateNurseryResponse> createNursery_Pre($grpc.ServiceCall call, $async.Future<$5.CreateNurseryRequest> request) async {
    return createNursery(call, await request);
  }

  $async.Future<$5.NurseryLoginResponse> nurseryLogin_Pre($grpc.ServiceCall call, $async.Future<$5.NurseryLoginRequest> request) async {
    return nurseryLogin(call, await request);
  }

  $async.Future<$5.UpdateNurseryResponse> updateNursery_Pre($grpc.ServiceCall call, $async.Future<$5.UpdateNurseryRequest> request) async {
    return updateNursery(call, await request);
  }

  $async.Future<$5.GetNurseryByGuardianIdResponse> getNurseryByGuardianId($grpc.ServiceCall call, $5.GetNurseryByGuardianIdRequest request);
  $async.Future<$5.CreateNurseryResponse> createNursery($grpc.ServiceCall call, $5.CreateNurseryRequest request);
  $async.Future<$5.NurseryLoginResponse> nurseryLogin($grpc.ServiceCall call, $5.NurseryLoginRequest request);
  $async.Future<$5.UpdateNurseryResponse> updateNursery($grpc.ServiceCall call, $5.UpdateNurseryRequest request);
}
