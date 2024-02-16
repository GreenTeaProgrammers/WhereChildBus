import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_edit_page.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/stations_list.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/styles/styles.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_passenger_page/bus_passenger_page.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BottomSheetWidget extends StatefulWidget {
  final Bus bus;

  const BottomSheetWidget({super.key, required this.bus});

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final busStations = [
    "station1",
    "station2",
    "station3",
    "station4",
    "station5",
    "station6",
    "station7",
    "station8",
    "station7",
    "station7"
  ];

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
      child: Stack(children: [
        modalBody(context),
        editButton(context),
      ]),
    );
  }

  Widget modalBody(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // titleText(),
        modalHeader(widget.bus.name, "test"),
        StationsList(busStationsList: busStations),
        ConfirmButton(
          buttonText: "乗客情報",
          onTap: () => moveToBusPassengerPage(context),
        ),
      ],
    ));
  }

  moveToBusPassengerPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BusPassengerPage()));
  }

  Widget editButton(BuildContext context) {
    return Align(
      alignment: const Alignment(1, -0.98),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BusEditPage(busStations: busStations)));
          },
          style: editButtonStyle(),
          child: const Text("Edit",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
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
          busThumbnail(widget.bus.status),
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
          padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
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
        fontSize: 18,
      ),
    );
  }

  Widget courseAndOperator(String courseName, String operatorName) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
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
    return Text("担当：$name",
        style: const TextStyle(
          color: Colors.grey,
        ));
  }

  Widget busThumbnail(Status busStatus) {
    late String imagePath;
    if (busStatus == Status.STATUS_RUNNING) {
      imagePath = "assets/images/bus_operating.png";
    } else {
      imagePath = "assets/images/bus_not_operating.png";
    }

    return SizedBox(
        width: 100,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ));
  }
}
