import "dart:developer" as developer;

import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus_api/proto-gen/google/protobuf/field_mask.pb.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pbgrpc.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

Future<T> performGrpcCall<T>(
    Future<T> Function(ChildServiceClient) grpcCall) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );
  final grpcClient = ChildServiceClient(channel);
  final Stopwatch stopwatch = Stopwatch()..start();

  try {
    final result = await grpcCall(grpcClient);
    stopwatch.stop();

    if (kDebugMode) {
      developer.log("レスポンスが返ってきました: ${stopwatch.elapsedMilliseconds}ms");
    }
    return result;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  } finally {
    await channel.shutdown();
  }
}

Future<GetChildListByNurseryIDResponse> getChildListByNurseryId(
    String nurseryId) async {
  return performGrpcCall((client) async {
    var req = GetChildListByNurseryIDRequest(nurseryId: nurseryId);
    return client.getChildListByNurseryID(req);
  });
}

Future<CreateChildResponse> createChild(String nurseryId, String guardianId,
    String name, int age, Sex sex, Iterable<List<int>> photos) async {
  return performGrpcCall((client) async {
    var req = CreateChildRequest(
        nurseryId: nurseryId,
        guardianId: guardianId,
        name: name,
        age: age,
        sex: sex,
        photos: photos);
    return client.createChild(req);
  });
}

Future<UpdateChildResponse> updateChild(
  String id,
  String nurseryId,
  String guardianId,
  String name,
  int age,
  Sex sex,
  FieldMask updateMask,
) async {
  return performGrpcCall((client) async {
    var req = UpdateChildRequest(
      childId: id,
      name: name,
      age: age,
      sex: sex,
      updateMask: updateMask,
    );
    return client.updateChild(req);
  });
}

Future<GetChildListByBusIDResponse> getChildListByBusId(String busId) async {
  return performGrpcCall((client) async {
    var req = GetChildListByBusIDRequest(busId: busId);
    return client.getChildListByBusID(req);
  });
}
