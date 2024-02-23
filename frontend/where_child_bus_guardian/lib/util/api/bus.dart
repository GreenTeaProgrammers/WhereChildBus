import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:where_child_bus_guardian/config/config.dart';
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart";

Future<T> performGrpcCall<T>(
    Future<T> Function(BusServiceClient) grpcCall) async {
  final channel =
      ClientChannel(appConfig.grpcEndpoint, port: appConfig.grpcPort);
  final grpcClient = BusServiceClient(channel);

  try {
    final result = await grpcCall(grpcClient);
    if (kDebugMode) {
      developer.log("レスポンス: $result");
    }
    return result;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return T as Future<T>;
  } finally {
    await channel.shutdown();
  }
}

Future<GetRunningBusByGuardianIdResponse> getRunningBusByGuardianId(
    String guardianId) async {
  return performGrpcCall((client) async {
    var req = GetRunningBusByGuardianIdRequest(guardianId: guardianId);
    return client.getRunningBusByGuardianId(req);
  });
}

Stream<TrackBusContinuousResponse> trackBusContinuous(
    TrackBusContinuousRequest request) async* {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
    options: const ChannelOptions(),
  );

  final grpcClient = BusServiceClient(channel);
  developer.log("ServiceClient created");
  final res = grpcClient.trackBusContinuous(request);

  try {
    await for (var response in res) {
      developer.log("Received response: $response");
      yield response;
    }
  } catch (error) {
    developer.log("Caught Error:", error: error);
  } finally {
    await channel.shutdown();
  }
}
