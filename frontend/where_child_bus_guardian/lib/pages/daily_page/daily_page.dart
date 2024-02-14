import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:where_child_bus_guardian/components/utils/current_time_body.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  //TODO: 将来的にChild型を受け取る
  final List<String> childNames = ["園児1", "園児2", "園児3"];

  var isBoarding = true;
  var hasBag = false;
  var hasLunchBox = true;
  var hasWaterBottle = true;
  var hasUmbrella = true;

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
      return childDailyRecordBody(context, name);
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

  Widget childDailyRecordBody(BuildContext context, String name) {
    return Column(
      children: <Widget>[
        childFaceAndExpression(),
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: childName(name)),
        statusIconAndStatusField(
            Icons.directions_bus, isBoardingStatusField(context)),
        statusIconAndStatusField(Icons.business_center, childItemList(context)),
      ],
    );
  }

  Widget childFaceAndExpression() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[childFaceImage(), childExpressionIcon()],
    );
  }

  //TODO: 将来的に画像を受け取る
  Widget childFaceImage() {
    return const SizedBox(
      width: 150,
      height: 150,
      child: Card(
        color: Colors.grey,
        child: Text("ここに子供の写真が入る"),
      ),
    );
  }

  //TODO: 将来的に表情を受け取り、アイコンを表示する
  Widget childExpressionIcon() {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.grey,
        child: Text("ここに表情のアイコンが入る"),
      ),
    );
  }

  Widget childName(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
    );
  }

  Widget statusIconAndStatusField(IconData icon, Widget statusField) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              size: 80,
            ),
            statusField,
          ],
        ));
  }

  Widget isBoardingStatusField(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: statusFieldDecoration(!isBoarding),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            isBoarding ? "乗車中" : "降車済",
            style: statusFieldTextStyle(!isBoarding),
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget childItemList(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        runSpacing: 4.0,
        children: [
          itemText("かばん", hasBag),
          itemText("お弁当", hasLunchBox),
          itemText("水筒", hasWaterBottle),
          itemText("傘", hasUmbrella),
        ],
      ),
    );
  }

  Widget itemText(String itemName, bool hasItem) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.24,
        decoration: statusFieldDecoration(hasItem),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            itemName,
            style: statusFieldTextStyle(hasItem),
            textAlign: TextAlign.center,
          ),
        ));
  }

  BoxDecoration statusFieldDecoration(bool isTrue) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: isTrue ? Colors.green : Colors.red,
      ),
      color: isTrue ? Colors.green[100] : Colors.red[100],
    );
  }

  TextStyle statusFieldTextStyle(bool isTrue) {
    return TextStyle(
      fontSize: 16,
      color: isTrue ? Colors.green : Colors.red,
    );
  }
}
