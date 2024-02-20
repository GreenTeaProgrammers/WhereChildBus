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

  late GuardianResponse guardian;
  late Bus bus;
  late NurseryResponse nursery;
  late String nurseryAddress;
  late double busLatitude;
  late double busLongitude;
  late double nurseryLatitude;
  late double nurseryLongitude;

  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    super.initState();
    guardian = GuardianData().getGuardian();
    _loadBusLocation();
    _loadBusData();
    _loadStationsData();
    _loadWaypointData();
    _loadNurseryData();
    _getCoordinates();
    _isLoading = false;
  }

  void _loadBusLocation() {
    _controller.stream.listen((val) {
      setState(() {
        busLatitude = val.latitude;
        busLongitude = val.longitude;
      });
    });
  }

  Future<void> _loadBusData() async {
    try {
      var busRes = await getRunningBusByGuardianIdService(guardian.id);
      setState(() {
        bus = busRes.bus;
      });
    } catch (error) {
      developer.log('バスの読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadStationsData() async {
    try {
      var stationsRes = await getStationListByBusIdService(bus.id);
      setState(() {
        stations = stationsRes.stations;
      });
    } catch (error) {
      developer.log('停留所リストの読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadWaypointData() async {
    try {
      stations.forEach((station) {
        waypoints.add(Waypoint(
            latitude: station.latitude,
            longitude: station.longitude,
            name: station.id.toString()));
      });
    } catch (error) {
      developer.log('通過点の読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadNurseryData() async {
    try {
      var nurseryRes = await getNurseryByGuardianIdService(guardian.id);
      setState(() {
        nursery = nurseryRes.nurseries;
        developer.log(nursery.address);
        if (nursery != null) {
          nurseryAddress = nursery.address;
        }
      });
    } catch (error) {
      developer.log('保育園の読み込みに失敗しました: $error');
    }
  }

  Future<void> _getCoordinates() async {
    dynamic response;
    if (GoogleMapApiManager.canSendRequest()) {
      response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?address=$nurseryAddress&key=$googleApiKey'));
    }
    final data = json.decode(response.body);
    final location = data['results'][0]['geometry']['location'];
    nurseryLatitude = location['lat'];
    nurseryLongitude = location['lng'];
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
