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

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  late GuardianResponse guardian;
  late bool _hasRunningBus;

  @override
  void initState() {
    super.initState();
    _hasRunningBus = true;
    guardian = GuardianData().getGuardian();
    _loadRunningBus();
  }

  Future<void> _loadRunningBus() async {
    try {
      var busRes = await getRunningBusByGuardianIdService(guardian.id);
    } catch (e) {
      _hasRunningBus = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['日々の記録', '地図', '乗車確認'][_selectedIndex]),
      ),
      body: IndexedStack(index: _selectedIndex, children: [
        DailyPage(),
        _hasRunningBus ? MapPage() : StopBusPage(),
        CheckPage()
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() => _selectedIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: '日々の記録',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert),
            label: '地図',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: '乗車確認',
          ),
        ],
      ),
    );
  }
}
