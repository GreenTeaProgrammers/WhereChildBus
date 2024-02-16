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

import 'guardian.pb.dart' as $3;

export 'guardian.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.GuardianService')
class GuardianServiceClient extends $grpc.Client {
  static final _$createGuardian = $grpc.ClientMethod<$3.CreateGuardianRequest, $3.CreateGuardianResponse>(
      '/where_child_bus.v1.GuardianService/CreateGuardian',
      ($3.CreateGuardianRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CreateGuardianResponse.fromBuffer(value));
  static final _$guardianLogin = $grpc.ClientMethod<$3.GuardianLoginRequest, $3.GuardianLoginResponse>(
      '/where_child_bus.v1.GuardianService/GuardianLogin',
      ($3.GuardianLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GuardianLoginResponse.fromBuffer(value));
  static final _$getGuardianListByBusId = $grpc.ClientMethod<$3.GetGuardianListByBusIdRequest, $3.GetGuardianListByBusIdResponse>(
      '/where_child_bus.v1.GuardianService/GetGuardianListByBusId',
      ($3.GetGuardianListByBusIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetGuardianListByBusIdResponse.fromBuffer(value));

  GuardianServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.CreateGuardianResponse> createGuardian($3.CreateGuardianRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGuardian, request, options: options);
  }

  $grpc.ResponseFuture<$3.GuardianLoginResponse> guardianLogin($3.GuardianLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$guardianLogin, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetGuardianListByBusIdResponse> getGuardianListByBusId($3.GetGuardianListByBusIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGuardianListByBusId, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.GuardianService')
abstract class GuardianServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.GuardianService';

  GuardianServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.CreateGuardianRequest, $3.CreateGuardianResponse>(
        'CreateGuardian',
        createGuardian_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateGuardianRequest.fromBuffer(value),
        ($3.CreateGuardianResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GuardianLoginRequest, $3.GuardianLoginResponse>(
        'GuardianLogin',
        guardianLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GuardianLoginRequest.fromBuffer(value),
        ($3.GuardianLoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetGuardianListByBusIdRequest, $3.GetGuardianListByBusIdResponse>(
        'GetGuardianListByBusId',
        getGuardianListByBusId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetGuardianListByBusIdRequest.fromBuffer(value),
        ($3.GetGuardianListByBusIdResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.CreateGuardianResponse> createGuardian_Pre($grpc.ServiceCall call, $async.Future<$3.CreateGuardianRequest> request) async {
    return createGuardian(call, await request);
  }

  $async.Future<$3.GuardianLoginResponse> guardianLogin_Pre($grpc.ServiceCall call, $async.Future<$3.GuardianLoginRequest> request) async {
    return guardianLogin(call, await request);
  }

  $async.Future<$3.GetGuardianListByBusIdResponse> getGuardianListByBusId_Pre($grpc.ServiceCall call, $async.Future<$3.GetGuardianListByBusIdRequest> request) async {
    return getGuardianListByBusId(call, await request);
  }

  $async.Future<$3.CreateGuardianResponse> createGuardian($grpc.ServiceCall call, $3.CreateGuardianRequest request);
  $async.Future<$3.GuardianLoginResponse> guardianLogin($grpc.ServiceCall call, $3.GuardianLoginRequest request);
  $async.Future<$3.GetGuardianListByBusIdResponse> getGuardianListByBusId($grpc.ServiceCall call, $3.GetGuardianListByBusIdRequest request);
}
