import 'package:flutter/material.dart';
import "dart:developer" as developer;
import 'dart:async';
import '../map_page.dart';
import 'package:intl/intl.dart';
import 'package:where_child_bus_guardian/util/google_map_manager.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class ArrivalTime extends StatefulWidget {
  final Bus bus;
  final List<Waypoint> waypoints;
  final String nextStationId;
  final double busLatitude, busLongitude;
  final double guardianLatitude, guardianLongitude;
  final bool isMinuteOnly;

  const ArrivalTime({
    Key? key,
    required this.bus,
    required this.waypoints,
    required this.nextStationId,
    required this.busLatitude,
    required this.busLongitude,
    required this.guardianLatitude,
    required this.guardianLongitude,
    required this.isMinuteOnly,
  }) : super(key: key);

  @override
  State<ArrivalTime> createState() => _ArrivalTimeState();
}

class _ArrivalTimeState extends State<ArrivalTime> {
  String arrivalTime = "Loading...";
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
    setState(() {
      nextStationLatitude = getLatitudeForStation(widget.bus.nextStationId);
      nextStationLongitude = getLongitudeForStation(widget.bus.nextStationId);
    });
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

    return Text(
      widget.isMinuteOnly ? "${arrivalTime}分" : "${arrivalTime}",
      style: const TextStyle(fontSize: 30),
    );
  }

  Future<void> setArrivalTime() async {
    try {
      final durationInSeconds = await getArrivalTime(
        widget.busLatitude,
        widget.busLongitude,
        nextStationLatitude,
        nextStationLongitude,
        widget.guardianLatitude,
        widget.guardianLongitude,
        widget.waypoints,
      );

      if (durationInSeconds != null) {
        if (mounted) {
          setState(() {
            arrivalTime = widget.isMinuteOnly
                ? (durationInSeconds ~/ 60).toString()
                : DateFormat('HH:mm').format(
                    DateTime.now().add(Duration(seconds: durationInSeconds)));
          });
        }
      } else {
        setState(() => arrivalTime = "N/A");
      }
    } catch (e) {
      developer.log('到着時間の取得中にエラーが発生しました', error: e, name: "BusStopTimeError");
      setState(() => arrivalTime = "Error");
    }
  }

  Future<int?> getArrivalTime(
    double startLat,
    double startLng,
    double nextLat,
    double nextLng,
    double endLat,
    double endLng,
    List<Waypoint> waypoints,
  ) async {
    String waypointsString =
        _generateWaypointsString(waypoints, nextLat, nextLng, endLat, endLng);

    dynamic response = await GoogleMapAPIManager().getDirections(
      startLat: startLat.toString(),
      startLng: startLng.toString(),
      endLat: endLat.toString(),
      endLng: endLng.toString(),
      waypoints: waypointsString,
    );

    developer.log("$response", name: "ArrivalTimeResponse");
    return _parseDurationFromResponse(response);
  }

  String _generateWaypointsString(List<Waypoint> waypoints, double startLat,
      double startLng, double endLat, double endLng) {
    int startIndex = waypoints.indexWhere(
        (point) => point.latitude == startLat && point.longitude == startLng);
    int endIndex = waypoints.indexWhere(
        (point) => point.latitude == endLat && point.longitude == endLng);

    if (startIndex == -1) {
      startIndex = 0;
    }

    if (endIndex == -1 || endIndex < startIndex) {
      endIndex = waypoints.length;
    }

    developer.log("$waypoints");

    return waypoints
        .sublist(startIndex, endIndex)
        .map((point) => 'via:${point.latitude},${point.longitude}')
        .join('|');
  }

  int? _parseDurationFromResponse(dynamic data) {
    if (data == null) return null;

    if (data['routes'] == null || data['routes'].isEmpty) {
      developer.log('No routes found.');
      return null;
    }

    final route = data['routes'][0];
    final int duration = route['legs'][0]['duration']['value'];
    return duration;
  }
}
