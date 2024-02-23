import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:where_child_bus_guardian/components/utils/google_map_view.dart';
import 'package:where_child_bus_guardian/config/config.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/map_page_bottom.dart';
import 'package:where_child_bus_guardian/service/get_running_bus_by_guardian_id.dart';
import 'package:where_child_bus_guardian/service/get_bus_route_by_bus_id.dart';
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

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final StreamController<TrackBusContinuousRequest> _streamController =
      StreamController<TrackBusContinuousRequest>.broadcast();

  String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  List<Station> busRoutes = [];
  List<Waypoint> waypoints = [];

  final GuardianResponse guardian = GuardianData().getGuardian();
  Bus bus = Bus();
  NurseryResponse nursery = NurseryResponse();
  String? nurseryAddress;
  String nextStationId = "";
  double busLatitude = 0.0;
  double busLongitude = 0.0;
  double nurseryLatitude = 0.0;
  double nurseryLongitude = 0.0;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    developer.log("初期化開始", name: "Initialize");
    _initializePage();
  }

  Future<void> trackBusContinuous() async {
    final channel = ClientChannel(appConfig.grpcEndpoint,
        port: appConfig.grpcPort, options: const ChannelOptions());
    final grpcClient = BusServiceClient(channel);

    try {
      developer.log("バスの追跡開始", name: "TrackBusContinuous");
      // TrackBusContinuousRequestを生成して、バスの追跡を開始
      var request = TrackBusContinuousRequest(busId: bus.id);
      await for (var response in grpcClient.trackBusContinuous(request)) {
        // レスポンスを受け取り、緯度と経度を更新
        setState(() {
          busLatitude = response.latitude;
          busLongitude = response.longitude;
          developer.log("$busLatitude, $busLongitude",
              name: "TrackBusContinuous");
        });
        await Future.delayed(const Duration(seconds: 10));
      }
    } catch (error) {
      developer.log("Caught Error", error: error);
    } finally {
      await channel.shutdown();
    }
  }

  Future<void> _initializePage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _loadBusData();
      developer.log("バスの読み込み完了", name: "LoadBusData");
      trackBusContinuous(); // ストリームではなく、直接リクエストを送信
      await _loadStationsData();
      developer.log("停留所の読み込み完了", name: "LoadStationsData");
      await _createWayPointsFromStations();
      developer.log("経由地の読み込み完了", name: "LoadWaypointData");
      await _loadNurseryData();
      await _getNurseryCoordinates();
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

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> _loadBusData() async {
    try {
      var busRes = await getRunningBusByGuardianIdService(guardian.id);
      if (mounted) {
        setState(() {
          bus = busRes.bus;
        });
      }
    } catch (error) {
      developer.log('バスの読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadStationsData() async {
    try {
      var busType = BusType.BUS_TYPE_EVENING;
      developer.log('停留所リストの読み込み開始');
      var busRouteRes = await getBusRouteByBusService(bus.id, busType);
      if (mounted) {
        setState(() {
          busRoutes = busRouteRes.busRoute.orderedStations;
        });
      }
      developer.log('map_page.dart stations: ${busRoutes}');
    } catch (error) {
      developer.log('停留所リストの読み込みに失敗しました: $error');
    }
  }

  Future<void> _createWayPointsFromStations() async {
    try {
      developer.log("Waypointsの作成開始", name: "CreateWaypointsFromStations");
      if (mounted) {
        for (var station in busRoutes) {
          developer.log("Waypointsの作成中 ${station.id}",
              name: "CreateWaypointsFromStations");
          waypoints.add(Waypoint(
              latitude: station.latitude,
              longitude: station.longitude,
              name: station.id.toString()));
        }
      }
      developer.log("Waypointsの作成終了 $waypoints",
          name: "CreateWaypointsFromStations");
    } catch (error) {
      developer.log('経由地の読み込みに失敗しました: $error');
    }
  }

  Future<void> _loadNurseryData() async {
    try {
      developer.log("保育園の読み込み開始", name: "LoadNurseryData");
      var nurseryRes = await getNurseryByGuardianIdService(guardian.id);
      if (mounted) {
        setState(() {
          nursery = nurseryRes.nurseries;
          nurseryAddress = nursery.address;
        });
      }
    } catch (error) {
      developer.log('保育園の読み込みに失敗しました: $error');
    }
  }

  Future<void> _getNurseryCoordinates() async {
    try {
      dynamic response;
      developer.log("住所から緯度経度への変換${nurseryAddress}");
      response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?address=$nurseryAddress&key=$googleApiKey'));
      if (mounted) {
        setState(() {
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
                    bus: bus,
                    stations: busRoutes,
                    waypoints: waypoints,
                    nextStationId: nextStationId,
                    busLatitude: busLatitude,
                    busLongitude: busLongitude,
                    nurseryLatitude: nurseryLatitude,
                    nurseryLongitude: nurseryLongitude),
              ],
            ),
          );
  }
}
