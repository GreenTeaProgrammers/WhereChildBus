//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/guardian.proto
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

import 'guardian.pb.dart' as $4;

export 'guardian.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.GuardianService')
class GuardianServiceClient extends $grpc.Client {
  static final _$createGuardian = $grpc.ClientMethod<$4.CreateGuardianRequest, $4.CreateGuardianResponse>(
      '/where_child_bus.v1.GuardianService/CreateGuardian',
      ($4.CreateGuardianRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.CreateGuardianResponse.fromBuffer(value));
  static final _$guardianLogin = $grpc.ClientMethod<$4.GuardianLoginRequest, $4.GuardianLoginResponse>(
      '/where_child_bus.v1.GuardianService/GuardianLogin',
      ($4.GuardianLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.GuardianLoginResponse.fromBuffer(value));
  static final _$getGuardianListByBusId = $grpc.ClientMethod<$4.GetGuardianListByBusIdRequest, $4.GetGuardianListByBusIdResponse>(
      '/where_child_bus.v1.GuardianService/GetGuardianListByBusId',
      ($4.GetGuardianListByBusIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.GetGuardianListByBusIdResponse.fromBuffer(value));
  static final _$getGuardianByChildId = $grpc.ClientMethod<$4.GetGuardianByChildIdRequest, $4.GetGuardianByChildIdResponse>(
      '/where_child_bus.v1.GuardianService/GetGuardianByChildId',
      ($4.GetGuardianByChildIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.GetGuardianByChildIdResponse.fromBuffer(value));
  static final _$getGuardianListByNurseryId = $grpc.ClientMethod<$4.GetGuardianListByNurseryIdRequest, $4.GetGuardianListByNurseryIdResponse>(
      '/where_child_bus.v1.GuardianService/GetGuardianListByNurseryId',
      ($4.GetGuardianListByNurseryIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.GetGuardianListByNurseryIdResponse.fromBuffer(value));
  static final _$updateGuardian = $grpc.ClientMethod<$4.UpdateGuardianRequest, $4.UpdateGuardianResponse>(
      '/where_child_bus.v1.GuardianService/UpdateGuardian',
      ($4.UpdateGuardianRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.UpdateGuardianResponse.fromBuffer(value));

  GuardianServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.CreateGuardianResponse> createGuardian($4.CreateGuardianRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGuardian, request, options: options);
  }

  $grpc.ResponseFuture<$4.GuardianLoginResponse> guardianLogin($4.GuardianLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$guardianLogin, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetGuardianListByBusIdResponse> getGuardianListByBusId($4.GetGuardianListByBusIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGuardianListByBusId, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetGuardianByChildIdResponse> getGuardianByChildId($4.GetGuardianByChildIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGuardianByChildId, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetGuardianListByNurseryIdResponse> getGuardianListByNurseryId($4.GetGuardianListByNurseryIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGuardianListByNurseryId, request, options: options);
  }

  $grpc.ResponseFuture<$4.UpdateGuardianResponse> updateGuardian($4.UpdateGuardianRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateGuardian, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.GuardianService')
abstract class GuardianServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.GuardianService';

  GuardianServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.CreateGuardianRequest, $4.CreateGuardianResponse>(
        'CreateGuardian',
        createGuardian_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.CreateGuardianRequest.fromBuffer(value),
        ($4.CreateGuardianResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GuardianLoginRequest, $4.GuardianLoginResponse>(
        'GuardianLogin',
        guardianLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GuardianLoginRequest.fromBuffer(value),
        ($4.GuardianLoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetGuardianListByBusIdRequest, $4.GetGuardianListByBusIdResponse>(
        'GetGuardianListByBusId',
        getGuardianListByBusId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetGuardianListByBusIdRequest.fromBuffer(value),
        ($4.GetGuardianListByBusIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetGuardianByChildIdRequest, $4.GetGuardianByChildIdResponse>(
        'GetGuardianByChildId',
        getGuardianByChildId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetGuardianByChildIdRequest.fromBuffer(value),
        ($4.GetGuardianByChildIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetGuardianListByNurseryIdRequest, $4.GetGuardianListByNurseryIdResponse>(
        'GetGuardianListByNurseryId',
        getGuardianListByNurseryId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetGuardianListByNurseryIdRequest.fromBuffer(value),
        ($4.GetGuardianListByNurseryIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UpdateGuardianRequest, $4.UpdateGuardianResponse>(
        'UpdateGuardian',
        updateGuardian_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UpdateGuardianRequest.fromBuffer(value),
        ($4.UpdateGuardianResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.CreateGuardianResponse> createGuardian_Pre($grpc.ServiceCall call, $async.Future<$4.CreateGuardianRequest> request) async {
    return createGuardian(call, await request);
  }

  $async.Future<$4.GuardianLoginResponse> guardianLogin_Pre($grpc.ServiceCall call, $async.Future<$4.GuardianLoginRequest> request) async {
    return guardianLogin(call, await request);
  }

  $async.Future<$4.GetGuardianListByBusIdResponse> getGuardianListByBusId_Pre($grpc.ServiceCall call, $async.Future<$4.GetGuardianListByBusIdRequest> request) async {
    return getGuardianListByBusId(call, await request);
  }

  $async.Future<$4.GetGuardianByChildIdResponse> getGuardianByChildId_Pre($grpc.ServiceCall call, $async.Future<$4.GetGuardianByChildIdRequest> request) async {
    return getGuardianByChildId(call, await request);
  }

  $async.Future<$4.GetGuardianListByNurseryIdResponse> getGuardianListByNurseryId_Pre($grpc.ServiceCall call, $async.Future<$4.GetGuardianListByNurseryIdRequest> request) async {
    return getGuardianListByNurseryId(call, await request);
  }

  $async.Future<$4.UpdateGuardianResponse> updateGuardian_Pre($grpc.ServiceCall call, $async.Future<$4.UpdateGuardianRequest> request) async {
    return updateGuardian(call, await request);
  }

  $async.Future<$4.CreateGuardianResponse> createGuardian($grpc.ServiceCall call, $4.CreateGuardianRequest request);
  $async.Future<$4.GuardianLoginResponse> guardianLogin($grpc.ServiceCall call, $4.GuardianLoginRequest request);
  $async.Future<$4.GetGuardianListByBusIdResponse> getGuardianListByBusId($grpc.ServiceCall call, $4.GetGuardianListByBusIdRequest request);
  $async.Future<$4.GetGuardianByChildIdResponse> getGuardianByChildId($grpc.ServiceCall call, $4.GetGuardianByChildIdRequest request);
  $async.Future<$4.GetGuardianListByNurseryIdResponse> getGuardianListByNurseryId($grpc.ServiceCall call, $4.GetGuardianListByNurseryIdRequest request);
  $async.Future<$4.UpdateGuardianResponse> updateGuardian($grpc.ServiceCall call, $4.UpdateGuardianRequest request);
}
