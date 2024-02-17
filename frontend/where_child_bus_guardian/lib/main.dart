import "dart:developer" as developer;
import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/config/config.dart';
import 'package:where_child_bus_guardian/util/api/health_check.dart';
import 'package:where_child_bus_guardian/pages/auth_page/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await appConfig.loadConfig();
    await serviceHealthCheck();
  } catch (error) {
    developer.log("アプリの立ち上げに失敗しました", error: error);
  }

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
      title: 'WhereChildBus Guardian',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
