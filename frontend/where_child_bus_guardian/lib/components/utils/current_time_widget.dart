import 'dart:async';
import 'package:flutter/material.dart';

class CurrentTimeWidget extends StatefulWidget {
  @override
  State<CurrentTimeWidget> createState() => _CurrentTimeWidgetState();
}

class _CurrentTimeWidgetState extends State<CurrentTimeWidget> {
  Timer? _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      final now = DateTime.now();
      _currentTime =
          '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime,
      style: const TextStyle(fontSize: 50),
    );
  }
}
