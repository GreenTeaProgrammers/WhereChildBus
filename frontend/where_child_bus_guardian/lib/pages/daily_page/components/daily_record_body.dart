import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_guardian/service/check_is_child_in_bus.dart';
import 'package:where_child_bus_guardian/components/utils/image_from_byte.dart';
import 'package:where_child_bus_guardian/pages/daily_page/components/has_item_state.dart';
import '../../styles/styles.dart';

class DailyRecordBody extends StatefulWidget {
  final Child child;
  final ChildPhoto image;

  const DailyRecordBody({
    Key? key,
    required this.child,
    required this.image,
  }) : super(key: key);

  @override
  State<DailyRecordBody> createState() => _DailyRecordBody();
}

class _DailyRecordBody extends State<DailyRecordBody> {
  bool isBoarding = false;
  bool hasBagState = false;
  bool hasLunchBoxState = false;
  bool hasWaterBottleState = false;
  bool hasUmbrellaState = false;

  @override
  void initState() {
    super.initState();
    _loadBoardingStatus();
  }

  Future<void> _loadBoardingStatus() async {
    try {
      CheckIsChildInBusResponse res =
          await checkIsChildInBusService(widget.child.id);
      if (mounted) {
        setState(() {
          isBoarding = res.isInBus;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("乗降状態のロード中にエラーが発生しました: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        childFaceAndExpression(),
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              widget.child.name,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            )),
        statusIconAndStatusField(
            context, Icons.directions_bus, isBoardingStatusField(context)),
        statusIconAndStatusField(
            context, Icons.business_center, childItemList(context)),
      ],
    );
  }

  Widget childFaceAndExpression() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ImageFromBytes(
          imageData: widget.image.photoData,
          height: 150,
          width: 150,
        ),
        childExpressionIcon()
      ],
    );
  }

  //TODO: 将来的に表情を受け取り、アイコンを表示する
  Widget childExpressionIcon() {
    return const SizedBox(
        width: 100,
        height: 100,
        child: Icon(
          Icons.sentiment_satisfied,
          size: 100,
        ));
  }

  Widget statusIconAndStatusField(
      BuildContext context, IconData icon, Widget statusField) {
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
      height: MediaQuery.of(context).size.height * 0.14,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        runSpacing: 4.0,
        children: [
          HasItemState(
              child: widget.child,
              itemName: "かばん",
              hasItem: widget.child.hasBag),
          HasItemState(
              child: widget.child,
              itemName: "お弁当",
              hasItem: widget.child.hasLunchBox),
          HasItemState(
              child: widget.child,
              itemName: "水筒",
              hasItem: widget.child.hasWaterBottle),
          HasItemState(
              child: widget.child,
              itemName: "傘",
              hasItem: widget.child.hasUmbrella),
        ],
      ),
    );
  }
}
