import 'package:flutter/material.dart';

class InputValueLabel extends StatelessWidget {
  final String label;

  const InputValueLabel({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 4),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ));
  }
}
