import "dart:developer" as developer;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:where_child_bus_guardian/config/config.dart';
import 'package:where_child_bus_guardian/util/api/health_check.dart';
import 'package:where_child_bus_guardian/pages/auth_page/auth_page.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
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
  // Widget googleMap = const GoogleMapView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hoicruise guardian',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            background: const Color.fromARGB(255, 245, 255, 247),
            seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.hachiMaruPopTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
