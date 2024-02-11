import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  late String grpcEndpoint;
  String get grpcEndpointUrl => grpcEndpoint;
  Future<void> loadConfig() async {
    await dotenv.dotenv.load();

    grpcEndpoint = dotenv.dotenv.env['GRPC_ENDPOINT'] ?? 'http://localhost:443';
  }
}

final appConfig = AppConfig();