import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import 'package:collection/collection.dart';
import "package:flutter/material.dart";
import "package:where_child_bus/components/guardian_list/guardian_list.dart";
import "package:where_child_bus/models/nursery_data.dart";
import "package:where_child_bus/models/nursery_guardian_data.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart";
import "package:where_child_bus/service/get_guardian_list_by_nursery_id.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

class BusGuardianManagePage extends StatefulWidget {
  final Bus? bus;
  final List<String>? morningSelectedGuardiansId;
  final List<String>? eveningSelectedGuardiansId;

  const BusGuardianManagePage(
      {Key? key,
      this.bus,
      this.morningSelectedGuardiansId,
      this.eveningSelectedGuardiansId})
      : super(key: key);

  @override
  _BusGuardianManagePageState createState() => _BusGuardianManagePageState();
}

class _BusGuardianManagePageState extends State<BusGuardianManagePage> {
  bool _isLoading = false;
  bool _isFailLoading = false;
  List<GuardianResponse> morningGuardians = [];
  List<GuardianResponse> eveningGuardians = [];
  List<GuardianResponse> morningSelectedGuardians = [];
  List<GuardianResponse> eveningSelectedGuardians = [];

  @override
  void initState() {
    super.initState();
    _loadGuardians();
  }

  void _setSelectedGuardians() {
    if (widget.morningSelectedGuardiansId != null) {
      morningSelectedGuardians = widget.morningSelectedGuardiansId!
          .map((id) => morningGuardians
              .firstWhereOrNull((guardian) => guardian.id == id))
          .where((element) => element != null)
          .cast<GuardianResponse>()
          .toList();

      morningGuardians.removeWhere((guardian) =>
          widget.morningSelectedGuardiansId!.contains(guardian.id));
    }

    if (widget.eveningSelectedGuardiansId != null) {
      eveningSelectedGuardians = widget.eveningSelectedGuardiansId!
          .map((id) => eveningGuardians
              .firstWhereOrNull((guardian) => guardian.id == id))
          .where((element) => element != null)
          .cast<GuardianResponse>()
          .toList();

      eveningGuardians.removeWhere((guardian) =>
          widget.eveningSelectedGuardiansId!.contains(guardian.id));
    }
  }

  Future<void> _loadGuardians() async {
    _isLoading = true;

    if (NurseryGuardianData().getGuardianList().isNotEmpty) {
      if (mounted) {
        setState(() {
          morningGuardians = NurseryGuardianData().getGuardianList();
          eveningGuardians = NurseryGuardianData().getGuardianList();
          _setSelectedGuardians();
          _isLoading = false;
        });
      }
      return;
    } else {
      try {
        var res = await getGuardianListByNurseryIdService(
            NurseryData().getNursery().id);
        NurseryGuardianData().setGuardianListResponse(res);
        setState(() {
          morningGuardians = NurseryGuardianData().getGuardianList();
          eveningGuardians = NurseryGuardianData().getGuardianList();
          _isLoading = false;
        });
      } catch (e) {
        if (kDebugMode) {
          developer.log("保護者リストのロード中にエラーが発生しました: $e");
        }
        setState(() => {
              _setSelectedGuardians(),
              _isLoading = false,
              _isFailLoading = true
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _createPageAppBar(),
        body: _createPageBody(),
      ),
    );
  }

  AppBar _createPageAppBar() {
    return AppBar(
        bottom: const TabBar(
      tabs: [
        Tab(
          text: "昼",
        ),
        Tab(
          text: "夜",
        ),
      ],
    ));
  }

  Widget _createPageBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_isFailLoading) {
      return const Center(
        child: Text("データの取得に失敗しました"),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: TabBarView(
              children: [
                _createMorningGuardianList(),
                _createEveningGuardianList(),
              ],
            ),
          ),
          SizedBox(
              height: 100,
              child: ConfirmButton(
                buttonText: "保存",
                onTap: () => {
                  Navigator.pop(context, {
                    "morning": morningSelectedGuardians,
                    "evening": eveningSelectedGuardians
                  }),
                },
              )),
        ],
      );
    }
  }

  Widget _createMorningGuardianList() {
    return GuardianList(
        guardians: morningGuardians,
        selectedGuardians: morningSelectedGuardians);
  }

  Widget _createEveningGuardianList() {
    return GuardianList(
        guardians: eveningGuardians,
        selectedGuardians: eveningSelectedGuardians);
  }
}
