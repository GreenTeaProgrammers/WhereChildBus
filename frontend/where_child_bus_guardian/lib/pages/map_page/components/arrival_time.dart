import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:where_child_bus_guardian/pages/map_page/google_map_api_manager.dart';
import 'dart:convert';
import '../map_page.dart';

class ArrivalTime extends StatefulWidget {
  final List<Waypoint> waypoints;
  double nurseryLatitude, nurseryLongitude;
  double guardianLatitude, guardianLongitude;
  DateTime departureTime;

  ArrivalTime({
    super.key,
    required this.waypoints,
    required this.nurseryLatitude,
    required this.nurseryLongitude,
    required this.guardianLatitude,
    required this.guardianLongitude,
    required this.departureTime,
  });

  @override
  State<ArrivalTime> createState() => _ArrivalTime();
}

class _ArrivalTime extends State<ArrivalTime> {
  String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  String arrivalTime = '';

  @override
  void initState() {
    super.initState();
    setArrivalTime();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      arrivalTime,
      style: const TextStyle(fontSize: 30),
    );
  }

  void setArrivalTime() async {
    int durationInSeconds = await getArrivalTime(
        widget.nurseryLatitude,
        widget.nurseryLongitude,
        widget.guardianLatitude,
        widget.guardianLongitude,
        widget.waypoints);

    DateTime nurseryToBusStopTime =
        widget.departureTime.add(Duration(seconds: durationInSeconds));

    String formattedArrivalTime =
        '${nurseryToBusStopTime.hour.toString().padLeft(2, '0')}:${nurseryToBusStopTime.minute.toString().padLeft(2, '0')}';

    setState(() {
      arrivalTime = formattedArrivalTime;
    });
  }

  getArrivalTime(double startLat, double startLng, double endLat, double endLng,
      List<Waypoint> waypoints) async {
    String apiKey = dotenv.get("GOOGLE_MAP_API_KEY");
    String url = '';
    dynamic response;

    if (waypoints[0].latitude == endLat && waypoints[0].longitude == endLng) {
      url = 'https://maps.googleapis.com/maps/api/directions/json'
          '?destination=$endLat,$endLng&origin=$startLat,$startLng&key=$apiKey';
    } else {
      int guardianIndex = waypoints.indexWhere((point) =>
          point.latitude == widget.guardianLatitude &&
          point.longitude == widget.guardianLongitude);
      if (guardianIndex != -1) {
        waypoints = waypoints.sublist(0, guardianIndex + 1);
      }

      String waypointsString = waypoints
          .map((point) => 'via:${point.latitude},${point.longitude}|')
          .join('');

      url = 'https://maps.googleapis.com/maps/api/directions/json'
          '?destination=$endLat,$endLng&origin=$startLat,$startLng&waypoints=$waypointsString&key=$apiKey';
    }
    if (GoogleMapApiManager.canSendRequest()) {
      response = await http.get(Uri.parse(url));
    }

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
}
