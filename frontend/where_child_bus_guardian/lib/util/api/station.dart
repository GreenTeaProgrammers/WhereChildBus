import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:where_child_bus_guardian/config/config.dart';
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/station.pbgrpc.dart";

Future<T> performGrpcCall<T>(
    Future<T> Function(StationServiceClient) grpcCall) async {
  final channel =
      ClientChannel(appConfig.grpcEndpoint, port: appConfig.grpcPort);
  final grpcClient = StationServiceClient(channel);

  try {
    final result = await grpcCall(grpcClient);
    if (kDebugMode) {
      developer.log("レスポンス: $result");
    }
    return result;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  } finally {
    await channel.shutdown();
  }
}

Future<GetStationListByBusIdResponse> getStationListByBusId(
    String busId, String busType) async {
  return performGrpcCall((client) async {
    var req = GetStationListByBusIdRequest(busId: busId, busType: busType);
    return client.getStationListByBusId(req);
  });
}
