import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:where_child_bus_guardian/components/utils/google_map_view.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/map_page_bottom.dart';
import 'package:where_child_bus_guardian/pages/map_page/google_map_api_manager.dart';
import 'package:where_child_bus_guardian/service/get_running_bus_by_guardian_id.dart';
import 'package:where_child_bus_guardian/service/get_station_list_by_bus_id.dart';
import 'package:where_child_bus_guardian/service/get_nursery_by_guardian_id.dart';
import 'package:where_child_bus_guardian/util/guardian_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';
import 'package:where_child_bus_guardian/pages/map_page/google_map_api_manager.dart';

class Waypoint {
  final double latitude;
  final double longitude;
  final String name;

  Waypoint(
      {required this.latitude, required this.longitude, required this.name});
}

//TODO: 将来的には出発時刻を受け取る
DateTime departureTime = DateTime.now();

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _controller = StreamController<TrackBusContinuousResponse>();

  String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  List<Station> stations = [];
  List<Waypoint> waypoints = [];

  final GuardianResponse guardian = GuardianData().getGuardian();
  Bus bus = Bus();
  NurseryResponse nursery = NurseryResponse();
  String? nurseryAddress;
  double busLatitude = 0.0;
  double busLongitude = 0.0;
  double nurseryLatitude = 0.0;
  double nurseryLongitude = 0.0;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  Future<void> _initializePage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _loadBusData();
      developer.log('バスデータの読み込み');
      await _loadStationsData();
      developer.log('停留所リストデータの読み込み');
      await _loadWaypointData();
      developer.log('経由地データの読み込み');
      await _loadNurseryData();
      developer.log('保育園データの読み込み');
      await _getCoordinates();
      developer.log('座標の取得');
      _loadBusLocation();
      developer.log('バスの位置情報の読み込み');
    } catch (e) {
      developer.log('初期化中にエラーが発生しました: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _loadBusLocation() {
    _controller.stream.listen((val) {
      if (mounted) {
        setState(() {
          busLatitude = val.latitude;
          busLongitude = val.longitude;
        });
      }
    });
  }

  Future<void> _loadBusData() async {
    try {
      var busRes = await getRunningBusByGuardianIdService(guardian.id);
      developer.log("$mounted");
      if (mounted) {
        setState(() {
          bus = busRes.bus;
          developer.log("bus: $bus");
        });
      }
    } catch (error) {
      developer.log('バスの読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadStationsData() async {
    try {
      developer.log('停留所リストの読み込み開始');
      developer.log(bus.id);
      var stationsRes = await getStationListByBusIdService(bus.id);
      if (mounted) {
        setState(() {
          stations = stationsRes.stations;
        });
      }
    } catch (error) {
      developer.log('停留所リストの読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadWaypointData() async {
    try {
      if (mounted) {
        stations.forEach((station) {
          waypoints.add(Waypoint(
              latitude: station.latitude,
              longitude: station.longitude,
              name: station.id.toString()));
        });
      }
    } catch (error) {
      developer.log('経由地の読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadNurseryData() async {
    try {
      var nurseryRes = await getNurseryByGuardianIdService(guardian.id);
      developer.log(nurseryRes.nurseries.address);
      if (mounted) {
        setState(() {
          nursery = nurseryRes.nurseries;
          nurseryAddress = nursery.address;
          developer.log("nurseryAddressを初期化");
        });
      }
    } catch (error) {
      developer.log('保育園の読み込みに失敗しました: $error');
    }
  }

  Future<void> _getCoordinates() async {
    try {
      dynamic response;
      developer.log("住所から緯度経度への変換${nurseryAddress}");
      response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?address=$nurseryAddress&key=$googleApiKey'));
      if (mounted) {
        setState(() {
          developer.log("$response");
          final data = json.decode(response.body);
          developer.log(response.body);
          final location = data['results'][0]['geometry']['location'];
          nurseryLatitude = location['lat'];
          nurseryLongitude = location['lng'];
        });
      }
    } catch (e) {
      developer.log('座標の取得に失敗しました:', error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GoogleMapView(
                  waypoints: waypoints,
                  nurseryLatitude: nurseryLatitude,
                  nurseryLongitude: nurseryLongitude,
                  busLatitude: busLatitude,
                  busLongitude: busLongitude,
                ),
                MapPageBottom(
                    guardian: guardian,
                    stations: stations,
                    waypoints: waypoints,
                    busLatitude: busLatitude,
                    busLongitude: busLongitude,
                    nurseryLatitude: nurseryLatitude,
                    nurseryLongitude: nurseryLongitude),
              ],
            ),
          );
  }
}
