import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 243, 190) // 凸の色
      ..style = PaintingStyle.fill; // 塗りつぶし

    final path = Path();

    // 曲線の開始点
    path.moveTo(0, 0);

    // 曲線の描画
    // ここでは、始点から終点に向かって中間の制御点を使って曲線を描く
    var controlPoint = Offset(size.width / 2, 50); // 制御点（曲線のピークを決定）
    var endPoint = Offset(size.width, 0); // 終点

    // 二次ベジェ曲線を描画
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // パスを閉じる（省略可能、塗りつぶしの場合は必要）
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
