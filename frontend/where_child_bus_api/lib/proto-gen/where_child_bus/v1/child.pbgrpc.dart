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

import 'child.pb.dart' as $2;

export 'child.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.ChildService')
class ChildServiceClient extends $grpc.Client {
  static final _$createChild = $grpc.ClientMethod<$2.CreateChildRequest, $2.CreateChildResponse>(
      '/where_child_bus.v1.ChildService/CreateChild',
      ($2.CreateChildRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CreateChildResponse.fromBuffer(value));
  static final _$getChildListByNurseryID = $grpc.ClientMethod<$2.GetChildListByNurseryIDRequest, $2.GetChildListByNurseryIDResponse>(
      '/where_child_bus.v1.ChildService/GetChildListByNurseryID',
      ($2.GetChildListByNurseryIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetChildListByNurseryIDResponse.fromBuffer(value));
  static final _$getChildListByGuardianID = $grpc.ClientMethod<$2.GetChildListByGuardianIDRequest, $2.GetChildListByGuardianIDResponse>(
      '/where_child_bus.v1.ChildService/GetChildListByGuardianID',
      ($2.GetChildListByGuardianIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetChildListByGuardianIDResponse.fromBuffer(value));
  static final _$getChildListByBusID = $grpc.ClientMethod<$2.GetChildListByBusIDRequest, $2.GetChildListByBusIDResponse>(
      '/where_child_bus.v1.ChildService/GetChildListByBusID',
      ($2.GetChildListByBusIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetChildListByBusIDResponse.fromBuffer(value));
  static final _$checkIsChildInBus = $grpc.ClientMethod<$2.CheckIsChildInBusRequest, $2.CheckIsChildInBusResponse>(
      '/where_child_bus.v1.ChildService/CheckIsChildInBus',
      ($2.CheckIsChildInBusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CheckIsChildInBusResponse.fromBuffer(value));
  static final _$updateChild = $grpc.ClientMethod<$2.UpdateChildRequest, $2.UpdateChildResponse>(
      '/where_child_bus.v1.ChildService/UpdateChild',
      ($2.UpdateChildRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.UpdateChildResponse.fromBuffer(value));

  ChildServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.CreateChildResponse> createChild($2.CreateChildRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChild, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetChildListByNurseryIDResponse> getChildListByNurseryID($2.GetChildListByNurseryIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChildListByNurseryID, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetChildListByGuardianIDResponse> getChildListByGuardianID($2.GetChildListByGuardianIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChildListByGuardianID, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetChildListByBusIDResponse> getChildListByBusID($2.GetChildListByBusIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChildListByBusID, request, options: options);
  }

  $grpc.ResponseFuture<$2.CheckIsChildInBusResponse> checkIsChildInBus($2.CheckIsChildInBusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkIsChildInBus, request, options: options);
  }

  $grpc.ResponseFuture<$2.UpdateChildResponse> updateChild($2.UpdateChildRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateChild, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.ChildService')
abstract class ChildServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.ChildService';

  ChildServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.CreateChildRequest, $2.CreateChildResponse>(
        'CreateChild',
        createChild_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateChildRequest.fromBuffer(value),
        ($2.CreateChildResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetChildListByNurseryIDRequest, $2.GetChildListByNurseryIDResponse>(
        'GetChildListByNurseryID',
        getChildListByNurseryID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetChildListByNurseryIDRequest.fromBuffer(value),
        ($2.GetChildListByNurseryIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetChildListByGuardianIDRequest, $2.GetChildListByGuardianIDResponse>(
        'GetChildListByGuardianID',
        getChildListByGuardianID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetChildListByGuardianIDRequest.fromBuffer(value),
        ($2.GetChildListByGuardianIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetChildListByBusIDRequest, $2.GetChildListByBusIDResponse>(
        'GetChildListByBusID',
        getChildListByBusID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetChildListByBusIDRequest.fromBuffer(value),
        ($2.GetChildListByBusIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CheckIsChildInBusRequest, $2.CheckIsChildInBusResponse>(
        'CheckIsChildInBus',
        checkIsChildInBus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CheckIsChildInBusRequest.fromBuffer(value),
        ($2.CheckIsChildInBusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdateChildRequest, $2.UpdateChildResponse>(
        'UpdateChild',
        updateChild_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdateChildRequest.fromBuffer(value),
        ($2.UpdateChildResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.CreateChildResponse> createChild_Pre($grpc.ServiceCall call, $async.Future<$2.CreateChildRequest> request) async {
    return createChild(call, await request);
  }

  $async.Future<$2.GetChildListByNurseryIDResponse> getChildListByNurseryID_Pre($grpc.ServiceCall call, $async.Future<$2.GetChildListByNurseryIDRequest> request) async {
    return getChildListByNurseryID(call, await request);
  }

  $async.Future<$2.GetChildListByGuardianIDResponse> getChildListByGuardianID_Pre($grpc.ServiceCall call, $async.Future<$2.GetChildListByGuardianIDRequest> request) async {
    return getChildListByGuardianID(call, await request);
  }

  $async.Future<$2.GetChildListByBusIDResponse> getChildListByBusID_Pre($grpc.ServiceCall call, $async.Future<$2.GetChildListByBusIDRequest> request) async {
    return getChildListByBusID(call, await request);
  }

  $async.Future<$2.CheckIsChildInBusResponse> checkIsChildInBus_Pre($grpc.ServiceCall call, $async.Future<$2.CheckIsChildInBusRequest> request) async {
    return checkIsChildInBus(call, await request);
  }

  $async.Future<$2.UpdateChildResponse> updateChild_Pre($grpc.ServiceCall call, $async.Future<$2.UpdateChildRequest> request) async {
    return updateChild(call, await request);
  }

  $async.Future<$2.CreateChildResponse> createChild($grpc.ServiceCall call, $2.CreateChildRequest request);
  $async.Future<$2.GetChildListByNurseryIDResponse> getChildListByNurseryID($grpc.ServiceCall call, $2.GetChildListByNurseryIDRequest request);
  $async.Future<$2.GetChildListByGuardianIDResponse> getChildListByGuardianID($grpc.ServiceCall call, $2.GetChildListByGuardianIDRequest request);
  $async.Future<$2.GetChildListByBusIDResponse> getChildListByBusID($grpc.ServiceCall call, $2.GetChildListByBusIDRequest request);
  $async.Future<$2.CheckIsChildInBusResponse> checkIsChildInBus($grpc.ServiceCall call, $2.CheckIsChildInBusRequest request);
  $async.Future<$2.UpdateChildResponse> updateChild($grpc.ServiceCall call, $2.UpdateChildRequest request);
}
