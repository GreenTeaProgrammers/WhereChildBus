import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:io' show Platform;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';

class GoogleMapAPIManager {
  static final GoogleMapAPIManager _instance = GoogleMapAPIManager._internal();
  final String googleApiKey;
  Map<String, DateTime> _lastApiCallTimestamps = {};
  bool isFirstTime = true;

  GoogleMapAPIManager._internal()
      : googleApiKey = Platform.isAndroid
            ? dotenv.get("ANDROID_GOOGLE_MAP_API_KEY")
            : Platform.isIOS
                ? dotenv.get("IOS_GOOGLE_MAP_API_KEY")
                : "";

  factory GoogleMapAPIManager() {
    return _instance;
  }
  // APIリクエストの頻度を制限するメソッド
  void _throttleApiCall(String apiName) {
    if (_lastApiCallTimestamps.containsKey(apiName)) {
      final durationSinceLastCall =
          DateTime.now().difference(_lastApiCallTimestamps[apiName]!);
      if (durationSinceLastCall.inSeconds < 3) {
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
    developer.log(
        '${startLat}, ${startLng}, ${endLat}, ${endLng}, ${waypoints}',
        name: 'getDirections');
    String url = waypoints == ''
        ? 'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&key=$googleApiKey'
        : 'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&waypoints=$waypoints&key=$googleApiKey';
    final response = await _fetchFromGoogleAPI(url, 'getDirections');
    developer.log('${response.body}', name: "googleMapManager getDirections");
    return json.decode(response.body);
  }

  // 住所から緯度経度を取得するAPIを叩くメソッド
  Future<dynamic> geocodeAddress(String address) async {
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$googleApiKey';
    final response = await _fetchFromGoogleAPI(url, 'geocodeAddress');
    developer.log('${response.body}', name: "geocodeAddress");
    return json.decode(response.body);
  }

  // ポリラインの座標を取得するAPIを叩くメソッド
  Future<List<LatLng>> getPolylinePoints({
    required String startLat,
    required String startLng,
    required String endLat,
    required String endLng,
    List<Waypoint> waypoints = const [],
  }) async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> polylineCoordinates = [];

    List<PolylineWayPoint> polylineWayPoints = waypoints
        .map((waypoint) => PolylineWayPoint(
            location: "${waypoint.latitude},${waypoint.longitude}"))
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
