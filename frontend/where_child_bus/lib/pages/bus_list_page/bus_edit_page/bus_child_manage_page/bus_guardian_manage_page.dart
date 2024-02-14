import "package:flutter/material.dart";
import "package:where_child_bus/components/guardian_list/guardian_list.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart";

class BusGuardianManagePage extends StatefulWidget {
  @override
  _BusGuardianManagePageState createState() => _BusGuardianManagePageState();  
}

class _BusGuardianManagePageState extends State<BusGuardianManagePage> {
  // サンプルデータのリスト
  final List<String> guardianNames = ['保護者1', '保護者2', '保護者3'];
  final List<String> groupNames = ['グループA', 'グループB', 'グループC'];

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
        ConfirmButton(buttonText: "保存"),
      ],
    );
  }

  Widget morningGuardianList() {
    return GuardianList(guardianNames: guardianNames, groupNames: groupNames);
  }

  Widget eveningGuardianList() {
    return GuardianList(guardianNames: guardianNames, groupNames: groupNames);
  }
}