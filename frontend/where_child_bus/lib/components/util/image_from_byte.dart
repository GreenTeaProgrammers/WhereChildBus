import 'package:flutter/material.dart';
import 'dart:typed_data'; // Uint8Listを使用するために必要

class ImageFromBytes extends StatelessWidget {
  final List<int> imageData;
  final int height;
  final int width;

  const ImageFromBytes(
      {Key? key,
      required this.imageData,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int配列をUint8Listに変換
    final Uint8List bytes = Uint8List.fromList(imageData);
    return SizedBox(
        height: height.toDouble(),
        width: width.toDouble(),
        child: Image.memory(bytes));
  }
}
