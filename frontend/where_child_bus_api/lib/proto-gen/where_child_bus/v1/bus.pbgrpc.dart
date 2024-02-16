//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/bus.proto
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

import 'bus.pb.dart' as $0;

export 'bus.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.BusService')
class BusServiceClient extends $grpc.Client {
  static final _$createBus = $grpc.ClientMethod<$0.CreateBusRequest, $0.CreateBusResponse>(
      '/where_child_bus.v1.BusService/CreateBus',
      ($0.CreateBusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateBusResponse.fromBuffer(value));
  static final _$getBusListByNurseryId = $grpc.ClientMethod<$0.GetBusListByNurseryIdRequest, $0.GetBusListByNurseryIdResponse>(
      '/where_child_bus.v1.BusService/GetBusListByNurseryId',
      ($0.GetBusListByNurseryIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBusListByNurseryIdResponse.fromBuffer(value));
  static final _$changeBusStatus = $grpc.ClientMethod<$0.ChangeBusStatusRequest, $0.ChangeBusStatusResponse>(
      '/where_child_bus.v1.BusService/ChangeBusStatus',
      ($0.ChangeBusStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChangeBusStatusResponse.fromBuffer(value));

  BusServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateBusResponse> createBus($0.CreateBusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBus, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBusListByNurseryIdResponse> getBusListByNurseryId($0.GetBusListByNurseryIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBusListByNurseryId, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChangeBusStatusResponse> changeBusStatus($0.ChangeBusStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeBusStatus, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.BusService')
abstract class BusServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.BusService';

  BusServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateBusRequest, $0.CreateBusResponse>(
        'CreateBus',
        createBus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateBusRequest.fromBuffer(value),
        ($0.CreateBusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBusListByNurseryIdRequest, $0.GetBusListByNurseryIdResponse>(
        'GetBusListByNurseryId',
        getBusListByNurseryId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBusListByNurseryIdRequest.fromBuffer(value),
        ($0.GetBusListByNurseryIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangeBusStatusRequest, $0.ChangeBusStatusResponse>(
        'ChangeBusStatus',
        changeBusStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChangeBusStatusRequest.fromBuffer(value),
        ($0.ChangeBusStatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateBusResponse> createBus_Pre($grpc.ServiceCall call, $async.Future<$0.CreateBusRequest> request) async {
    return createBus(call, await request);
  }

  $async.Future<$0.GetBusListByNurseryIdResponse> getBusListByNurseryId_Pre($grpc.ServiceCall call, $async.Future<$0.GetBusListByNurseryIdRequest> request) async {
    return getBusListByNurseryId(call, await request);
  }

  $async.Future<$0.ChangeBusStatusResponse> changeBusStatus_Pre($grpc.ServiceCall call, $async.Future<$0.ChangeBusStatusRequest> request) async {
    return changeBusStatus(call, await request);
  }

  $async.Future<$0.CreateBusResponse> createBus($grpc.ServiceCall call, $0.CreateBusRequest request);
  $async.Future<$0.GetBusListByNurseryIdResponse> getBusListByNurseryId($grpc.ServiceCall call, $0.GetBusListByNurseryIdRequest request);
  $async.Future<$0.ChangeBusStatusResponse> changeBusStatus($grpc.ServiceCall call, $0.ChangeBusStatusRequest request);
}
