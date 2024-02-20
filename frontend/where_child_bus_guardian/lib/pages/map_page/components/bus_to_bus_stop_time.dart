import 'package:flutter/material.dart';
import "dart:developer" as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;
import '../map_page.dart';
import 'package:where_child_bus_guardian/pages/map_page/google_map_api_manager.dart';

class BusToBusStopTime extends StatefulWidget {
  final List<Waypoint> waypoints;
  double busLatitude, busLongitude;
  double guardianLatitude, guardianLongitude;

  BusToBusStopTime(
      {super.key,
      required this.waypoints,
      required this.busLatitude,
      required this.busLongitude,
      required this.guardianLatitude,
      required this.guardianLongitude});

  @override
  State<BusToBusStopTime> createState() => _BusToBusStopTimeState();
}

class _BusToBusStopTimeState extends State<BusToBusStopTime> {
  String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  String busToBusStopTime = '';

  @override
  void initState() {
    super.initState();
    setArrivalTime();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${busToBusStopTime}分",
      style: const TextStyle(fontSize: 30),
    );
  }

  void setArrivalTime() async {
    try {
      final double? durationInSeconds = await getArrivalTime(
        widget.busLatitude,
        widget.busLongitude,
        widget.guardianLatitude,
        widget.guardianLongitude,
        widget.waypoints,
      );

      // durationInSecondsがnullでないことを確認し、分単位に変換
      if (durationInSeconds != null) {
        final int durationInMinutes = (durationInSeconds / 60).toInt();
        final String formattedBusToBusStopTime = durationInMinutes.toString();

        setState(() {
          busToBusStopTime = formattedBusToBusStopTime;
        });
      } else {
        // getArrivalTimeがnullを返した場合、エラー処理やデフォルト値の設定をここで行う
        setState(() {
          busToBusStopTime = "N/A"; // 例: 到着時間を計算できない場合のデフォルト値
        });
      }
    } catch (e) {
      // 例外が発生した場合のエラーハンドリング
      developer.log('到着時間の取得中にエラーが発生しました', error: e, name: "BusStopTimeError");
      setState(() {
        busToBusStopTime = "Error"; // エラーが発生したことを示す値
      });
    }
  }

  Future<double?> getArrivalTime(double startLat, double startLng,
      double endLat, double endLng, List<Waypoint> waypoints) async {
    String apiKey = dotenv.get("GOOGLE_MAP_API_KEY");

    // 最寄りの経由地を見つける
    int nearestWaypointIndex =
        findNearestWaypointIndex(startLat, startLng, waypoints);

    // URLの基本部分を設定
    String baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';

    // 経由地をURLパラメータ形式で生成
    String waypointsString = _generateWaypointsString(
        nearestWaypointIndex, waypoints, endLat, endLng);

    // リクエストURLを組み立て
    String url =
        '$baseUrl?destination=$endLat,$endLng&origin=$startLat,$startLng&waypoints=$waypointsString&key=$apiKey';

    // Google Maps APIからのレスポンスを取得
    http.Response? response = await _fetchDirections(url);

    // レスポンスデータから所要時間を抽出
    return _parseDurationFromResponse(response);
  }

  String _generateWaypointsString(
      int startIndex, List<Waypoint> waypoints, double endLat, double endLng) {
    int endIndex = waypoints.indexWhere(
        (point) => point.latitude == endLat && point.longitude == endLng);
    if (endIndex == -1) {
      endIndex = waypoints.length;
    }
    return waypoints
        .sublist(startIndex, endIndex)
        .map((point) => 'via:${point.latitude},${point.longitude}')
        .join('|');
  }

  Future<http.Response?> _fetchDirections(String url) async {
    if (!GoogleMapApiManager.canSendRequest()) {
      developer.log('Request limit reached.');
      return null;
    }
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      developer.log(
          'Failed to fetch directions. Status code: ${response.statusCode}');
      return null;
    }
    return response;
  }

  double? _parseDurationFromResponse(http.Response? response) {
    if (response == null) return null;

    final data = json.decode(response.body);
    if (data['routes'] == null || data['routes'].isEmpty) {
      developer.log('No routes found.');
      return null;
    }

    final route = data['routes'][0];
    final duration = route['legs'][0]['duration']['value'] as double?;
    return duration;
  }

  int findNearestWaypointIndex(
      double busLat, double busLng, List<Waypoint> waypoints) {
    int nearestIndex = 0;
    double nearestDistance = double.infinity;

    for (int i = 0; i < waypoints.length; i++) {
      double distance = calculateDistance(
          busLat, busLng, waypoints[i].latitude, waypoints[i].longitude);
      if (distance < nearestDistance) {
        nearestDistance = distance;
        nearestIndex = i;
      }
    }

    return nearestIndex;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        math.cos((lat2 - lat1) * p) / 2 +
        math.cos(lat1 * p) *
            math.cos(lat2 * p) *
            (1 - math.cos((lon2 - lon1) * p)) /
            2;
    return 12742 * math.asin(math.sqrt(a));
  }
}
