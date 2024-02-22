import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:where_child_bus/config/config.dart';
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/nursery.pbgrpc.dart";

Future<NurseryLoginResponse> nurseryLogin(String email, String password) async {
  var channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );
  var client = NurseryServiceClient(channel);
  try {
    var req = NurseryLoginRequest(email: email, password: password);

    if (kDebugMode) {
      print("リクエスト: $req");
    }

    var res = await client.nurseryLogin(req);
    if (kDebugMode) {
      debugPrint(res.toString());
    }
    return res;
  } catch (err) {
    developer.log("Caught error", error: err);
    await channel.shutdown();
    return Future.error(err);
  }
}
