import 'dart:async';
import 'dart:developer' as developer; // エラーログに使用
import 'package:grpc/grpc_web.dart';
import 'package:where_child_bus/proto-gen/where_child_bus/v1/health_check.pbgrpc.dart';

Future<PingResponse> createHoge() async {
  // final channel = ClientChannel(
  //   'where-child-bus-grpc-k3dkun2lpq-uw.a.run.app',
  //   port: 443,
  // );

  final channel = GrpcWebClientChannel.xhr(Uri.parse('http://where-child-bus-grpc-k3dkun2lpq-uw.a.run.app:443'));

  final grpcClient = HealthcheckServiceClient(channel,
      options: CallOptions(timeout: const Duration(seconds: 60)));

  try {
    var rqst = PingRequest();
    rqst.name = "ping";
    PingResponse res = await grpcClient.ping(rqst);
    await channel.shutdown();
    return Future<PingResponse>.value(res);
  } catch (error) {
    developer.log('Caught error: $error');
    await channel.shutdown();
    return Future.error(error);
  }
}