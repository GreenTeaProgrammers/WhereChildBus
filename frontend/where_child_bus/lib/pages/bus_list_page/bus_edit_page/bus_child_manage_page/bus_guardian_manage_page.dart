import "package:flutter/material.dart";
import "package:where_child_bus/components/guardian_list/guardian_list.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart";

class BusGuardianManagePage extends StatefulWidget {
  @override
  _BusGuardianManagePageState createState() => _BusGuardianManagePageState();  
}

class _BusGuardianManagePageState extends State<BusGuardianManagePage> {
  // サンプルデータのリスト
  final List<String> morningGuardianNames = ['保護者1', '保護者2', '保護者3'];
  final List<String> eveningGuardianNames = ['保護者1', '保護者2', '保護者3'];
  final List<String> morningGroupNames = ['グループA', 'グループB', 'グループC'];
  final List<String> eveningGroupNames = ['グループA', 'グループB', 'グループC'];
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