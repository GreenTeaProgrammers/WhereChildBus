import 'dart:async';
import 'dart:developer' as developer; // エラーログに使用
import 'package:grpc/grpc.dart';
import 'package:where_child_bus/generated/where_child_bus/health_check.pbgrpc.dart';


Future<void> createHoge(String dartSideParam1, int dartSideParam2, bool dartSideParam3) async {
  final channel = ClientChannel(
    'localhost',
    port: 8000,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final grpcClient = HealthcheckServiceClient(channel, options: CallOptions(timeout: const Duration(seconds: 10)));

  try {
    await grpcClient.ping(PingRequest()..name = "HOOOGEEE");
    await channel.shutdown();
  } catch (error) {
    developer.log('Caught error: $error');
    await channel.shutdown();
    return Future.error(error);
  }
}
