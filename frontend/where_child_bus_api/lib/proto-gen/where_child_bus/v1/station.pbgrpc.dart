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
  static final _$updateStation = $grpc.ClientMethod<$6.UpdateStationRequest, $6.UpdateStationResponse>(
      '/where_child_bus.v1.StationService/UpdateStation',
      ($6.UpdateStationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.UpdateStationResponse.fromBuffer(value));
  static final _$getStationListByBusId = $grpc.ClientMethod<$6.GetStationListByBusIdRequest, $6.GetStationListByBusIdResponse>(
      '/where_child_bus.v1.StationService/GetStationListByBusId',
      ($6.GetStationListByBusIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetStationListByBusIdResponse.fromBuffer(value));

  StationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.UpdateStationResponse> updateStation($6.UpdateStationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStation, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetStationListByBusIdResponse> getStationListByBusId($6.GetStationListByBusIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStationListByBusId, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.StationService')
abstract class StationServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.StationService';

  StationServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.UpdateStationRequest, $6.UpdateStationResponse>(
        'UpdateStation',
        updateStation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UpdateStationRequest.fromBuffer(value),
        ($6.UpdateStationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetStationListByBusIdRequest, $6.GetStationListByBusIdResponse>(
        'GetStationListByBusId',
        getStationListByBusId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetStationListByBusIdRequest.fromBuffer(value),
        ($6.GetStationListByBusIdResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.UpdateStationResponse> updateStation_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateStationRequest> request) async {
    return updateStation(call, await request);
  }

  $async.Future<$6.GetStationListByBusIdResponse> getStationListByBusId_Pre($grpc.ServiceCall call, $async.Future<$6.GetStationListByBusIdRequest> request) async {
    return getStationListByBusId(call, await request);
  }

  $async.Future<$6.UpdateStationResponse> updateStation($grpc.ServiceCall call, $6.UpdateStationRequest request);
  $async.Future<$6.GetStationListByBusIdResponse> getStationListByBusId($grpc.ServiceCall call, $6.GetStationListByBusIdRequest request);
}
