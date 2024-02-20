import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;
import '../map_page.dart';

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
  State<BusToBusStopTime> createState() => _BusToBusStopTime();
}

class _BusToBusStopTime extends State<BusToBusStopTime> {
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
    int durationInMinutes = (await getArrivalTime(
                widget.busLatitude,
                widget.busLongitude,
                widget.guardianLatitude,
                widget.guardianLongitude,
                widget.waypoints) /
            60)
        .toInt();

    String formattedBusToBusStopTime = durationInMinutes.toString();

    setState(() {
      busToBusStopTime = formattedBusToBusStopTime;
    });
  }

  getArrivalTime(double startLat, double startLng, double endLat, double endLng,
      List<Waypoint> waypoints) async {
    String apiKey = dotenv.get("GOOGLE_MAP_API_KEY");
    String url = '';

    int nearestWaypointIndex =
        findNearestWaypointIndex(startLat, startLng, waypoints);

    double busToNextWaypointDistance = calculateDistance(
        startLat,
        startLng,
        waypoints[nearestWaypointIndex + 1].latitude,
        waypoints[nearestWaypointIndex + 1].longitude);

    double nearestWaypointToNextWaypointDistance = calculateDistance(
        waypoints[nearestWaypointIndex].latitude,
        waypoints[nearestWaypointIndex].longitude,
        waypoints[nearestWaypointIndex + 1].latitude,
        waypoints[nearestWaypointIndex + 1].longitude);

    if (busToNextWaypointDistance > nearestWaypointToNextWaypointDistance) {
      nearestWaypointIndex++;
    }

    if (waypoints[0].latitude == endLat && waypoints[0].longitude == endLng) {
      url = 'https://maps.googleapis.com/maps/api/directions/json'
          '?destination=$endLat,$endLng&origin=$startLat,$startLng&key=$apiKey';
    } else {
      int guardianIndex = waypoints.indexWhere((point) =>
          point.latitude == guardianLatitude &&
          point.longitude == guardianLongitude);
      if (guardianIndex != -1) {
        waypoints = waypoints.sublist(nearestWaypointIndex, guardianIndex + 1);
      }

      String waypointsString = waypoints
          .map((point) => 'via:${point.latitude},${point.longitude}|')
          .join('');

      url = 'https://maps.googleapis.com/maps/api/directions/json'
          '?destination=$endLat,$endLng&origin=$startLat,$startLng&waypoints=$waypointsString&key=$apiKey';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['routes'] != null && data['routes'].isNotEmpty) {
        final route = data['routes'][0];
        final duration = route['legs'][0]['duration']['value'];
        return duration;
      } else {
        print('No routes found.');
      }
    } else {
      print('Failed to fetch directions.');
    }
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
