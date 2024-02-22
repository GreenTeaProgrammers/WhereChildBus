import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/components/utils/wave_clipper.dart';

class CustomWaveBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomWaveBottomBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: WaveClipper(),
        child: Container(
            color: const Color.fromARGB(255, 147, 211, 241),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(3, (index) => _buildBarItem(index, context)),
              ),
            )));
  }

  Widget _buildBarItem(int index, BuildContext context) {
    final isSelected = index == selectedIndex;
    // 例: アイコンとラベルのリストを定義
    final icons = [Icons.note_alt, Icons.bus_alert, Icons.notifications_active];
    final labels = ['日々の記録', '地図', '乗車確認'];

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icons[index],
              color: isSelected
                  ? const Color.fromARGB(255, 28, 100, 160)
                  : Colors.white),
          Text(labels[index],
              style: TextStyle(
                  color: isSelected
                      ? const Color.fromARGB(255, 28, 100, 160)
                      : Colors.white)),
        ],
      ),
    );
  }
}
