//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/station.proto
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

import 'station.pb.dart' as $7;

export 'station.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.StationService')
class StationServiceClient extends $grpc.Client {
  static final _$updateStationLocationByGuardianId = $grpc.ClientMethod<$7.UpdateStationLocationByGuardianIdRequest, $7.UpdateStationLocationByGuardianIdResponse>(
      '/where_child_bus.v1.StationService/UpdateStationLocationByGuardianId',
      ($7.UpdateStationLocationByGuardianIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.UpdateStationLocationByGuardianIdResponse.fromBuffer(value));
  static final _$getStationListByBusId = $grpc.ClientMethod<$7.GetStationListByBusIdRequest, $7.GetStationListByBusIdResponse>(
      '/where_child_bus.v1.StationService/GetStationListByBusId',
      ($7.GetStationListByBusIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.GetStationListByBusIdResponse.fromBuffer(value));
  static final _$getUnregisteredStationList = $grpc.ClientMethod<$7.GetUnregisteredStationListRequest, $7.GetUnregisteredStationListResponse>(
      '/where_child_bus.v1.StationService/GetUnregisteredStationList',
      ($7.GetUnregisteredStationListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.GetUnregisteredStationListResponse.fromBuffer(value));
  static final _$updateStation = $grpc.ClientMethod<$7.UpdateStationRequest, $7.UpdateStationResponse>(
      '/where_child_bus.v1.StationService/UpdateStation',
      ($7.UpdateStationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.UpdateStationResponse.fromBuffer(value));

  StationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$7.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId($7.UpdateStationLocationByGuardianIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStationLocationByGuardianId, request, options: options);
  }

  $grpc.ResponseFuture<$7.GetStationListByBusIdResponse> getStationListByBusId($7.GetStationListByBusIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStationListByBusId, request, options: options);
  }

  $grpc.ResponseFuture<$7.GetUnregisteredStationListResponse> getUnregisteredStationList($7.GetUnregisteredStationListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUnregisteredStationList, request, options: options);
  }

  $grpc.ResponseFuture<$7.UpdateStationResponse> updateStation($7.UpdateStationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStation, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.StationService')
abstract class StationServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.StationService';

  StationServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.UpdateStationLocationByGuardianIdRequest, $7.UpdateStationLocationByGuardianIdResponse>(
        'UpdateStationLocationByGuardianId',
        updateStationLocationByGuardianId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UpdateStationLocationByGuardianIdRequest.fromBuffer(value),
        ($7.UpdateStationLocationByGuardianIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetStationListByBusIdRequest, $7.GetStationListByBusIdResponse>(
        'GetStationListByBusId',
        getStationListByBusId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.GetStationListByBusIdRequest.fromBuffer(value),
        ($7.GetStationListByBusIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetUnregisteredStationListRequest, $7.GetUnregisteredStationListResponse>(
        'GetUnregisteredStationList',
        getUnregisteredStationList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.GetUnregisteredStationListRequest.fromBuffer(value),
        ($7.GetUnregisteredStationListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UpdateStationRequest, $7.UpdateStationResponse>(
        'UpdateStation',
        updateStation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UpdateStationRequest.fromBuffer(value),
        ($7.UpdateStationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$7.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId_Pre($grpc.ServiceCall call, $async.Future<$7.UpdateStationLocationByGuardianIdRequest> request) async {
    return updateStationLocationByGuardianId(call, await request);
  }

  $async.Future<$7.GetStationListByBusIdResponse> getStationListByBusId_Pre($grpc.ServiceCall call, $async.Future<$7.GetStationListByBusIdRequest> request) async {
    return getStationListByBusId(call, await request);
  }

  $async.Future<$7.GetUnregisteredStationListResponse> getUnregisteredStationList_Pre($grpc.ServiceCall call, $async.Future<$7.GetUnregisteredStationListRequest> request) async {
    return getUnregisteredStationList(call, await request);
  }

  $async.Future<$7.UpdateStationResponse> updateStation_Pre($grpc.ServiceCall call, $async.Future<$7.UpdateStationRequest> request) async {
    return updateStation(call, await request);
  }

  $async.Future<$7.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId($grpc.ServiceCall call, $7.UpdateStationLocationByGuardianIdRequest request);
  $async.Future<$7.GetStationListByBusIdResponse> getStationListByBusId($grpc.ServiceCall call, $7.GetStationListByBusIdRequest request);
  $async.Future<$7.GetUnregisteredStationListResponse> getUnregisteredStationList($grpc.ServiceCall call, $7.GetUnregisteredStationListRequest request);
  $async.Future<$7.UpdateStationResponse> updateStation($grpc.ServiceCall call, $7.UpdateStationRequest request);
}
