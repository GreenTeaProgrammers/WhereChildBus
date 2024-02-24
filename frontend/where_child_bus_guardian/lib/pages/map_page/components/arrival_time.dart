import 'package:flutter/material.dart';
import "dart:developer" as developer;
import 'dart:async';
import '../map_page.dart';
import 'package:intl/intl.dart';
import 'package:where_child_bus_guardian/util/google_map_manager.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_guardian/util/arrival_time_manager.dart';

class ArrivalTime extends StatefulWidget {
  final Bus bus;
  final List<Waypoint> waypoints;
  final String nextStationId;
  final double busLatitude, busLongitude;
  final double guardianLatitude, guardianLongitude;

  const ArrivalTime({
    Key? key,
    required this.bus,
    required this.waypoints,
    required this.nextStationId,
    required this.busLatitude,
    required this.busLongitude,
    required this.guardianLatitude,
    required this.guardianLongitude,
  }) : super(key: key);

  @override
  State<ArrivalTime> createState() => _ArrivalTimeState();
}

class _ArrivalTimeState extends State<ArrivalTime> {
  String arrivalTimeText = "Loading...";
  String arrivalTimeAndCurrentText = "Loading...";
  Timer? _timer;
  double nextStationLatitude = 0.0, nextStationLongitude = 0.0;

  @override
  void initState() {
    super.initState();
    initArrivalTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> initArrivalTime() async {
    loadStationCoordinates();
    await setArrivalTime();
  }

  Future<void> loadStationCoordinates() async {
    if (mounted) {
      setState(() {
        nextStationLatitude = getLatitudeForStation(widget.bus.nextStationId);
        nextStationLongitude = getLongitudeForStation(widget.bus.nextStationId);
      });
    }
  }

  double getLatitudeForStation(String stationId) {
    return widget.waypoints
        .firstWhere((waypoint) => waypoint.name == stationId,
            orElse: () => Waypoint(latitude: 0.0, longitude: 0.0, name: ""))
        .latitude;
  }

  double getLongitudeForStation(String stationId) {
    return widget.waypoints
        .firstWhere((waypoint) => waypoint.name == stationId,
            orElse: () => Waypoint(latitude: 0.0, longitude: 0.0, name: ""))
        .longitude;
  }

  @override
  Widget build(BuildContext context) {
    _timer = Timer.periodic(
        const Duration(minutes: 1), (Timer t) => initArrivalTime());

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "到着まで",
                style: const TextStyle(fontSize: 20),
              ),
              Text("${arrivalTimeText}分",
                  style: arrivalTimeText == "Loading..."
                      ? const TextStyle(fontSize: 20)
                      : const TextStyle(fontSize: 30))
            ],
          ),
          Column(
            children: <Widget>[
              Text("到着予定時刻", style: const TextStyle(fontSize: 20)),
              Text("${arrivalTimeAndCurrentText}",
                  style: arrivalTimeAndCurrentText == "Loading..."
                      ? const TextStyle(fontSize: 20)
                      : const TextStyle(fontSize: 30))
            ],
          ),
        ]);
  }

  Future<void> setArrivalTime() async {
    try {
      final durationInSeconds =
          await ArrivalTimeManager.instance.getArrivalTime(
        widget.busLatitude,
        widget.busLongitude,
        nextStationLatitude,
        nextStationLongitude,
        widget.guardianLatitude,
        widget.guardianLongitude,
        widget.waypoints,
      );

      developer.log("durationInSeconds: $durationInSeconds",
          name: "ArrivalTime");

      // 成功した取得のみで値を更新 失敗したときは前回の値を保持したままにする
      if (durationInSeconds != null) {
        if (mounted) {
          setState(() {
            arrivalTimeText = (durationInSeconds ~/ 60).toString();
            arrivalTimeAndCurrentText = DateFormat('HH:mm')
                .format(
                    DateTime.now().add(Duration(seconds: durationInSeconds)))
                .toString();
          });
        }
      }
    } catch (e) {
      developer.log('到着時間の取得中にエラーが発生しました', error: e, name: "ArrivalTimeError");
    }
  }
}
