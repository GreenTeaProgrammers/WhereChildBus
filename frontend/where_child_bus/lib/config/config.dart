import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  late String grpcEndpoint;
  late int grpcPort;

  Future<void> loadConfig() async {
    await dotenv.load();
    grpcEndpoint = dotenv.get("GRPC_ENDPOINT");
    grpcPort = int.tryParse(dotenv.get("GRPC_PORT")) ?? 0;
  }
}

final appConfig = AppConfig();