import 'dart:async';
import 'dart:developer' as developer; // エラーログに使用
import 'package:grpc/grpc.dart';
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/health_check.pbgrpc.dart";
import 'package:where_child_bus_guardian/config/config.dart';

Future<PingResponse> serviceHealthCheck() async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );

  final grpcClient = HealthcheckServiceClient(channel,
      options: CallOptions(timeout: const Duration(seconds: 60)));

  try {
    var rqst = PingRequest();
    rqst.name = "ping";
    PingResponse res = await grpcClient.ping(rqst);
    print(res.message);
    await channel.shutdown();
    return res;
  } catch (error) {
    developer.log('Caught error: $error');
    return Future.error(error);
  } finally {
    await channel.shutdown();
  }
}
