import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/app.dart';
import './components/utils/google_map_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget googleMap = const GoogleMapView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhereChildBus Guardian',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: App(googleMap: googleMap),
    );
  }
}
