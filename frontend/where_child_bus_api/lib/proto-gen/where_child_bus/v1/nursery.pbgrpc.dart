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

import 'nursery.pb.dart' as $6;

export 'nursery.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.NurseryService')
class NurseryServiceClient extends $grpc.Client {
  static final _$getNurseryByGuardianId = $grpc.ClientMethod<$6.GetNurseryByGuardianIdRequest, $6.GetNurseryByGuardianIdResponse>(
      '/where_child_bus.v1.NurseryService/GetNurseryByGuardianId',
      ($6.GetNurseryByGuardianIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetNurseryByGuardianIdResponse.fromBuffer(value));
  static final _$createNursery = $grpc.ClientMethod<$6.CreateNurseryRequest, $6.CreateNurseryResponse>(
      '/where_child_bus.v1.NurseryService/CreateNursery',
      ($6.CreateNurseryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.CreateNurseryResponse.fromBuffer(value));
  static final _$nurseryLogin = $grpc.ClientMethod<$6.NurseryLoginRequest, $6.NurseryLoginResponse>(
      '/where_child_bus.v1.NurseryService/NurseryLogin',
      ($6.NurseryLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.NurseryLoginResponse.fromBuffer(value));
  static final _$updateNursery = $grpc.ClientMethod<$6.UpdateNurseryRequest, $6.UpdateNurseryResponse>(
      '/where_child_bus.v1.NurseryService/UpdateNursery',
      ($6.UpdateNurseryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.UpdateNurseryResponse.fromBuffer(value));

  NurseryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.GetNurseryByGuardianIdResponse> getNurseryByGuardianId($6.GetNurseryByGuardianIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNurseryByGuardianId, request, options: options);
  }

  $grpc.ResponseFuture<$6.CreateNurseryResponse> createNursery($6.CreateNurseryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createNursery, request, options: options);
  }

  $grpc.ResponseFuture<$6.NurseryLoginResponse> nurseryLogin($6.NurseryLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$nurseryLogin, request, options: options);
  }

  $grpc.ResponseFuture<$6.UpdateNurseryResponse> updateNursery($6.UpdateNurseryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateNursery, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.NurseryService')
abstract class NurseryServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.NurseryService';

  NurseryServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.GetNurseryByGuardianIdRequest, $6.GetNurseryByGuardianIdResponse>(
        'GetNurseryByGuardianId',
        getNurseryByGuardianId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetNurseryByGuardianIdRequest.fromBuffer(value),
        ($6.GetNurseryByGuardianIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.CreateNurseryRequest, $6.CreateNurseryResponse>(
        'CreateNursery',
        createNursery_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.CreateNurseryRequest.fromBuffer(value),
        ($6.CreateNurseryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.NurseryLoginRequest, $6.NurseryLoginResponse>(
        'NurseryLogin',
        nurseryLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.NurseryLoginRequest.fromBuffer(value),
        ($6.NurseryLoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UpdateNurseryRequest, $6.UpdateNurseryResponse>(
        'UpdateNursery',
        updateNursery_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UpdateNurseryRequest.fromBuffer(value),
        ($6.UpdateNurseryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.GetNurseryByGuardianIdResponse> getNurseryByGuardianId_Pre($grpc.ServiceCall call, $async.Future<$6.GetNurseryByGuardianIdRequest> request) async {
    return getNurseryByGuardianId(call, await request);
  }

  $async.Future<$6.CreateNurseryResponse> createNursery_Pre($grpc.ServiceCall call, $async.Future<$6.CreateNurseryRequest> request) async {
    return createNursery(call, await request);
  }

  $async.Future<$6.NurseryLoginResponse> nurseryLogin_Pre($grpc.ServiceCall call, $async.Future<$6.NurseryLoginRequest> request) async {
    return nurseryLogin(call, await request);
  }

  $async.Future<$6.UpdateNurseryResponse> updateNursery_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateNurseryRequest> request) async {
    return updateNursery(call, await request);
  }

  $async.Future<$6.GetNurseryByGuardianIdResponse> getNurseryByGuardianId($grpc.ServiceCall call, $6.GetNurseryByGuardianIdRequest request);
  $async.Future<$6.CreateNurseryResponse> createNursery($grpc.ServiceCall call, $6.CreateNurseryRequest request);
  $async.Future<$6.NurseryLoginResponse> nurseryLogin($grpc.ServiceCall call, $6.NurseryLoginRequest request);
  $async.Future<$6.UpdateNurseryResponse> updateNursery($grpc.ServiceCall call, $6.UpdateNurseryRequest request);
}
