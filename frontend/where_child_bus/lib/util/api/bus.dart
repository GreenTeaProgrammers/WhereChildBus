import "dart:developer" as developer;
import "package:camera/camera.dart";
import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus/util/nursery_data.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

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

Future<void> streamBusVideo(Stream<StreamBusVideoRequest> requestStream) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
    options: const ChannelOptions(),
  );
  final grpcClient = BusServiceClient(channel);
  developer.log("ServiceClient created");
  final res = grpcClient.streamBusVideo(requestStream);

  try {
    developer.log("Streamed video to server");
    await for (var response in res.asStream()) {
      developer.log("Received response: $response");
    }
  } catch (error) {
    developer.log("Caught Error:", error: error.toString());
  } finally {
    await channel.shutdown();
  }
}
