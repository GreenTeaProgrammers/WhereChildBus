import "dart:developer" as developer;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/config/config.dart';
import 'package:where_child_bus/pages/auth_page/auth_page.dart';
import 'package:where_child_bus/util/api/health_check.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await appConfig.loadConfig();
    await serviceHealthCheck();
  } catch (e) {
    developer.log("Failed to initialize the app", error: e, name: "main");
  }

  //カメラを取得
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhereChildBus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
