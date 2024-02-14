import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:where_child_bus_guardian/components/utils/current_time_body.dart';
import 'package:where_child_bus_guardian/pages/daily_page/components/daily_record_body.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  //TODO: 将来的にChild型を受け取る
  final List<String> childNames = ["園児1", "園児2"];

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
          childDailyRecordSlider(context)
        ],
      ),
    );
  }

  Widget childDailyRecordSlider(BuildContext context) {
    List<Widget> recordList = childNames.map((name) {
      return DailyRecordBody(childName: name);
    }).toList();
    return CarouselSlider(
      items: recordList,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.6,
        initialPage: 0,
        autoPlay: false,
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
    );
  }
}
