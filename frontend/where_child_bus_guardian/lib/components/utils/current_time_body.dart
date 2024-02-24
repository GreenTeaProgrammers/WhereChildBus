import 'package:flutter/material.dart';
import 'current_time_widget.dart';

class CurrentTimeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "現在時刻",
              style: TextStyle(fontSize: 20),
            ),
            CurrentTimeWidget(),
          ],
        ));
  }
}
