//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/health_check.proto
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

import 'health_check.pb.dart' as $3;

export 'health_check.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.HealthcheckService')
class HealthcheckServiceClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$3.PingRequest, $3.PingResponse>(
      '/where_child_bus.v1.HealthcheckService/Ping',
      ($3.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.PingResponse.fromBuffer(value));

  HealthcheckServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.PingResponse> ping($3.PingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.HealthcheckService')
abstract class HealthcheckServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.HealthcheckService';

  HealthcheckServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.PingRequest, $3.PingResponse>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.PingRequest.fromBuffer(value),
        ($3.PingResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.PingResponse> ping_Pre($grpc.ServiceCall call, $async.Future<$3.PingRequest> request) async {
    return ping(call, await request);
  }

  $async.Future<$3.PingResponse> ping($grpc.ServiceCall call, $3.PingRequest request);
}
