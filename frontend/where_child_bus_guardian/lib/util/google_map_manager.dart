import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class GoogleMapAPIManager {
  static final GoogleMapAPIManager _instance = GoogleMapAPIManager._internal();
  final String googleApiKey;
  Map<String, DateTime> _lastApiCallTimestamps = {};

  GoogleMapAPIManager._internal()
      : googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");

  factory GoogleMapAPIManager() {
    return _instance;
  }

  // APIリクエストの頻度を制限するメソッド
  void _throttleApiCall(String apiName) {
    if (_lastApiCallTimestamps.containsKey(apiName)) {
      final durationSinceLastCall =
          DateTime.now().difference(_lastApiCallTimestamps[apiName]!);
      if (durationSinceLastCall.inSeconds < 60) {
        throw Exception(
            'Too many requests: $apiName can only be called once per minute.');
      }
    }
    _lastApiCallTimestamps[apiName] = DateTime.now();
  }

  // Google Maps APIへのリクエストを行うメソッド
  Future<http.Response> _fetchFromGoogleAPI(String url, String apiName) async {
    _throttleApiCall(apiName);

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data from Google Maps API');
    }
  }

  // 方向取得のAPIを叩くメソッド
  Future<dynamic> getDirections({
    required String startLat,
    required String startLng,
    required String endLat,
    required String endLng,
    String waypoints = '',
  }) async {
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&waypoints=optimize:true|$waypoints&key=$googleApiKey';
    final response = await _fetchFromGoogleAPI(url, 'getDirections');
    return json.decode(response.body);
  }

  // 住所から緯度経度を取得するAPIを叩くメソッド
  Future<dynamic> geocodeAddress(String address) async {
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$googleApiKey';
    final response = await _fetchFromGoogleAPI(url, 'geocodeAddress');
    return json.decode(response.body);
  }

  // ポリラインの座標を取得するAPIを叩くメソッド
  Future<List<LatLng>> getPolylinePoints({
    required String startLat,
    required String startLng,
    required String endLat,
    required String endLng,
    List<String> waypoints = const [],
  }) async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> polylineCoordinates = [];

    List<PolylineWayPoint> polylineWayPoints = waypoints
        .map((waypoint) => PolylineWayPoint(location: waypoint))
        .toList();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(double.parse(startLat), double.parse(startLng)),
      PointLatLng(double.parse(endLat), double.parse(endLng)),
      travelMode: TravelMode.driving,
      wayPoints: polylineWayPoints,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    return polylineCoordinates;
  }
}
