import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/components/utils/current_time_body.dart';
import 'package:where_child_bus_guardian/pages/daily_page/components/daily_record_slider.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  //TODO: 将来的にChild型を受け取る
  final List<String> childNames = ["園児1", "園児2", "園児3"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CurrentTimeBody(),
          const SizedBox(
            height: 20,
          ),
          DailyRecordSlider(childNames: childNames),
        ],
      ),
    );
  }
}
