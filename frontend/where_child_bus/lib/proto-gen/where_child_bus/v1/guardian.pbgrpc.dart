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

import 'guardian.pb.dart' as $2;

export 'guardian.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.GuardianService')
class GuardianServiceClient extends $grpc.Client {
  static final _$guardianLogin = $grpc.ClientMethod<$2.GuardianLoginRequest, $2.GuardianLoginResponse>(
      '/where_child_bus.v1.GuardianService/GuardianLogin',
      ($2.GuardianLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GuardianLoginResponse.fromBuffer(value));

  GuardianServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.GuardianLoginResponse> guardianLogin($2.GuardianLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$guardianLogin, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.GuardianService')
abstract class GuardianServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.GuardianService';

  GuardianServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GuardianLoginRequest, $2.GuardianLoginResponse>(
        'GuardianLogin',
        guardianLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GuardianLoginRequest.fromBuffer(value),
        ($2.GuardianLoginResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.GuardianLoginResponse> guardianLogin_Pre($grpc.ServiceCall call, $async.Future<$2.GuardianLoginRequest> request) async {
    return guardianLogin(call, await request);
  }

  $async.Future<$2.GuardianLoginResponse> guardianLogin($grpc.ServiceCall call, $2.GuardianLoginRequest request);
}
