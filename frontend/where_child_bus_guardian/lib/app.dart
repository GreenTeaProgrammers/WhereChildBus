import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_guardian/pages/check_page/check_page.dart';
import 'package:where_child_bus_guardian/pages/daily_page/daily_page.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';
import 'package:where_child_bus_guardian/components/utils/half_circle_painter.dart';
import 'package:where_child_bus_guardian/components/utils/custom_app_bar.dart';
import 'package:where_child_bus_guardian/components/utils/custom_bottom_app_bar.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        selectedIndex: _selectedIndex,
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: IndexedStack(
              index: _selectedIndex,
              children: [DailyPage(), const MapPage(), CheckPage()])),
      bottomNavigationBar: CustomWaveBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
