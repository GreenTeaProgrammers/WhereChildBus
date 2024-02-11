//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child.proto
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

import 'child.pb.dart' as $1;

export 'child.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.ChildService')
class ChildServiceClient extends $grpc.Client {
  static final _$getChildListByNurseryID = $grpc.ClientMethod<$1.GetChildListByNurseryIDRequest, $1.GetChildListByNurseryIDResponse>(
      '/where_child_bus.v1.ChildService/GetChildListByNurseryID',
      ($1.GetChildListByNurseryIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetChildListByNurseryIDResponse.fromBuffer(value));
  static final _$getChildListByGuardianID = $grpc.ClientMethod<$1.GetChildListByGuardianIDRequest, $1.GetChildListByGuardianIDResponse>(
      '/where_child_bus.v1.ChildService/GetChildListByGuardianID',
      ($1.GetChildListByGuardianIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetChildListByGuardianIDResponse.fromBuffer(value));

  ChildServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetChildListByNurseryIDResponse> getChildListByNurseryID($1.GetChildListByNurseryIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChildListByNurseryID, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetChildListByGuardianIDResponse> getChildListByGuardianID($1.GetChildListByGuardianIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChildListByGuardianID, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.ChildService')
abstract class ChildServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.ChildService';

  ChildServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GetChildListByNurseryIDRequest, $1.GetChildListByNurseryIDResponse>(
        'GetChildListByNurseryID',
        getChildListByNurseryID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetChildListByNurseryIDRequest.fromBuffer(value),
        ($1.GetChildListByNurseryIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetChildListByGuardianIDRequest, $1.GetChildListByGuardianIDResponse>(
        'GetChildListByGuardianID',
        getChildListByGuardianID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetChildListByGuardianIDRequest.fromBuffer(value),
        ($1.GetChildListByGuardianIDResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetChildListByNurseryIDResponse> getChildListByNurseryID_Pre($grpc.ServiceCall call, $async.Future<$1.GetChildListByNurseryIDRequest> request) async {
    return getChildListByNurseryID(call, await request);
  }

  $async.Future<$1.GetChildListByGuardianIDResponse> getChildListByGuardianID_Pre($grpc.ServiceCall call, $async.Future<$1.GetChildListByGuardianIDRequest> request) async {
    return getChildListByGuardianID(call, await request);
  }

  $async.Future<$1.GetChildListByNurseryIDResponse> getChildListByNurseryID($grpc.ServiceCall call, $1.GetChildListByNurseryIDRequest request);
  $async.Future<$1.GetChildListByGuardianIDResponse> getChildListByGuardianID($grpc.ServiceCall call, $1.GetChildListByGuardianIDRequest request);
}
