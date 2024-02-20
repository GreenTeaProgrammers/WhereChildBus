import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart'; // 日付フォーマットのために追加

class ArrivalTime extends StatefulWidget {
  final List<Waypoint> waypoints;
  final double nurseryLatitude, nurseryLongitude;
  final double guardianLatitude, guardianLongitude;
  final DateTime departureTime;

  const ArrivalTime({
    Key? key,
    required this.waypoints,
    required this.nurseryLatitude,
    required this.nurseryLongitude,
    required this.guardianLatitude,
    required this.guardianLongitude,
    required this.departureTime,
  }) : super(key: key);

  @override
  State<ArrivalTime> createState() => _ArrivalTimeState();
}

class _ArrivalTimeState extends State<ArrivalTime> {
  String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  String arrivalTime = "Loading...";

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
    try {
      final durationInSeconds = await getArrivalTime(
        widget.nurseryLatitude,
        widget.nurseryLongitude,
        widget.guardianLatitude,
        widget.guardianLongitude,
        widget.waypoints,
      );

      if (durationInSeconds != null) {
        DateTime arrivalDateTime =
            widget.departureTime.add(Duration(seconds: durationInSeconds));

        setState(() {
          arrivalTime = DateFormat('HH:mm').format(arrivalDateTime);
        });
      } else {
        setState(() => arrivalTime = "N/A");
      }
    } catch (e) {
      setState(() => arrivalTime = "Error");
      developer.log('Error setting arrival time: $e');
    }
  }

  Future<int?> getArrivalTime(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
    List<Waypoint> waypoints,
  ) async {
    String url = buildDirectionUrl(
        startLat, startLng, endLat, endLng, waypoints, googleApiKey);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['routes'].isNotEmpty) {
          final int duration =
              data['routes'][0]['legs'][0]['duration']['value'];
          return duration;
        }
      }
      developer.log('Failed to fetch directions or no routes found.');
      return null;
    } catch (e) {
      developer.log('Exception caught fetching directions: $e');
      return null;
    }
  }

  String buildDirectionUrl(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
    List<Waypoint> waypoints,
    String apiKey,
  ) {
    String waypointsString = waypoints
        .map((point) => 'via:${point.latitude},${point.longitude}')
        .join('|');
    return 'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&waypoints=$waypointsString&key=$apiKey';
  }
}
