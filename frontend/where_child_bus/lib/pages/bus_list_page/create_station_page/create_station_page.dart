import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規バス停作成'),
      ),
      body: Container(),
    );
  }
}
