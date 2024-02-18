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
  }

  $async.Future<$6.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateStationLocationByGuardianIdRequest> request) async {
    return updateStationLocationByGuardianId(call, await request);
  }

  $async.Future<$6.GetStationListByBusIdResponse> getStationListByBusId_Pre($grpc.ServiceCall call, $async.Future<$6.GetStationListByBusIdRequest> request) async {
    return getStationListByBusId(call, await request);
  }

  $async.Future<$6.UpdateStationLocationByGuardianIdResponse> updateStationLocationByGuardianId($grpc.ServiceCall call, $6.UpdateStationLocationByGuardianIdRequest request);
  $async.Future<$6.GetStationListByBusIdResponse> getStationListByBusId($grpc.ServiceCall call, $6.GetStationListByBusIdRequest request);
}
