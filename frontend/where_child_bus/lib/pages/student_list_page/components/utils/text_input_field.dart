import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextInputType type;

  const TextInputField({required this.hintText, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 40,
        child: TextField(
          decoration: formInputDecoration(hintText),
          keyboardType: type,
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
