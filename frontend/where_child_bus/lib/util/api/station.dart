import "dart:developer" as developer;

import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/station.pbgrpc.dart";

Future<GetStationListByBusIdResponse> getStationListByBusId(
    String busId) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );

  final grpcClient = StationServiceClient(channel);

  try {
    var req = GetStationListByBusIdRequest(busId: busId);

    if (kDebugMode) {
      developer.log("リクエスト: $req");
    }

    var res = await grpcClient.getStationListByBusId(req);
    if (kDebugMode) {
      developer.log("レスポンス: $res");
    }

    await channel.shutdown();
    return res;
  } catch (error) {
    await channel.shutdown();
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}

Future<GetUnregisteredStationListResponse> getUnregisteredStations(
    String busId) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );

  final grpcClient = StationServiceClient(channel);

  try {
    var req = GetUnregisteredStationListRequest(busId: busId);
    var res = await grpcClient.getUnregisteredStationList(req);
    if (kDebugMode) {
      developer.log("リクエスト: $req");
      developer.log("レスポンス: ${res.stations}");
    }
    return res;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  } finally {
    await channel.shutdown();
  }
}

Future<void> updateStation(
  String stationId,
  String busId,
  double latitude,
  double longitude,
) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );

  final grpcClient = StationServiceClient(channel);

  try {
    var req = UpdateStationRequest(
        id: stationId, busId: bussId, latitude: latitude, longitude: longitude);
    var res = grpcClient.updateStation(req);
    if (kDebugMode) {
      developer.log("リクエスト: $req");
      developer.log("レスポンス: $res");
    }
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  } finally {
    await channel.shutdown();
  }
}
