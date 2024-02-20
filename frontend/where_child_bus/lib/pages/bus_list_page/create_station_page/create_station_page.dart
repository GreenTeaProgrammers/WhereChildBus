import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:where_child_bus/pages/bus_list_page/create_station_page/widget/decide_button.dart';
import 'package:where_child_bus/pages/bus_list_page/create_station_page/widget/google_map.dart';
import 'package:where_child_bus/util/api/guardians.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart';
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
  List<GuardianResponse> guardians = [];

  Future<void> _fetchGuardians() async {
    _isLoading = true;

    try {
      GetGuardianListByBusIdResponse guardianList =
          await getGuardiansListByBusId(widget.bus.id);
      if (mounted) {
        setState(() {
          guardians = guardianList.guardians;
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
    return SingleChildScrollView(
      // スクロールを可能にする
      child: Column(
        children: [
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_isFailLoading)
            const Text('保護者リストの取得に失敗しました')
          else
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: GoogleMapWidget(
                onTapped: _onMapTapped,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'マップの下に配置されるテキスト',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            child: PositionDecideButton(
              onPressed: () {},
              text: '決定',
            ),
          ),
        ],
      ),
    );
  }
}
