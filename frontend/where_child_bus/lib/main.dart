import 'package:flutter/material.dart';
import 'package:where_child_bus/app.dart';
import 'package:where_child_bus/util/api/health_check.dart';
import 'package:where_child_bus/config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await appConfig.loadConfig();
    await serviceHealthCheck();
  } catch (e) {
    print("Failed to initialize the app");
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
      title: 'WhereChildBus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBarの背景色を白に設定
        ),
      ),
      home: const App(),
    );
  }
}
