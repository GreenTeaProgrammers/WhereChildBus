import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:where_child_bus_guardian/config/config.dart';
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pbgrpc.dart";

Future<T> performGrpcCall<T>(
    Future<T> Function(ChildServiceClient) grpcCall) async {
  final channel =
      ClientChannel(appConfig.grpcEndpoint, port: appConfig.grpcPort);
  final grpcClient = ChildServiceClient(channel);

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

Future<GetChildListByGuardianIDResponse> getChildListByGuardianId(
    String guardianId) async {
  return performGrpcCall((client) async {
    var req = GetChildListByGuardianIDRequest(guardianId: guardianId);
    return client.getChildListByGuardianID(req);
  });
}

Future<CheckIsChildInBusResponse> checkIsChildInBus(String childId) async {
  return performGrpcCall((client) async {
    var req = CheckIsChildInBusRequest(childId: childId);
    return client.checkIsChildInBus(req);
  });
}
