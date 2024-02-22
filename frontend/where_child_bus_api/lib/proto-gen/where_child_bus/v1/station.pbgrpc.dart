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

import 'station.pb.dart' as $6;

export 'station.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.StationService')
class StationServiceClient extends $grpc.Client {
  static final _$updateStationLocationByGuardianId = $grpc.ClientMethod<$6.UpdateStationLocationByGuardianIdRequest, $6.UpdateStationLocationByGuardianIdResponse>(
      '/where_child_bus.v1.StationService/UpdateStationLocationByGuardianId',
      ($6.UpdateStationLocationByGuardianIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.UpdateStationLocationByGuardianIdResponse.fromBuffer(value));
  static final _$getStationListByBusId = $grpc.ClientMethod<$6.GetStationListByBusIdRequest, $6.GetStationListByBusIdResponse>(
      '/where_child_bus.v1.StationService/GetStationListByBusId',
      ($6.GetStationListByBusIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetStationListByBusIdResponse.fromBuffer(value));
  static final _$getCorrectOrderStationListByBusId = $grpc.ClientMethod<$6.GetCorrectOrderStationListByBusIdRequest, $6.GetCorrectOrderStationListByBusIdResponse>(
      '/where_child_bus.v1.StationService/GetCorrectOrderStationListByBusId',
      ($6.GetCorrectOrderStationListByBusIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetCorrectOrderStationListByBusIdResponse.fromBuffer(value));
  static final _$getUnregisteredStationList = $grpc.ClientMethod<$6.GetUnregisteredStationListRequest, $6.GetUnregisteredStationListResponse>(
      '/where_child_bus.v1.StationService/GetUnregisteredStationList',
      ($6.GetUnregisteredStationListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetUnregisteredStationListResponse.fromBuffer(value));
  static final _$updateStation = $grpc.ClientMethod<$6.UpdateStationRequest, $6.UpdateStationResponse>(
      '/where_child_bus.v1.StationService/UpdateStation',
      ($6.UpdateStationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.UpdateStationResponse.fromBuffer(value));

  StationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId($6.UpdateStationLocationByGuardianIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStationLocationByGuardianId, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetStationListByBusIdResponse> getStationListByBusId($6.GetStationListByBusIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStationListByBusId, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetCorrectOrderStationListByBusIdResponse> getCorrectOrderStationListByBusId($6.GetCorrectOrderStationListByBusIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCorrectOrderStationListByBusId, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetUnregisteredStationListResponse> getUnregisteredStationList($6.GetUnregisteredStationListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUnregisteredStationList, request, options: options);
  }

  $grpc.ResponseFuture<$6.UpdateStationResponse> updateStation($6.UpdateStationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStation, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.StationService')
abstract class StationServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.StationService';

  StationServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.UpdateStationLocationByGuardianIdRequest, $6.UpdateStationLocationByGuardianIdResponse>(
        'UpdateStationLocationByGuardianId',
        updateStationLocationByGuardianId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UpdateStationLocationByGuardianIdRequest.fromBuffer(value),
        ($6.UpdateStationLocationByGuardianIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetStationListByBusIdRequest, $6.GetStationListByBusIdResponse>(
        'GetStationListByBusId',
        getStationListByBusId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetStationListByBusIdRequest.fromBuffer(value),
        ($6.GetStationListByBusIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetCorrectOrderStationListByBusIdRequest, $6.GetCorrectOrderStationListByBusIdResponse>(
        'GetCorrectOrderStationListByBusId',
        getCorrectOrderStationListByBusId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetCorrectOrderStationListByBusIdRequest.fromBuffer(value),
        ($6.GetCorrectOrderStationListByBusIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetUnregisteredStationListRequest, $6.GetUnregisteredStationListResponse>(
        'GetUnregisteredStationList',
        getUnregisteredStationList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetUnregisteredStationListRequest.fromBuffer(value),
        ($6.GetUnregisteredStationListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UpdateStationRequest, $6.UpdateStationResponse>(
        'UpdateStation',
        updateStation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UpdateStationRequest.fromBuffer(value),
        ($6.UpdateStationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateStationLocationByGuardianIdRequest> request) async {
    return updateStationLocationByGuardianId(call, await request);
  }

  $async.Future<$6.GetStationListByBusIdResponse> getStationListByBusId_Pre($grpc.ServiceCall call, $async.Future<$6.GetStationListByBusIdRequest> request) async {
    return getStationListByBusId(call, await request);
  }

  $async.Future<$6.GetCorrectOrderStationListByBusIdResponse> getCorrectOrderStationListByBusId_Pre($grpc.ServiceCall call, $async.Future<$6.GetCorrectOrderStationListByBusIdRequest> request) async {
    return getCorrectOrderStationListByBusId(call, await request);
  }

  $async.Future<$6.GetUnregisteredStationListResponse> getUnregisteredStationList_Pre($grpc.ServiceCall call, $async.Future<$6.GetUnregisteredStationListRequest> request) async {
    return getUnregisteredStationList(call, await request);
  }

  $async.Future<$6.UpdateStationResponse> updateStation_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateStationRequest> request) async {
    return updateStation(call, await request);
  }

  $async.Future<$6.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId($grpc.ServiceCall call, $6.UpdateStationLocationByGuardianIdRequest request);
  $async.Future<$6.GetStationListByBusIdResponse> getStationListByBusId($grpc.ServiceCall call, $6.GetStationListByBusIdRequest request);
  $async.Future<$6.GetCorrectOrderStationListByBusIdResponse> getCorrectOrderStationListByBusId($grpc.ServiceCall call, $6.GetCorrectOrderStationListByBusIdRequest request);
  $async.Future<$6.GetUnregisteredStationListResponse> getUnregisteredStationList($grpc.ServiceCall call, $6.GetUnregisteredStationListRequest request);
  $async.Future<$6.UpdateStationResponse> updateStation($grpc.ServiceCall call, $6.UpdateStationRequest request);
}
