import 'package:flutter/material.dart';

class NumberIcon extends StatelessWidget {
  final int number; // 表示する数字
  final Color color; // テキストの色
  final double size; // テキストのサイズ

  const NumberIcon({
    Key? key,
    required this.number,
    this.color = Colors.blue, // デフォルトの色
    this.size = 24.0, // デフォルトのサイズ
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 円形にするためにサイズを計算
    double circleDiameter = size + 16; // sizeに基づいて適切な直径を計算

    return Container(
      width: circleDiameter, // 幅と高さを同じにして正方形に
      height: circleDiameter,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2), // 背景色
        borderRadius: BorderRadius.circular(circleDiameter / 2), // 角を完全に丸くして円形に
      ),
      child: Center( // Textウィジェットを中央に配置
        child: Text(
          '$number',
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
