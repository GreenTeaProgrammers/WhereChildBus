import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/child_list_with_button.dart';

class BusChildManagePage extends StatefulWidget {
  @override
  _BusChildManagePageState createState() => _BusChildManagePageState();
}

class _BusChildManagePageState extends State<BusChildManagePage> {
  final List<String> name = [
    "園児1",
    "園児2",
    "園児3",
    "園児4",
    "園児5",
  ];

  final List<String> group = [
    "1組",
    "2組",
    "3組",
    "4組",
    "5組",
  ];

  final List<String> image = [
    "1",
    "2",
    "1",
    "1",
    "2",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("子供の管理"),
        backgroundColor: Colors.white,
      ),
      body: pageBody(),
    );
  }

  Widget pageBody() {
    // ChildListWithButton ウィジェットを使用してリストを表示
    // return ChildListWithButton(
    //   childNames: name,
    //   groupNames: group,
    //   images: image,
    //   callback: () {
    //     // ここでリストアイテムがタップされたときの動作を定義
    //     print("リストアイテムがタップされました");
    //   },
    //   buttonIconTypes: List<ButtonIconType>.generate(name.length, (index) {
    //   // ここで条件に基づいてアイコンタイプを決定するロジックを追加できる
    //   // 例として、すべてのアイテムに対して 'add' アイコンを設定
    //     return ButtonIconType.add;
    // }),
    // );

    return Container();
  }
}
