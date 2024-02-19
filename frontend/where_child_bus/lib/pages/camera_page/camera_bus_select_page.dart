import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/components/util/input_value_label.dart';
import 'package:where_child_bus/models/nursery_bus_data.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus/pages/camera_page/camera_page.dart';
import 'package:where_child_bus/pages/camera_page/components/bus_select_box.dart';
import 'package:where_child_bus/pages/camera_page/components/time_select_box.dart';
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
  bool _isLoading = false;
  bool _isFailLoading = false;
  List<Bus> _buses = [];

  @override
  void initState() {
    super.initState();
    _loadBuses();
  }

  Future<void> _loadBuses() async {
    if (NurseryBusData().getBusList().isNotEmpty) {
      if (mounted) {
        setState(() {
          _buses = NurseryBusData().getBusList();
        });
      }
      return;
    } else {
      try {
        GetBusListByNurseryIdResponse busList =
            await getBusList(NurseryData().getNursery().id);
        NurseryBusData().setBusListResponse(busList);
        if (mounted) {
          setState(() {
            _buses = NurseryBusData().getBusList();
          });
        }
      } catch (error) {
        if (kDebugMode) {
          developer.log("バスのロード中にエラーが発生しました", error: error);
        }
        if (mounted) {
          setState(() {
            _isLoading = false;
            _isFailLoading = true;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createPageBody(),
    );
  }

  Widget _createPageBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_isFailLoading) {
      return const Center(
        child: Text('データの取得に失敗しました'),
      );
    } else {
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
      ));
    }
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
      onPressed: () {
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
        }
      },
      child: const Text("カメラ起動"),
    );
  }
}
