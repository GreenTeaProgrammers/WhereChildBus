import 'package:flutter/material.dart';

class NumberIcon extends StatelessWidget {
  final int number; // 表示する数字
  final IconData icon; // 使用するアイコン
  final Color color; // アイコンの色
  final double size; // アイコンのサイズ

  const NumberIcon({
    Key? key,
    required this.number,
    this.icon = Icons.circle, // デフォルトのアイコン
    this.color = Colors.blue, // デフォルトの色
    this.size = 24.0, // デフォルトのサイズ
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: size,
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
