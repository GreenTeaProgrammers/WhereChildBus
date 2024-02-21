import 'package:flutter/material.dart';
import "dart:developer" as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../map_page.dart';
import 'package:where_child_bus_guardian/pages/map_page/google_map_api_manager.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusToBusStopTime extends StatefulWidget {
  final Bus bus;
  final List<Waypoint> waypoints;
  final String nextStationId;
  double busLatitude, busLongitude;
  double guardianLatitude, guardianLongitude;

  BusToBusStopTime(
      {Key? key,
      required this.bus,
      required this.waypoints,
      required this.nextStationId,
      required this.busLatitude,
      required this.busLongitude,
      required this.guardianLatitude,
      required this.guardianLongitude})
      : super(key: key);

  @override
  State<BusToBusStopTime> createState() => _BusToBusStopTimeState();
}

class _BusToBusStopTimeState extends State<BusToBusStopTime> {
  final String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  String busToBusStopTime = 'Loading...';
  Timer? _timer;
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
    _loadEveningFirstStation();
    _loadEveningFirstStation();
    _loadFirstAndNextStation();
    await setArrivalTime();
  }

  Future<void> _loadMorningFirstStation() async {
    for (var waypoint in widget.waypoints) {
      if (waypoint.name == widget.bus.morningFirstStationId) {
        if (mounted) {
          setState(() {
            morningFirstStationLatitude = waypoint.latitude;
            morningFirstStationLongitude = waypoint.longitude;
          });
        }
      }
    }
  }

  Future<void> _loadEveningFirstStation() async {
    for (var waypoint in widget.waypoints) {
      if (waypoint.name == widget.bus.eveningFirstStationId) {
        if (mounted) {
          setState(() {
            eveningFirstStationLatitude = waypoint.latitude;
            eveningFirstStationLongitude = waypoint.longitude;
          });
        }
      }
    }
  }

  Future<void> _loadFirstAndNextStation() async {
    for (var waypoint in widget.waypoints) {
      if (waypoint.name == widget.bus.nextStationId) {
        if (mounted) {
          setState(() {
            nextStationLatitude = waypoint.latitude;
            nextStationLongitude = waypoint.longitude;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${busToBusStopTime}分",
      style: const TextStyle(fontSize: 30),
    );
  }

  Future<void> setArrivalTime() async {
    try {
      final int? durationInSeconds = await getArrivalTime(
        widget.busLatitude,
        widget.busLongitude,
        widget.guardianLatitude,
        widget.guardianLongitude,
        widget.waypoints,
        nextStationLatitude,
        nextStationLongitude,
      );

      developer.log('$durationInSeconds');

      if (durationInSeconds != null) {
        final int durationInMinutes = (durationInSeconds ~/ 60);
        final String formattedBusToBusStopTime = durationInMinutes.toString();

        setState(() {
          busToBusStopTime = formattedBusToBusStopTime;
        });
      } else {
        setState(() {
          busToBusStopTime = "N/A";
        });
      }
    } catch (e) {
      developer.log('到着時間の取得中にエラーが発生しました', error: e, name: "BusStopTimeError");
      setState(() {
        busToBusStopTime = "Error";
      });
    }
  }

  Future<int?> getArrivalTime(
      double startLat,
      double startLng,
      double endLat,
      double endLng,
      List<Waypoint> waypoints,
      double nextLat,
      double nextLng) async {
    developer.log('bus_to_bus_stop_time.dart waypoints: $waypoints');
    String waypointsString =
        _generateWaypointsString(waypoints, nextLat, nextLng, endLat, endLng);

    developer.log('waypointsString: $waypointsString');

    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&waypoints=$waypointsString&key=$googleApiKey';

    // Google Maps APIからのレスポンスを取得
    http.Response? response = await _fetchDirections(url);
    developer.log('response: $response');

    // レスポンスデータから所要時間を抽出
    return _parseDurationFromResponse(response);
  }

  String _generateWaypointsString(List<Waypoint> waypoints, double startLat,
      double startLng, double endLat, double endLng) {
    int startIndex = waypoints.indexWhere(
        (point) => point.latitude == startLat && point.longitude == startLng);
    int endIndex = waypoints.indexWhere(
        (point) => point.latitude == endLat && point.longitude == endLng);

    // startIndex が -1 の場合は、リストの最初から処理を開始
    if (startIndex == -1) {
      startIndex = 0;
    }

    // endIndex が -1 の場合、リストの終わりまで処理
    if (endIndex == -1 || endIndex < startIndex) {
      endIndex = waypoints.length;
    }

    developer.log("$waypoints");

    // startIndex から endIndex までのサブリストを作成
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
