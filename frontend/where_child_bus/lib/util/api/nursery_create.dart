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
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
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
    if (kDebugMode) {
      developer.log("レスポンス: $res");
    }
    return res;
  } catch (e) {
    if (e is GrpcError) {
      // 特定のGrpcErrorに対してカスタマイズされた処理を行う
      developer.log("gRPCエラー: ${e.message}", error: e);
      switch (e.code) {
        case StatusCode.unavailable:
          return Future.error('サーバーが利用不可です。');
        case StatusCode.alreadyExists:
          return Future.error('メールアドレスは既に登録されています。');
        default:
          return Future.error('登録中にエラーが発生しました。');
      }
    } else {
      // 予期せぬエラー
      developer.log("予期せぬエラー", error: e);
      return Future.error('不明なエラーが発生しました。');
    }
  } finally {
    await channel.shutdown();
  }
}
