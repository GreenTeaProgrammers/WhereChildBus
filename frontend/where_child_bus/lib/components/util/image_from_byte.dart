import 'package:flutter/material.dart';
import 'dart:typed_data'; // Uint8Listを使用するために必要

class ImageFromBytes extends StatelessWidget {
  final Uint8List imageData;

  const ImageFromBytes({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.memory(imageData);
  }
}
