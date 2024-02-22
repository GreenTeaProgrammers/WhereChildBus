import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // 上部の開始点
    path.lineTo(0, 0);

    // 最初の波の下向きのカーブ
    var firstDownControlPoint = Offset(size.width / 4, 40);
    var firstDownEndPoint = Offset(size.width / 2, 20);
    path.quadraticBezierTo(
      firstDownControlPoint.dx,
      firstDownControlPoint.dy,
      firstDownEndPoint.dx,
      firstDownEndPoint.dy,
    );

    // 二番目の波の上向きのカーブ
    var secondUpControlPoint = Offset(size.width * 3 / 4, 0);
    var secondUpEndPoint = Offset(size.width, 30);
    path.quadraticBezierTo(
      secondUpControlPoint.dx,
      secondUpControlPoint.dy,
      secondUpEndPoint.dx,
      secondUpEndPoint.dy,
    );

    // パスを閉じる
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
