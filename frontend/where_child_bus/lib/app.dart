import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_list_page.dart';
import 'package:where_child_bus/pages/notification_page/notification_page.dart';
import 'package:where_child_bus/pages/student_list_page/student_list_page.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class App extends StatefulWidget {
  App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['園児一覧', '送迎バスコース一覧', '連絡情報設定'][_selectedIndex]),
      ),
      body: [
        ChildListPage(),
        BusListPage(),
        const NotificationPage()
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() => _selectedIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '園児一覧',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: '送迎バスコース一覧',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '連絡情報設定',
          ),
        ],
      ),
    );
  }
}
