import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 243, 190) // 凸の色
      ..style = PaintingStyle.fill; // 塗りつぶし

    final Rect ovalRect = Rect.fromLTWH(0, -10, size.width, 40);
    // 楕円形状をパスに追加
    final path = Path()..addOval(ovalRect);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
