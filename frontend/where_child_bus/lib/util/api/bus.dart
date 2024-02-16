import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart";

Future<GetBusListByNurseryIdResponse> getBusListByNurseryId(
    String nurseryId) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );

  final grpcClient = BusServiceClient(channel);

  try {
    var req = GetBusListByNurseryIdRequest(nurseryId: nurseryId);

    if (kDebugMode) {
      developer.log("リクエスト: $req");
    }

    var res = await grpcClient.getBusListByNurseryId(req);
    if (kDebugMode) {
      developer.log("レスポンス: $res");
    }

    return res;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}
