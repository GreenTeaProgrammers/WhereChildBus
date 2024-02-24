import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_guardian/pages/check_page/check_page.dart';
import 'package:where_child_bus_guardian/pages/daily_page/daily_page.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';
import 'package:where_child_bus_guardian/pages/stop_bus_page/stop_bus_page.dart';
import 'package:where_child_bus_guardian/service/get_running_bus_by_guardian_id.dart';
import 'package:where_child_bus_guardian/util/guardian_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
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
  GuardianResponse guardian = GuardianResponse();
  bool _hasRunningBus = false;

  @override
  void initState() {
    super.initState();
    _initializeAppState();
  }

  Future<void> _initializeAppState() async {
    guardian = GuardianData().getGuardian();
    await _loadRunningBus();
  }

  Future<void> _loadRunningBus() async {
    try {
      var busRes = await getRunningBusByGuardianIdService(guardian.id);
      if (mounted) {
        setState(() {
          _hasRunningBus = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasRunningBus = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        selectedIndex: _selectedIndex,
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: IndexedStack(index: _selectedIndex, children: [
            DailyPage(),
            _hasRunningBus
                ? MapPage()
                : StopBusPage(
                    onPressed: _loadRunningBus,
                  ),
            CheckPage(),
          ])),
      bottomNavigationBar: CustomWaveBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
