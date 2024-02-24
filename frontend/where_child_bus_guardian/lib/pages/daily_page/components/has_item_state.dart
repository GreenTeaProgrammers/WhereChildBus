import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_api/proto-gen/google/protobuf/field_mask.pb.dart';
import 'package:where_child_bus_guardian/service/update_child_item_status.dart';
import '../../styles/styles.dart';

class HasItemState extends StatefulWidget {
  final Child child;
  final String itemName;
  final bool hasItem;

  const HasItemState({
    Key? key,
    required this.child,
    required this.itemName,
    required this.hasItem,
  }) : super(key: key);

  @override
  State<HasItemState> createState() => _HasItemState();
}

class _HasItemState extends State<HasItemState> {
  bool _isLoading = false;
  bool _hasItem = false;

  @override
  void initState() {
    super.initState();
    _updateCheckForMissingItems();
    _hasItem = widget.hasItem;
  }

  Future<void> _updateCheckForMissingItems() async {
    try {
      if (widget.child.hasBag &&
          widget.child.hasLunchBox &&
          widget.child.hasWaterBottle &&
          widget.child.hasUmbrella) {
        await updateChildItemStatusService(
            childId: widget.child.id,
            checkForMissingItems: true,
            updateMask: FieldMask(paths: ["check_for_missing_items"]));
      } else {
        await updateChildItemStatusService(
            childId: widget.child.id,
            checkForMissingItems: false,
            updateMask: FieldMask(paths: ["check_for_missing_items"]));
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("忘れ物の有無の更新に失敗: $e");
      }
    }
  }

  Future<void> _updateHasItemStatus(String itemName, bool hasItem) async {
    try {
      setState(() {
        _isLoading = true;
      });
      List<String> updateMaskName = [];
      switch (itemName) {
        case "かばん":
          updateMaskName = ["has_bag"];
          break;
        case "お弁当":
          updateMaskName = ["has_lunch_box"];
          break;
        case "水筒":
          updateMaskName = ["has_water_bottle"];
          break;
        case "傘":
          updateMaskName = ["has_umbrella"];
          break;
      }

      await updateChildItemStatusService(
        childId: widget.child.id,
        hasBag: itemName == "かばん" ? !hasItem : null,
        hasLunchBox: itemName == "お弁当" ? !hasItem : null,
        hasWaterBottle: itemName == "水筒" ? !hasItem : null,
        hasUmbrella: itemName == "傘" ? !hasItem : null,
        updateMask: FieldMask(paths: updateMaskName),
      );

      if (mounted) {
        setState(() {
          _hasItem = !_hasItem;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("持ち物の状態の更新に失敗: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: _hasItem ? Colors.green[100] : Colors.red[100],
        borderRadius: BorderRadius.circular(5),
        elevation: 5,
        child: InkWell(
            onTap: () async {
              if (!_isLoading) {
                await _updateHasItemStatus(widget.itemName, _hasItem);
              }
            },
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.24,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 8.0),
                    child: Row(
                      children: [
                        statusFieldIcon(_hasItem),
                        const SizedBox(width: 8),
                        Text(
                          widget.itemName,
                          style: statusFieldTextStyle(_hasItem),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )))));
  }

  Widget statusFieldIcon(bool hasItem) {
    return SizedBox(
      width: 20,
      child: _isLoading
          ? const SizedBox(
              width: 5,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.grey,
              ))
          : _hasItem
              ? const Icon(Icons.check, color: Colors.green)
              : const Icon(Icons.error_outline, color: Colors.red),
    );
  }
}
