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

    try {

      grpcEndpoint = dotenv.get("GRPC_ENDPOINT");
      grpcPort = int.tryParse(dotenv.get("GRPC_PORT")) ?? 0;
    } catch(e) {
      print("設定の読み込みにエラーが発生しました");
    }
  }
}

final appConfig = AppConfig();