import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import 'package:grpc/grpc.dart';
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
