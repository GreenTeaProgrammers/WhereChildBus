import 'package:flutter/material.dart';

class StopBusPage extends StatefulWidget {
  const StopBusPage({super.key});

  @override
  State<StopBusPage> createState() => _StopBusPageState();
}

class _StopBusPageState extends State<StopBusPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '現在走行中のバスはありません',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
