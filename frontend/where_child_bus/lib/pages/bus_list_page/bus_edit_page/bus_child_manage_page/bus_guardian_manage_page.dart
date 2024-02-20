import "dart:developer" as developer;
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:where_child_bus/components/guardian_list/guardian_list.dart";
import "package:where_child_bus/models/nursery_data.dart";
import "package:where_child_bus/models/nursery_guardian_data.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart";
import "package:where_child_bus/service/get_guardian_list_by_nursery_id.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

class BusGuardianManagePage extends StatefulWidget {
  final Bus? bus;

  const BusGuardianManagePage({Key? key, this.bus}) : super(key: key);

  @override
  _BusGuardianManagePageState createState() => _BusGuardianManagePageState();
}

class _BusGuardianManagePageState extends State<BusGuardianManagePage> {
  // サンプルデータのリスト
  final List<String> morningGuardianNames = [
    '保護者1',
    '保護者2',
    '保護者3',
    '保護者4',
    '保護者5',
    '保護者6',
    '保護者7',
    '保護者8',
    '保護者9',
    '保護者10',
    '保護者11',
    '保護者12',
    '保護者13',
    '保護者14',
    '保護者15',
    '保護者16',
    '保護者17',
    '保護者18',
    '保護者19',
    '保護者20',
  ];

  final List<String> eveningGuardianNames = [
    '保護者1',
    '保護者2',
    '保護者3',
    '保護者4',
    '保護者5',
    '保護者6',
    '保護者7',
    '保護者8',
    '保護者9',
    '保護者10',
    '保護者11',
    '保護者12',
    '保護者13',
    '保護者14',
    '保護者15',
    '保護者16',
    '保護者17',
    '保護者18',
    '保護者19',
    '保護者20',
  ];

  final List<String> morningGroupNames = [
    'グループA',
    'グループB',
    'グループC',
    'グループD',
    'グループE',
    'グループF',
    'グループG',
    'グループH',
    'グループI',
    'グループJ',
    'グループK',
    'グループL',
    'グループM',
    'グループN',
    'グループO',
    'グループP',
    'グループQ',
    'グループR',
    'グループS',
    'グループT',
  ];

  final List<String> eveningGroupNames = [
    'グループA',
    'グループB',
    'グループC',
    'グループD',
    'グループE',
    'グループF',
    'グループG',
    'グループH',
    'グループI',
    'グループJ',
    'グループK',
    'グループL',
    'グループM',
    'グループN',
    'グループO',
    'グループP',
    'グループQ',
    'グループR',
    'グループS',
    'グループT',
  ];

  bool _isLoading = false;
  bool _isFailLoading = false;
  List<GuardianResponse> morningGuardians = [];
  List<GuardianResponse> eveningGuardians = [];
  List<GuardianResponse> morningSelectedGuardians = [];
  List<GuardianResponse> eveningSelectedGuardians = [];
  List<String> morningAddedGuardians = [];
  List<String> eveningAddedGuardians = [];

  @override
  void initState() {
    super.initState();
    _loadGuardians();
  }

  Future<void> _loadGuardians() async {
    _isLoading = true;

    if (NurseryGuardianData().getGuardianList().isNotEmpty) {
      if (mounted) {
        setState(() {
          morningGuardians = NurseryGuardianData().getGuardianList();
          eveningGuardians = NurseryGuardianData().getGuardianList();
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
        setState(() => {_isLoading = false, _isFailLoading = true});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: pageAppBar(),
        body: pageBody(),
      ),
    );
  }

  AppBar pageAppBar() {
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

  Widget pageBody() {
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
                morningGuardianList(),
                eveningGuardianList(),
              ],
            ),
          ),
          SizedBox(height: 100, child: ConfirmButton(buttonText: "保存")),
        ],
      );
    }
  }

  Widget morningGuardianList() {
    return GuardianList(
        guardians: morningGuardians,
        selectedGuardians: morningSelectedGuardians);
  }

  Widget eveningGuardianList() {
    return GuardianList(
        guardians: eveningGuardians,
        selectedGuardians: eveningSelectedGuardians);
  }
}
