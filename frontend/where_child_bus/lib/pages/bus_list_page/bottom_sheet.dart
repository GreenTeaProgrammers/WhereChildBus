import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_edit_page.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/stations_list.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/styles/styles.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_passenger_page/bus_passenger_page.dart';

class BottomSheetWidget extends StatelessWidget {
  final busStations = ["station1", "station2", "station3","station4","station5","station6", "station7", "station8", "station7", "station7"];
  final String busName;

  //将来的にはコンストラクタでバス型を受け取る
  BottomSheetWidget({required this.busName});

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
      child: Stack(
        children: [
          modalBody(context),
          editButton(context),
        ]
      ),
    );
  }

  Widget modalBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // titleText(),
          modalHeader(busName, "test"),
          StationsList(busStationsList: busStations),
          ConfirmButton(
            buttonText: "乗客情報", 
            onTap: () => moveToBusPassengerPage(context),
          ),
        ],
      )
    );
  }

  moveToBusPassengerPage(BuildContext context) {
    Navigator.push(
      context,MaterialPageRoute(builder: (context) => BusPassengerPage()) 
    );
  }

  Widget editButton(BuildContext context) {
    return Align(
      alignment: const Alignment(1, -0.98),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,MaterialPageRoute(builder: (context) => BusEditPage(busStations: busStations))
              );
          },
          style: editButtonStyle(),
          child: const Text(
            "Edit",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            )
          ),
        ),
      ),
    );
  }

  Widget modalHeader(String busCourseName, String busOperatorName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 50, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          busThumbnail(),
          courseAndOperator(busCourseName, busOperatorName),
        ],
      ),
    );
  }

  //将来的にはStationのListを参照
  Widget stationsList(BuildContext context, List<String> busStationsList) {
    return ListView.builder(
      itemCount: busStationsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(50,  10,  0,  0),
          child: stationsListElement(busStationsList[index]),
        );
      },
    );
  }

  Widget stationsListElement(String stationName) {
    return Text(
      stationName,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize:  18,
      ),
    );
  }

  Widget courseAndOperator(String courseName, String operatorName) {
    return Padding(
      padding: const EdgeInsets.only(left:30),
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

  //TODO:本来は画像を受蹴取って表示する
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
}
