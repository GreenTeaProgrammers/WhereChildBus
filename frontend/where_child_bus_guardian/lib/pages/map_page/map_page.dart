import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:where_child_bus_guardian/components/utils/google_map_view.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/map_page_bottom.dart';
import 'package:where_child_bus_guardian/service/get_running_bus_by_guardian_id.dart';
import 'package:where_child_bus_guardian/service/get_station_list_by_bus_id.dart';
import 'package:where_child_bus_guardian/service/get_nursery_by_guardian_id.dart';
import 'package:where_child_bus_guardian/util/guardian_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';

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
    _loadData();
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

  Future<void> _loadData() async {
    try {
      var busRes = await getRunningBusByGuardianIdService(guardian.id);
      var stationsRes = await getStationListByBusIdService(bus.id);
      var nurseryRes = await getNurseryByGuardianIdService(guardian.id);
      stations.forEach((station) {
        waypoints.add(Waypoint(
            latitude: station.latitude,
            longitude: station.longitude,
            name: station.id.toString()));
      });
      final response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?address=$nurseryAddress&key=$googleApiKey'));
      final data = json.decode(response.body);
      final location = data['results'][0]['geometry']['location'];

      setState(() {
        bus = busRes.bus;
        stations = stationsRes.stations;
        nursery = nurseryRes.nurseries;
        nurseryAddress = nursery.address;
        nurseryLatitude = location['lat'];
        nurseryLongitude = location['lng'];
      });
    } catch (error) {
      developer.log('データの読み込みに失敗しました: $error');
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
