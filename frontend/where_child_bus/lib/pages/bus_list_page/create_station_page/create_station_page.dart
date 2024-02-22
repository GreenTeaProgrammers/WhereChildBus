import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:where_child_bus/pages/bus_list_page/create_station_page/widget/decide_button.dart';
import 'package:where_child_bus/pages/bus_list_page/create_station_page/widget/google_map.dart';
import 'package:where_child_bus/util/api/station.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class CreateStationPage extends StatefulWidget {
  final Bus bus;

  const CreateStationPage({super.key, required this.bus});

  @override
  State<CreateStationPage> createState() => _CreateStationPageState();
}

class _CreateStationPageState extends State<CreateStationPage> {
  bool _isLoading = false;
  bool _isFailLoading = false;
  bool _isLoadingUpdate = false;
  List<GuardianResponse> guardians = [];
  List<Station> stations = [];
  Set<Marker> _markers = {};
  int _index = 0;

  Future<void> _fetchGuardians() async {
    _isLoading = true;

    try {
      var res = await getUnregisteredStations(widget.bus.id);
      if (mounted) {
        setState(() {
          guardians = res.guardians;
          stations = res.stations;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("保護者リストのロード中にエラーが発生しました: $e");
      }
      setState(() => {_isLoading = false, _isFailLoading = true});
    }
  }

  void _onMapTapped(Set<Marker> markers) {
    developer.log("マップがタップされました ${markers.first.position}");
    setState(() {
      _markers = markers;
    });
  }

  Future<void> _onButtonPressed() async {
    setState(() {
      _isLoadingUpdate = true;
    });

    if (_markers.isEmpty) {
      return;
    }

    try {
      var res = await updateStation(stations[_index].id, widget.bus.id,
          _markers.first.position.latitude, _markers.first.position.longitude);
      developer.log("バス停の更新が完了しました $res", name: "CreateStationPage");
      setState(() {
        _markers.clear();
        if (_index < guardians.length - 1) {
          _index++;
          developer.log("index: $_index");
        } else {
          Navigator.of(context).pop();
        }
        _isLoadingUpdate = false;
      });
    } catch (e) {
      if (kDebugMode) {
        developer.log("バス停の更新中にエラーが発生しました: $e", name: "CreateStationPageError");
      }
    }

    setState(() {
      _isLoadingUpdate = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchGuardians();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規バス停作成'),
      ),
      body: _createPageBody(),
    );
  }

  Widget _createPageBody() {
    return Column(
      // SingleChildScrollViewを削除し、Columnを直接使用
      children: [
        if (_isLoading)
          const Expanded(
            // CircularProgressIndicatorを中央に表示
            child: Center(child: CircularProgressIndicator()),
          )
        else if (_isFailLoading)
          const Expanded(
            // エラーメッセージを中央に表示
            child: Center(child: Text('保護者リストの取得に失敗しました')),
          )
        else
          Expanded(
            // GoogleMapを表示するためにExpandedを使用
            flex: 7, // 画面の7割をGoogleMapに割り当てる
            child: GoogleMapWidget(
              onTapped: _onMapTapped,
            ),
          ),
        _isLoading
            ? Container()
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '${guardians[_index].name}さん',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8.0),
                        child: PositionDecideButton(
                          onPressed:
                              _markers.isNotEmpty ? _onButtonPressed : () {},
                          text: _markers.isNotEmpty
                              ? 'バス停を決定する'
                              : '地図をタップしてバス停を決定してください',
                          isLoading: _isLoadingUpdate,
                        ),
                      ),
                    ],
                  ),
                ),
              )
      ],
    );
  }
}
