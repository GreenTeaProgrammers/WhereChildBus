import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_api/proto-gen/google/protobuf/field_mask.pb.dart';
import 'package:where_child_bus_guardian/service/update_guardian_status.dart';

class BusToggleButton extends StatefulWidget {
  final GuardianResponse guardian;
  final bool isMorningBus;
  final bool isUseBus;

  const BusToggleButton({
    Key? key,
    required this.guardian,
    required this.isMorningBus,
    required this.isUseBus,
  }) : super(key: key);

  @override
  State<BusToggleButton> createState() => _BusToggleButton();
}

class _BusToggleButton extends State<BusToggleButton> {
  bool _isLoading = false;
  bool _isUse = false;

  @override
  void initState() {
    super.initState();
    _isUse = widget.isUseBus;
  }

  Future<void> _updateHasItemStatus(bool isMorningBus, bool isUseBus) async {
    try {
      setState(() {
        _isLoading = true;
      });

      List<String> updateMaskName = [];
      isMorningBus
          ? updateMaskName = ["is_use_morning_bus"]
          : updateMaskName = ["is_use_evening_bus"];
      await updateGuardianStatusService(
        guardianId: widget.guardian.id,
        isUseMorningBus: isMorningBus ? !isUseBus : null,
        isUseEveningBus: isMorningBus ? null : !isUseBus,
        updateMask: FieldMask(paths: updateMaskName),
      );

      if (mounted) {
        setState(() {
          _isUse = !_isUse;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("バス乗車予定の更新に失敗: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = _isUse ? 0 : 1;
    return FlutterToggleTab(
      width: 70,
      height: 50,
      borderRadius: 15,
      selectedBackgroundColors: const [Colors.blue],
      selectedTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      unSelectedTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      labels: const ["乗る", "乗らない"],
      selectedIndex: selectedIndex,
      selectedLabelIndex: (index) {
        setState(() async {
          if (!_isLoading) {
            await _updateHasItemStatus(widget.isMorningBus, _isUse);
          }
        });
      },
      marginSelected: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
    );
  }
}
