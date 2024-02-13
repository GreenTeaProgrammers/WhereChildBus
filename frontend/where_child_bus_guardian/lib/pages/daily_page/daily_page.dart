import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/components/utils/current_time_body.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CurrentTimeBody(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
