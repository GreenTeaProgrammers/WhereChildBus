import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_guardian/pages/check_page/check_page.dart';
import 'package:where_child_bus_guardian/pages/daily_page/daily_page.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';
import 'package:where_child_bus_guardian/components/utils/half_circle_painter.dart';
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
      appBar: appbar(),
      body: Padding(
          padding: EdgeInsets.only(top: 30), // AppBarのカスタム形状の高さに応じて調整
          child: IndexedStack(
              index: _selectedIndex,
              children: [DailyPage(), const MapPage(), CheckPage()])),
      bottomNavigationBar: CustomWaveBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 243, 190),
      title: Text(''), // AppBarのデフォルトのタイトルは空に
      centerTitle: true, // タイトルを中央揃えにする設定は保持
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10), // 半円を含めた高さ
        child: CustomPaint(
          painter: HalfCirclePainter(),
          child: Container(
            height: 10,
          ),
        ),
      ),
      flexibleSpace: layoutBuilder(),
    );
  }

  LayoutBuilder layoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double appBarHeight = constraints.biggest.height;
        return Center(
          child: Container(
            child: Text(
              ['日々の記録', '地図', '乗車確認'][_selectedIndex],
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 67, 55, 1)),
            ),
            // AppBarの高さに応じて位置を調整
            padding: EdgeInsets.only(top: appBarHeight / 2, bottom: 20),
          ),
        );
      },
    );
  }
}
