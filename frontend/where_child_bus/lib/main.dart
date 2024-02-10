import 'package:flutter/material.dart';
import 'package:where_child_bus/app.dart';

void main() {
  runApp(const App());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
