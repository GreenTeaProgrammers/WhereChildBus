import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/components/utils/google_map_view.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/arrival_time.dart';
import '../styles/styles.dart';

class Waypoint {
  final double latitude;
  final double longitude;
  final String name;

  Waypoint(
      {required this.latitude, required this.longitude, required this.name});
}

//TODO: 将来的に停留所のデータを受け取る
final List<Waypoint> waypoints = [
  Waypoint(latitude: 34.7108, longitude: 137.7261, name: "停留所1"),
  Waypoint(latitude: 34.7169, longitude: 137.7285, name: "停留所2"),
  Waypoint(latitude: 34.7159, longitude: 137.7368, name: "停留所3"),
];

//TODO: 将来的に保育園の緯度経度を受け取る
double nurseryLatitude = 34.7056, nurseryLongitude = 137.7343;

//TODO: 将来的にバスの現在位置を受け取る
double busLatitude = 34.7057, busLongitude = 137.7317;

//TODO: 将来的には保護者に結び付く停留所の緯度経度を受け取る
double guardianLatitude = 34.7108, guardianLongitude = 137.7261;

//TODO: 将来的には出発時刻を受け取る
DateTime departureTime = DateTime.now();

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var isRide = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GoogleMapView(
            waypoints: waypoints,
            nurseryLatitude: nurseryLatitude,
            nurseryLongitude: nurseryLongitude,
            busLatitude: busLatitude,
            busLongitude: busLongitude,
          ),
          pageBottomBody()
        ],
      ),
    );
  }

  Widget pageBottomBody() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            arrivalTimeBody(),
            isRideScheduled(),
          ],
        ),
      ),
    );
  }

  Widget arrivalTimeBody() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          fieldTitleAndTime(
              "到着まで",
              ArrivalTime(
                  waypoints: waypoints,
                  nurseryLatitude: nurseryLatitude,
                  nurseryLongitude: nurseryLongitude,
                  guardianLatitude: guardianLatitude,
                  guardianLongitude: guardianLongitude,
                  departureTime: departureTime)),
          fieldTitleAndTime(
              "到着予定時刻",
              ArrivalTime(
                  waypoints: waypoints,
                  nurseryLatitude: nurseryLatitude,
                  nurseryLongitude: nurseryLongitude,
                  guardianLatitude: guardianLatitude,
                  guardianLongitude: guardianLongitude,
                  departureTime: departureTime))
        ]);
  }

  Widget fieldTitleAndTime(String title, Widget time) {
    return Column(
      children: <Widget>[
        Text(title),
        time,
      ],
    );
  }

  Widget isRideScheduled() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("乗車予定: "),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: statusFieldDecoration(isRide),
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                isRide ? "あり" : "なし",
                style: statusFieldTextStyle(isRide),
                textAlign: TextAlign.center,
              )),
        )
      ],
    );
  }
}
