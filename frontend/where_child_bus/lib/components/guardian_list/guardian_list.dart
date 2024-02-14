import 'package:flutter/material.dart';
import 'package:where_child_bus/components/guardian_list/guardian_list_element/guardian_list_element.dart';
import 'package:where_child_bus/components/guardian_list/guardian_list_element/selected_guardian_list_element.dart';

class GuardianList extends StatefulWidget {
  final List<String> guardianNames;
  final List<String> groupNames;
  final List<String> addedGuardians;
  final VoidCallback? callback;

  const GuardianList({
    Key? key,
    required this.guardianNames,
    required this.groupNames,
    required this.addedGuardians,
    this.callback,
  }) : super(key: key);

  @override
  _GuardiansListState createState() => _GuardiansListState();
}

class _GuardiansListState extends State<GuardianList> {

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return Column(
      children: [
        addedGuardiansListView(),
        const SizedBox(height: 15,),
        unSelectedGuardiansListView(),
      ],
    );
  }

  Widget unSelectedGuardiansListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.guardianNames.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 20, color: Colors.transparent),
        itemBuilder: (BuildContext context, int index) {
          // orderIndexesに基づいて項目を表示
          return guardianListElement(context, index);
        },
      ),
    );
  }

Widget addedGuardiansListView() {
  double screenHeight = MediaQuery.of(context).size.height;
  double maxHeight = screenHeight * 0.5;

  double itemHeight = 110.0;
  double actualHeight = widget.addedGuardians.length * itemHeight;

  double listViewHeight = actualHeight > maxHeight ? maxHeight : actualHeight;

  return SizedBox(
    height: listViewHeight, // ReorderableListViewの高さを100に設定
    child: ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = widget.addedGuardians.removeAt(oldIndex);
          widget.addedGuardians.insert(newIndex, item);
        });
      },
      children: widget.addedGuardians.asMap().entries.map((entry) {
        int index = entry.key;
        String item = entry.value;
        return SelectedGuardianListElement(
          key: ValueKey(item), // 一意のキーを指定
          title: item, // 保護者の名前
          subtitle: "サブタイトル",
          order: index + 1, // 順序番号（1から始まるように+1をしている）
          onButtonPressed: () => removeGuardians(index),
        );
      }).toList(),
    ),
  );
}


  Widget guardianListElement(BuildContext context, int index) {
    return GuardianListElement(
      title: widget.guardianNames[index],
      subtitle: widget.groupNames[index],
      onButtonPressed: () => addGuardians(index),
    );
  }
  
  void addGuardians(int index) {
    setState(() {
      widget.addedGuardians.add(widget.guardianNames[index]);
      widget.groupNames.removeAt(index);
      widget.guardianNames.removeAt(index);
    });
  }

  void removeGuardians(int index) {
  setState(() {
    // 追加された保護者リストから保護者を取得し削除
    String removedGuardian = widget.addedGuardians.removeAt(index);

    //戻すときは、先頭に配置
    widget.guardianNames.insert(0, removedGuardian);
    
    // groupNamesへの追加も必要ですが、どのグループに所属していたかの情報が必要
    widget.groupNames.add("ダミーグループ");
  });
}

}
