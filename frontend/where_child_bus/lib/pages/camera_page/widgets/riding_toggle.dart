import 'package:flutter/material.dart';

class RidingToggle extends StatefulWidget {
  final Function(bool) onToggled;

  const RidingToggle({required this.onToggled, super.key});

  @override
  _RidingToggleState createState() => _RidingToggleState();
}

class _RidingToggleState extends State<RidingToggle> {
  bool _isRide = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // "乗り"または"降り"のテキストを表示
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_isRide ? "乗り" : "降り"),
            ),
            // スイッチを表示
            Switch(
              value: _isRide,
              onChanged: (bool value) {
                setState(() {
                  _isRide = value;
                });
                widget.onToggled(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
