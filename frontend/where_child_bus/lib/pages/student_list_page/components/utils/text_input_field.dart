import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextInputType type;
  final TextEditingController controller;

  const TextInputField(
      {required this.hintText,
      required this.type,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 40,
        child: TextField(
          decoration: formInputDecoration(hintText),
          keyboardType: type,
          controller: controller,
        ));
  }

  InputDecoration formInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 13),
      border: const OutlineInputBorder(),
    );
  }
}
