import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/bus_to_bus_stop_time.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/arrival_time.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';
import '../../styles/styles.dart';

class MapPageBottom extends StatefulWidget {
  final GuardianResponse guardian;
  final List<Station> stations;
  final List<Waypoint> waypoints;
  final double busLatitude;
  final double busLongitude;
  final double nurseryLatitude;
  final double nurseryLongitude;

  const MapPageBottom(
      {Key? key,
      required this.guardian,
      required this.stations,
      required this.waypoints,
      required this.busLatitude,
      required this.busLongitude,
      required this.nurseryLatitude,
      required this.nurseryLongitude})
      : super(key: key);

  @override
  State<MapPageBottom> createState() => _MapPageBottomState();
}

class _MapPageBottomState extends State<MapPageBottom> {
  Station guardianStation = Station();

  @override
  void initState() {
    super.initState();
    _loadGuardianStationData();
  }

  Future<void> _loadGuardianStationData() async {
    try {
      widget.stations.forEach((station) {
        if (station.guardianId == widget.guardian.id) {
          setState(() {
            guardianStation = station;
          });
        }
      });
    } catch (error) {
      developer.log('停留所の読み込みに失敗しました: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            isRideScheduled("朝のバス", widget.guardian.isUseMorningBus),
            isRideScheduled("夕方のバス", widget.guardian.isUseEveningBus),
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
              BusToBusStopTime(
                waypoints: widget.waypoints,
                busLatitude: widget.busLatitude,
                busLongitude: widget.busLongitude,
                guardianLatitude: guardianStation.latitude,
                guardianLongitude: guardianStation.longitude,
              )),
          fieldTitleAndTime(
              "到着予定時刻",
              ArrivalTime(
                  waypoints: widget.waypoints,
                  nurseryLatitude: widget.nurseryLatitude,
                  nurseryLongitude: widget.nurseryLongitude,
                  guardianLatitude: guardianStation.latitude,
                  guardianLongitude: guardianStation.longitude,
                  departureTime: departureTime)),
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

  Widget isRideScheduled(String busName, bool isRide) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("${busName}の乗車予定: "),
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
