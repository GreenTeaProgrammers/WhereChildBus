import 'package:flutter/material.dart';

class LoadFailText extends StatelessWidget {
  const LoadFailText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "バスのロードに失敗しました",
      style: TextStyle(color: Colors.red, fontSize: 16),
    );
  }
}
