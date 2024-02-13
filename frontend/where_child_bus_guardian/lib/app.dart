import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/pages/check_page/check_page.dart';
import 'package:where_child_bus_guardian/pages/daily_page/daily_page.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['日々の記録', '地図', '乗車確認'][_selectedIndex]),
      ),
      body: [
        const DailyPage(),
        const MapPage(),
        const CheckPage()
      ][_selectedIndex],
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
