import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final busStations = ["station1", "station2", "station3","station4","station5","station6",];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            // titleText(),
            header("tesaaaaaaaaaaaaaaaaaaaaaaaaaa", "test"),
            boardingConfirmButton(context),
          ],
        )
      ),
    );
  }

  Widget titleText() {
    return const Text(
      "ルート詳細情報",
      style: TextStyle(
        fontSize: 30
      ),
    );
  }

  Widget header(String busCourseName, String busOperatorName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          busThumbnail(),
          courseAndOperator(busCourseName, busOperatorName),
        ],
      ),
    );
  }

  

  //将来的にはStationのListを参照
  Widget stationsListBuilder(BuildContext context, busStationsList) {
    String viewText = "";
    for (var station in busStationsList) {
      viewText += station + "\n";
    }
    return Text(
      viewText,

    );
  }

  Widget courseAndOperator(String courseName, String operatorName) {
    return Padding(
      padding: const EdgeInsets.only(left:50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          courseNameText(courseName),
          operatorNameText(operatorName),
        ],
      ),
    );
  }

  Widget courseNameText(String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 150),
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget operatorNameText(String name) {
    return Text(
      "担当：$name",
      style: const TextStyle(
        color: Colors.grey,
      )
    );
  }

  Widget busThumbnail() {
    return const SizedBox(
        width: 100,
        height: 100,
        child: Card(
          child: Text(
            "ここにサムネイル",
          ),
        ),
    );
  }

  Widget boardingConfirmButton(BuildContext context) {
    const double fontSize = 20;    

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: fontSize * 2,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: const Text(
          "乗客状況",
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}