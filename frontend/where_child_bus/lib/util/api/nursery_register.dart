import "dart:async";
import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:where_child_bus/config/config.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/nursery.pbgrpc.dart";

Future<CreateNurseryResponse> createNursery(
    String email, String password, String phoneNumber, String address) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );

  final grpcClient = NurseryServiceClient(channel);

  try {
    var req = CreateNurseryRequest(
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      address: address,
    );

    if (kDebugMode) {
      developer.log("リクエスト: $req");
    }

    var res = await grpcClient.createNursery(req);
    return res;
  } catch (err) {
    developer.log("Caught error", error: err);
    await channel.shutdown();
    return Future.error(err);
  }
}
