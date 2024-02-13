import 'package:flutter/material.dart';
import 'current_time_widget.dart';

class CurrentTimeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("現在時刻"),
        CurrentTimeWidget(),
      ],
    );
  }
}
