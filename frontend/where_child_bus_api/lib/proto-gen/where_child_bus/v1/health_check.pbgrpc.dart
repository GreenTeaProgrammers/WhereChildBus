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

import 'health_check.pb.dart' as $4;

export 'health_check.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.HealthcheckService')
class HealthCheckServiceClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$4.PingRequest, $4.PingResponse>(
      '/where_child_bus.v1.HealthcheckService/Ping',
      ($4.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.PingResponse.fromBuffer(value));

  HealthCheckServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.PingResponse> ping($4.PingRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.HealthcheckService')
abstract class HealthcheckServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.HealthcheckService';

  HealthcheckServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.PingRequest, $4.PingResponse>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.PingRequest.fromBuffer(value),
        ($4.PingResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.PingResponse> ping_Pre(
      $grpc.ServiceCall call, $async.Future<$4.PingRequest> request) async {
    return ping(call, await request);
  }

  $async.Future<$4.PingResponse> ping(
      $grpc.ServiceCall call, $4.PingRequest request);
}
