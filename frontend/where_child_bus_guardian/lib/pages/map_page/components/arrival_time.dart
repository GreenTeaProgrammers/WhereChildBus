import 'package:flutter/material.dart';
import "dart:developer" as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../map_page.dart';
import 'package:intl/intl.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';
import 'package:where_child_bus_guardian/pages/map_page/google_map_api_manager.dart';
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
  String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  String arrivalTime = "Loading...";
  Timer? _timer;
  DateTime departureTime = DateTime.now();
  double morningFirstStationLatitude = 0.0, morningFirstStationLongitude = 0.0;
  double eveningFirstStationLatitude = 0.0, eveningFirstStationLongitude = 0.0;
  double nextStationLatitude = 0.0, nextStationLongitude = 0.0;

  @override
  void initState() {
    super.initState();
    initArrivalTime();
    _timer = Timer.periodic(
        const Duration(minutes: 1), (Timer t) => initArrivalTime());
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
      morningFirstStationLatitude =
          getLatitudeForStation(widget.bus.morningFirstStationId);
      morningFirstStationLongitude =
          getLongitudeForStation(widget.bus.morningFirstStationId);
      eveningFirstStationLatitude =
          getLatitudeForStation(widget.bus.eveningFirstStationId);
      eveningFirstStationLongitude =
          getLongitudeForStation(widget.bus.eveningFirstStationId);
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
                    departureTime.add(Duration(seconds: durationInSeconds)));
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

    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&waypoints=$waypointsString&key=$googleApiKey';

    http.Response? response = await _fetchDirections(url);

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

  Future<http.Response?> _fetchDirections(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      developer.log(
          'Failed to fetch directions. Status code: ${response.statusCode}');
      return null;
    }
    return response;
  }

  int? _parseDurationFromResponse(http.Response? response) {
    if (response == null) return null;

    final data = json.decode(response.body);
    if (data['routes'] == null || data['routes'].isEmpty) {
      developer.log('No routes found.');
      return null;
    }

    final route = data['routes'][0];
    final int duration = route['legs'][0]['duration']['value'];
    return duration;
  }
}
