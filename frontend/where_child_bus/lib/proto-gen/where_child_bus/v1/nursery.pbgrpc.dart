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

import 'nursery.pb.dart' as $4;

export 'nursery.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.NurseryService')
class NurseryServiceClient extends $grpc.Client {
  static final _$nurseryLogin = $grpc.ClientMethod<$4.NurseryLoginRequest, $4.NurseryLoginResponse>(
      '/where_child_bus.v1.NurseryService/NurseryLogin',
      ($4.NurseryLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.NurseryLoginResponse.fromBuffer(value));

  NurseryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.NurseryLoginResponse> nurseryLogin($4.NurseryLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$nurseryLogin, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.NurseryService')
abstract class NurseryServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.NurseryService';

  NurseryServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.NurseryLoginRequest, $4.NurseryLoginResponse>(
        'NurseryLogin',
        nurseryLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.NurseryLoginRequest.fromBuffer(value),
        ($4.NurseryLoginResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.NurseryLoginResponse> nurseryLogin_Pre($grpc.ServiceCall call, $async.Future<$4.NurseryLoginRequest> request) async {
    return nurseryLogin(call, await request);
  }

  $async.Future<$4.NurseryLoginResponse> nurseryLogin($grpc.ServiceCall call, $4.NurseryLoginRequest request);
}
