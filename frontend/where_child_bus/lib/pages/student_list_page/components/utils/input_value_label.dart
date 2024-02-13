import 'package:flutter/material.dart';

class InputValueLabel extends StatelessWidget {
  final String label;

  const InputValueLabel({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ));
  }
}
