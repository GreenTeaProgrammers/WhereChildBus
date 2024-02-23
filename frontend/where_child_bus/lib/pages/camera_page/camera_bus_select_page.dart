import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/components/util/input_value_label.dart';
import 'package:where_child_bus/models/nursery_bus_data.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus/pages/camera_page/camera_page.dart';
import 'package:where_child_bus/pages/camera_page/widgets/bus_select_box.dart';
import 'package:where_child_bus/pages/camera_page/widgets/time_select_box.dart';
import 'package:where_child_bus/service/get_bus_list_by_nursery_id.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusSelectPage extends StatefulWidget {
  const BusSelectPage({super.key});

  @override
  State<BusSelectPage> createState() => _BusSelectPageState();
}

class _BusSelectPageState extends State<BusSelectPage> {
  Bus? _selectedBus;
  BusType _selectedType = BusType.BUS_TYPE_MORNING;
  List<Bus> _buses = [];
  Future<List<Bus>>? _busesFuture;

  Future<List<Bus>> _loadBuses() async {
    if (NurseryBusData().getBusList().isNotEmpty) {
      _selectedBus = NurseryBusData().getBusList().first;
      return NurseryBusData().getBusList();
    } else {
      return _fetchBus();
    }
  }

  Future<List<Bus>> _fetchBus() async {
    try {
      GetBusListByNurseryIdResponse busList =
          await getBusList(NurseryData().getNursery().id);
      NurseryBusData().setBusListResponse(busList);
      _selectedBus = busList.buses[0];
      return NurseryBusData().getBusList();
    } catch (error) {
      if (kDebugMode) {
        developer.log("バスのロード中にエラーが発生しました", error: error.toString());
      }
      throw Exception('バスのロードに失敗しました');
    }
  }

  @override
  void initState() {
    super.initState();
    // _loadBuses()の結果をフィールドに保持
    _busesFuture = _loadBuses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createPageBody(),
    );
  }

  Widget _createPageBody() {
    return FutureBuilder<List<Bus>>(
      future: _busesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('データの取得に失敗しました: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          _buses = snapshot.data!;
          return Center(
            child: Column(
              children: [
                _createBusInputLabelAndSelectBox(context, "バスを選択して下さい",
                    _buses.map((Bus bus) => bus.name).toList()),
                const SizedBox(height: 20),
                _createTimeInputLabelAndSelectBox(context, "時間を選択して下さい"),
                const SizedBox(height: 20),
                _proceedButton(),
              ],
            ),
          );
        } else {
          return const Center(child: Text('利用可能なバスがありません'));
        }
      },
    );
  }

  Widget _createBusInputLabelAndSelectBox(
      BuildContext context, String label, List<String> lists) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputValueLabel(label: label),
        BusSelectValueBox(busLists: _buses, onChanged: _onChangedBus),
      ],
    );
  }

  Widget _createTimeInputLabelAndSelectBox(
    BuildContext context,
    String label,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputValueLabel(label: label),
        TimeSelectValueBox(onChanged: _onChangedTime),
      ],
    );
  }

  void _onChangedTime(BusType type) {
    if (mounted) {
      setState(() {
        _selectedType = type;
      });
    }
  }

  void _onChangedBus(Bus? bus) {
    if (mounted) {
      setState(() {
        _selectedBus = bus;
      });
    }
  }

  Widget _proceedButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_selectedBus != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraPage(
                bus: _selectedBus!,
                busType: _selectedType,
              ),
            ),
          );
          await _fetchBus();
        }
      },
      child: const Text("カメラ起動"),
    );
  }
}
