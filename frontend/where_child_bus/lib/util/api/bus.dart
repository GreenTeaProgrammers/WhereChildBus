import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus_api/proto-gen/google/protobuf/field_mask.pb.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/bus_route.pb.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/bus_route.pbgrpc.dart";
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
  return await performGrpcCall((client) async {
    var req = CreateBusRequest(
      nurseryId: nurseryId,
      name: name,
      plateNumber: plateNumber,
    );
    return client.createBus(req);
  });
}

Future<ChangeBusStatusResponse> updateBusStatus(
    String busId, BusStatus busStatus) async {
  DateTime now = DateTime.now();
  BusType busType;
  if (now.hour < 12) {
    busType = BusType.BUS_TYPE_MORNING;
  } else {
    busType = BusType.BUS_TYPE_EVENING;
  }
  return performGrpcCall((client) async {
    var req = ChangeBusStatusRequest(
      busId: busId,
      busStatus: busStatus,
      busType: busType,
    );
    developer.log("Request: $req");
    return client.changeBusStatus(req);
  });
}

Future<UpdateBusResponse> updateNextStation(
  String busId,
  String nextStationId,
) async {
  FieldMask updateMask = FieldMask()..paths.add("next_station_id");
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );
  final grpcClient = BusServiceClient(channel);

  try {
    var req = UpdateBusRequest(
      busId: busId,
      nextStationId: nextStationId,
      updateMask: updateMask,
    );
    var res = await grpcClient.updateBus(req);
    developer.log("Request: $req");
    developer.log("Response: $res");
    return res;
  } catch (error) {
    developer.log("Caught Error:", error: error, name: "updateNextStation");
    return Future.error(error);
  } finally {
    await channel.shutdown();
  }
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
