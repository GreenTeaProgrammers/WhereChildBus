import 'package:flutter/foundation.dart';
import 'dart:developer' as developer; // エラーログに使用
import 'package:grpc/grpc.dart';
import 'package:where_child_bus/config/config.dart';
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
    GetBusListByNurseryIdResponse res =
        await grpcClient.getBusListByNurseryId(req);
    if (kDebugMode) {
      debugPrint("リクエスト $req");
    }
    await channel.shutdown();
    return res;
  } catch (err) {
    developer.log("Caught error: $err");
    await channel.shutdown();
    return Future.error(err);
  }
}
