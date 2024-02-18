import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart";

Future<T> performGrpcCall<T>(
    Future<T> Function(GuardianServiceClient) grpcCall) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );
  final grpcClient = GuardianServiceClient(channel);

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

Future<GetGuardianListByBusIdResponse> getGuardiansListByBusId(
    String busId) async {
  return performGrpcCall((client) async {
    var req = GetGuardianListByBusIdRequest(busId: busId);
    return client.getGuardianListByBusId(req);
  });
}

Future<GetGuardianByChildIdResponse> getGuardiansListByChildId(
    String childId) async {
  return performGrpcCall((client) async {
    var req = GetGuardianByChildIdRequest(childId: childId);
    return client.getGuardianByChildId(req);
  });
}

// Future<> getGuardiansListByNurseryId(String nurseryId) async {
//   return performGrpcCall((client) async{
//     var req = getGuardiansListByNurseryId(nurseryId);
//     return client.
//   });
// }
