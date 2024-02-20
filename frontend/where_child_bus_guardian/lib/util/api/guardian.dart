import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import 'package:grpc/grpc.dart';
import 'package:where_child_bus_api/proto-gen/google/protobuf/field_mask.pb.dart';
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart";
import "package:where_child_bus_guardian/config/config.dart";

Future<GuardianLoginResponse> guardianLogin(
    String email, String password) async {
  var channel = ClientChannel(appConfig.grpcEndpoint, port: appConfig.grpcPort);

  var grpcClient = GuardianServiceClient(channel);

  try {
    var req = GuardianLoginRequest(email: email, password: password);

    //デバッグ時のみリクエストを表示
    if (kDebugMode) {
      developer.log("リクエスト: $req");
    }

    var res = await grpcClient.guardianLogin(req);
    if (kDebugMode) {
      developer.log("レスポンス $res");
    }

    await channel.shutdown();
    return res;
  } catch (error) {
    developer.log("Caught Error", error: error);
    await channel.shutdown();
    return Future.error(error);
  }
}

Future<T> performGrpcCall<T>(
    Future<T> Function(GuardianServiceClient) grpcCall) async {
  final channel =
      ClientChannel(appConfig.grpcEndpoint, port: appConfig.grpcPort);
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

Future<UpdateGuardianResponse> updateGuardianStatus(String? guardianId,
    bool? isUseMorningBus, bool? isUseEveningBus, FieldMask? updateMask) async {
  return performGrpcCall((client) async {
    var req = UpdateGuardianRequest(
      guardianId: guardianId,
      isUseMorningBus: isUseMorningBus,
      isUseEveningBus: isUseEveningBus,
      updateMask: updateMask,
    );
    return client.updateGuardian(req);
  });
}
