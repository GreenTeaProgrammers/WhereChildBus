import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart";

Future<T> performGrpcCall<T>(
    Future<T> Function(BusServiceClient) grpcCall) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );
  final grpcClient = BusServiceClient(channel);

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

Future<GetBusListByNurseryIdResponse> getBusListByNurseryId(
    String nurseryId) async {
  return performGrpcCall((client) async {
    var req = GetBusListByNurseryIdRequest(nurseryId: nurseryId);
    return client.getBusListByNurseryId(req);
  });
}

Future<CreateBusResponse> createBus(
    String nurseryId,
    String name,
    String plateNumber,
    Iterable<String> morningGuardianIds,
    Iterable<String> eveningGuardianIds) async {
  return performGrpcCall((client) async {
    var req = CreateBusRequest(
      nurseryId: nurseryId,
      name: name,
      plateNumber: plateNumber,
      morningGuardianIds: morningGuardianIds.toList(),
      eveningGuardianIds: eveningGuardianIds.toList(),
    );
    return client.createBus(req);
  });
}
