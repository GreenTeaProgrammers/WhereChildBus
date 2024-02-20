import 'package:flutter/material.dart';
import '../../styles/styles.dart';

class DailyRecordBody extends StatefulWidget {
  final String childName;

  const DailyRecordBody({super.key, required this.childName});

  @override
  State<DailyRecordBody> createState() => _DailyRecordBody();
}

class _DailyRecordBody extends State<DailyRecordBody> {
  //TODO: 将来的にChild型を受け取る
  var isBoarding = true;
  var hasBag = false;
  var hasLunchBox = true;
  var hasWaterBottle = true;
  var hasUmbrella = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        childFaceAndExpression(),
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              widget.childName,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            )),
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
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.24,
        child: Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: hasItem
                      ? const Icon(Icons.check, color: Colors.green)
                      : const Icon(Icons.error_outline, color: Colors.red),
                ),
                const SizedBox(width: 8),
                Text(
                  itemName,
                  style: statusFieldTextStyle(hasItem),
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
