import 'package:flutter/material.dart';

BoxDecoration statusFieldDecoration(bool isTrue) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(
      color: isTrue ? Colors.green : Colors.red,
    ),
    color: isTrue ? Colors.green[100] : Colors.red[100],
  );
}

TextStyle statusFieldTextStyle(bool isTrue) {
  return TextStyle(
    fontSize: 16,
    color: isTrue ? Colors.green[900] : Colors.red[900],
  );
}
