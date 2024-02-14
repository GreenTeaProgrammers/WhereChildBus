import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/components/utils/current_time_body.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  var hasBag = true;
  var hasLunchBox = true;
  var hasWaterBottle = true;
  var hasUmbrella = true;
  var isBoarding = true;

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
          childDailyRecordBody(context)
        ],
      ),
    );
  }

  Widget childDailyRecordBody(BuildContext context) {
    return Column(
      children: <Widget>[
        childFaceAndExpression(),
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: childName()),
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

  //TODO: 将来的に表情を受け取る
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

  //将来的に名前を受け取る
  Widget childName() {
    return const Text(
      "園児1",
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

  Widget childItemList(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        spacing: 8.0,
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
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: hasItem ? Colors.green : Colors.red,
          ),
          color: hasItem ? Colors.green[100] : Colors.red[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            itemName,
            style: TextStyle(
              fontSize: 16,
              color: hasItem ? Colors.green : Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
