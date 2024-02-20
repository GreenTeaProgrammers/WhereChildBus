import 'package:flutter/material.dart';

class PositionDecideButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isLoading;

  const PositionDecideButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          child: isLoading ? const CircularProgressIndicator() : Text(text),
        ),
      ),
    );
  }
}
