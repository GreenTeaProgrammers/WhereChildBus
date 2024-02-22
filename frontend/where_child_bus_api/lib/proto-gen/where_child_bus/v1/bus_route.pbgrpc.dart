//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/bus_route.proto
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

import 'bus_route.pb.dart' as $1;

export 'bus_route.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.BusRouteService')
class BusRouteServiceClient extends $grpc.Client {
  static final _$createBusRoute = $grpc.ClientMethod<$1.CreateBusRouteRequest, $1.CreateBusRouteResponse>(
      '/where_child_bus.v1.BusRouteService/CreateBusRoute',
      ($1.CreateBusRouteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CreateBusRouteResponse.fromBuffer(value));
  static final _$getBusRouteByBusID = $grpc.ClientMethod<$1.GetBusRouteByBusIDRequest, $1.GetBusRouteByBusIDResponse>(
      '/where_child_bus.v1.BusRouteService/GetBusRouteByBusID',
      ($1.GetBusRouteByBusIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetBusRouteByBusIDResponse.fromBuffer(value));

  BusRouteServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.CreateBusRouteResponse> createBusRoute($1.CreateBusRouteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBusRoute, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetBusRouteByBusIDResponse> getBusRouteByBusID($1.GetBusRouteByBusIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBusRouteByBusID, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.BusRouteService')
abstract class BusRouteServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.BusRouteService';

  BusRouteServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateBusRouteRequest, $1.CreateBusRouteResponse>(
        'CreateBusRoute',
        createBusRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateBusRouteRequest.fromBuffer(value),
        ($1.CreateBusRouteResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetBusRouteByBusIDRequest, $1.GetBusRouteByBusIDResponse>(
        'GetBusRouteByBusID',
        getBusRouteByBusID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetBusRouteByBusIDRequest.fromBuffer(value),
        ($1.GetBusRouteByBusIDResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateBusRouteResponse> createBusRoute_Pre($grpc.ServiceCall call, $async.Future<$1.CreateBusRouteRequest> request) async {
    return createBusRoute(call, await request);
  }

  $async.Future<$1.GetBusRouteByBusIDResponse> getBusRouteByBusID_Pre($grpc.ServiceCall call, $async.Future<$1.GetBusRouteByBusIDRequest> request) async {
    return getBusRouteByBusID(call, await request);
  }

  $async.Future<$1.CreateBusRouteResponse> createBusRoute($grpc.ServiceCall call, $1.CreateBusRouteRequest request);
  $async.Future<$1.GetBusRouteByBusIDResponse> getBusRouteByBusID($grpc.ServiceCall call, $1.GetBusRouteByBusIDRequest request);
}
