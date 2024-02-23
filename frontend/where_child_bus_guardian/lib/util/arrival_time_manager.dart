import "dart:developer" as developer;
import 'dart:async';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';
import 'package:where_child_bus_guardian/util/google_map_manager.dart';

class ArrivalTimeManager {
  static final ArrivalTimeManager _instance = ArrivalTimeManager._internal();

  ArrivalTimeManager._internal();

  static ArrivalTimeManager get instance => _instance;

  Future<int?> getArrivalTime(
      double busLatitude,
      double busLongitude,
      double nextStationLatitude,
      double nextStationLongitude,
      double guardianLatitude,
      double guardianLongitude,
      List<Waypoint> waypoints) async {
    String waypointsString = _generateWaypointsString(
        waypoints,
        nextStationLatitude,
        nextStationLongitude,
        guardianLatitude,
        guardianLongitude);

    Map<String, dynamic> response = await GoogleMapAPIManager().getDirections(
      startLat: busLatitude.toString(),
      startLng: busLongitude.toString(),
      endLat: guardianLatitude.toString(),
      endLng: guardianLongitude.toString(),
      waypoints: waypointsString,
    );

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

  int? _parseDurationFromResponse(Map<String, dynamic> data) {
    if (data == null) return null;

    if (data['routes'] == null || data['routes'].isEmpty) {
      developer.log('No routes found.',
          name: 'ArrivalTimeManager getRoutesError');
      return null;
    }

    final route = data['routes'][0];
    final int duration = route['legs'][0]['duration']['value'];
    return duration;
  }
}
