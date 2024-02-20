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
  static final _$getRunningBusByGuardianId = $grpc.ClientMethod<$0.GetRunningBusByGuardianIdRequest, $0.GetRunningBusByGuardianIdResponse>(
      '/where_child_bus.v1.BusService/GetRunningBusByGuardianId',
      ($0.GetRunningBusByGuardianIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRunningBusByGuardianIdResponse.fromBuffer(value));
  static final _$updateBus = $grpc.ClientMethod<$0.UpdateBusRequest, $0.UpdateBusResponse>(
      '/where_child_bus.v1.BusService/UpdateBus',
      ($0.UpdateBusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateBusResponse.fromBuffer(value));
  static final _$sendLocationContinuous = $grpc.ClientMethod<$0.SendLocationContinuousRequest, $0.SendLocationContinuousResponse>(
      '/where_child_bus.v1.BusService/SendLocationContinuous',
      ($0.SendLocationContinuousRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendLocationContinuousResponse.fromBuffer(value));
  static final _$trackBusContinuous = $grpc.ClientMethod<$0.TrackBusContinuousRequest, $0.TrackBusContinuousResponse>(
      '/where_child_bus.v1.BusService/TrackBusContinuous',
      ($0.TrackBusContinuousRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TrackBusContinuousResponse.fromBuffer(value));
  static final _$streamBusVideo = $grpc.ClientMethod<$0.StreamBusVideoRequest, $0.StreamBusVideoResponse>(
      '/where_child_bus.v1.BusService/StreamBusVideo',
      ($0.StreamBusVideoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamBusVideoResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.GetRunningBusByGuardianIdResponse> getRunningBusByGuardianId($0.GetRunningBusByGuardianIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRunningBusByGuardianId, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateBusResponse> updateBus($0.UpdateBusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateBus, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendLocationContinuousResponse> sendLocationContinuous($async.Stream<$0.SendLocationContinuousRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sendLocationContinuous, request, options: options).single;
  }

  $grpc.ResponseStream<$0.TrackBusContinuousResponse> trackBusContinuous($0.TrackBusContinuousRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$trackBusContinuous, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.StreamBusVideoResponse> streamBusVideo($async.Stream<$0.StreamBusVideoRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamBusVideo, request, options: options).single;
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
    $addMethod($grpc.ServiceMethod<$0.GetRunningBusByGuardianIdRequest, $0.GetRunningBusByGuardianIdResponse>(
        'GetRunningBusByGuardianId',
        getRunningBusByGuardianId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRunningBusByGuardianIdRequest.fromBuffer(value),
        ($0.GetRunningBusByGuardianIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateBusRequest, $0.UpdateBusResponse>(
        'UpdateBus',
        updateBus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateBusRequest.fromBuffer(value),
        ($0.UpdateBusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendLocationContinuousRequest, $0.SendLocationContinuousResponse>(
        'SendLocationContinuous',
        sendLocationContinuous,
        true,
        false,
        ($core.List<$core.int> value) => $0.SendLocationContinuousRequest.fromBuffer(value),
        ($0.SendLocationContinuousResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TrackBusContinuousRequest, $0.TrackBusContinuousResponse>(
        'TrackBusContinuous',
        trackBusContinuous_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.TrackBusContinuousRequest.fromBuffer(value),
        ($0.TrackBusContinuousResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamBusVideoRequest, $0.StreamBusVideoResponse>(
        'StreamBusVideo',
        streamBusVideo,
        true,
        false,
        ($core.List<$core.int> value) => $0.StreamBusVideoRequest.fromBuffer(value),
        ($0.StreamBusVideoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateBusResponse> createBus_Pre($grpc.ServiceCall call, $async.Future<$0.CreateBusRequest> request) async {
    return createBus(call, await request);
  }

  $async.Future<$0.GetBusListByNurseryIdResponse> getBusListByNurseryId_Pre($grpc.ServiceCall call, $async.Future<$0.GetBusListByNurseryIdRequest> request) async {
    return getBusListByNurseryId(call, await request);
  }

  $async.Future<$0.GetRunningBusByGuardianIdResponse> getRunningBusByGuardianId_Pre($grpc.ServiceCall call, $async.Future<$0.GetRunningBusByGuardianIdRequest> request) async {
    return getRunningBusByGuardianId(call, await request);
  }

  $async.Future<$0.UpdateBusResponse> updateBus_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateBusRequest> request) async {
    return updateBus(call, await request);
  }

  $async.Stream<$0.TrackBusContinuousResponse> trackBusContinuous_Pre($grpc.ServiceCall call, $async.Future<$0.TrackBusContinuousRequest> request) async* {
    yield* trackBusContinuous(call, await request);
  }

  $async.Future<$0.CreateBusResponse> createBus($grpc.ServiceCall call, $0.CreateBusRequest request);
  $async.Future<$0.GetBusListByNurseryIdResponse> getBusListByNurseryId($grpc.ServiceCall call, $0.GetBusListByNurseryIdRequest request);
  $async.Future<$0.GetRunningBusByGuardianIdResponse> getRunningBusByGuardianId($grpc.ServiceCall call, $0.GetRunningBusByGuardianIdRequest request);
  $async.Future<$0.UpdateBusResponse> updateBus($grpc.ServiceCall call, $0.UpdateBusRequest request);
  $async.Future<$0.SendLocationContinuousResponse> sendLocationContinuous($grpc.ServiceCall call, $async.Stream<$0.SendLocationContinuousRequest> request);
  $async.Stream<$0.TrackBusContinuousResponse> trackBusContinuous($grpc.ServiceCall call, $0.TrackBusContinuousRequest request);
  $async.Future<$0.StreamBusVideoResponse> streamBusVideo($grpc.ServiceCall call, $async.Stream<$0.StreamBusVideoRequest> request);
}
