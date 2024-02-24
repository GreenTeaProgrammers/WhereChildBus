import 'package:flutter/material.dart';

class NoBusRegisteredText extends StatelessWidget {
  const NoBusRegisteredText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text("バスが登録されていません"),
    );
  }
}
