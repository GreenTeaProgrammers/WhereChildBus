import "package:flutter/material.dart";
import "package:where_child_bus/components/guardian_list/guardian_list.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart";

class BusGuardianManagePage extends StatefulWidget {
  @override
  _BusGuardianManagePageState createState() => _BusGuardianManagePageState();  
}

class _BusGuardianManagePageState extends State<BusGuardianManagePage> {
  // サンプルデータのリスト
  final List<String> morningGuardianNames = [
    '保護者1', '保護者2', '保護者3', '保護者4', '保護者5',
    '保護者6', '保護者7', '保護者8', '保護者9', '保護者10',
    '保護者11', '保護者12', '保護者13', '保護者14', '保護者15',
    '保護者16', '保護者17', '保護者18', '保護者19', '保護者20',
  ];

  final List<String> eveningGuardianNames = [
    '保護者1', '保護者2', '保護者3', '保護者4', '保護者5',
    '保護者6', '保護者7', '保護者8', '保護者9', '保護者10',
    '保護者11', '保護者12', '保護者13', '保護者14', '保護者15',
    '保護者16', '保護者17', '保護者18', '保護者19', '保護者20',
  ];

  final List<String> morningGroupNames = [
    'グループA', 'グループB', 'グループC', 'グループD', 'グループE',
    'グループF', 'グループG', 'グループH', 'グループI', 'グループJ',
    'グループK', 'グループL', 'グループM', 'グループN', 'グループO',
    'グループP', 'グループQ', 'グループR', 'グループS', 'グループT',
  ];

  final List<String> eveningGroupNames = [
    'グループA', 'グループB', 'グループC', 'グループD', 'グループE',
    'グループF', 'グループG', 'グループH', 'グループI', 'グループJ',
    'グループK', 'グループL', 'グループM', 'グループN', 'グループO',
    'グループP', 'グループQ', 'グループR', 'グループS', 'グループT',
  ];

  List<String> morningAddedGuardians = [];
  List<String> eveningAddedGuardians = [];


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
      bottom : const TabBar(
        tabs: [
          Tab(text: "昼",),
          Tab(text: "夜",),
        ],
      )
    );
  }

  Widget pageBody() {
    return  Column(
      children: [
        Expanded(
          child: TabBarView(
            children: [
              morningGuardianList(),
              eveningGuardianList(),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ConfirmButton(buttonText: "保存")
        ),
      ],
    );
  }

  Widget morningGuardianList() {
    return GuardianList(
      guardianNames: morningGuardianNames, 
      groupNames: morningGroupNames, 
      addedGuardians: morningAddedGuardians
    );
  }

  Widget eveningGuardianList() {
    return GuardianList(
      guardianNames: eveningGuardianNames, 
      groupNames: eveningGroupNames, 
      addedGuardians: eveningAddedGuardians
    );
  }
}