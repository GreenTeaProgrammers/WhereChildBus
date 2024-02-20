import 'package:flutter/material.dart';
import 'package:where_child_bus/components/guardian_list/guardian_list_element/guardian_list_element.dart';
import 'package:where_child_bus/components/guardian_list/guardian_list_element/selected_guardian_list_element.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class GuardianList extends StatefulWidget {
  final VoidCallback? callback;

  final List<GuardianResponse> guardians;
  final List<GuardianResponse> selectedGuardians;

  const GuardianList({
    Key? key,
    required this.guardians,
    required this.selectedGuardians,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: calculateAddedGuardiansHeight(),
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) =>
                  onReorder(oldIndex, newIndex),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: widget.selectedGuardians.map((item) {
                int index = widget.selectedGuardians.indexOf(item);
                return SelectedGuardianListElement(
                  key: ValueKey(item),
                  title: item.name,
                  subtitle: "サブタイトル ${index + 1}",
                  order: index + 1,
                  onButtonPressed: () => removeGuardians(index),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 15),
          for (int index = 0; index < widget.guardians.length; index++)
            guardianListElement(context, index),
        ],
      ),
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = widget.selectedGuardians.removeAt(oldIndex);
      widget.selectedGuardians.insert(newIndex, item);
    });
  }

  double calculateAddedGuardiansHeight() {
    // 項目の高さ、項目間のスペース、その他のマージンなどを考慮して高さを計算
    double itemHeight = 110.0;
    int itemCount = widget.selectedGuardians.length;
    return itemHeight * itemCount;
  }

  Widget addedGuardiansListViewContent() {
    return ListView.builder(
      itemCount: widget.selectedGuardians.length,
      itemBuilder: (context, index) {
        String item = widget.selectedGuardians[index].name;
        // 追加された保護者リストの項目を構築
        return SelectedGuardianListElement(
          title: item,
          subtitle: "サブタイトル",
          order: index + 1,
          onButtonPressed: () => removeGuardians(index),
        );
      },
    );
  }

  Widget unSelectedGuardiansListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.guardians.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 20, color: Colors.transparent),
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
    double actualHeight = widget.selectedGuardians.length * itemHeight;

    double listViewHeight = actualHeight > maxHeight ? maxHeight : actualHeight;

    return SizedBox(
      height: listViewHeight, // ReorderableListViewの高さを100に設定
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = widget.selectedGuardians.removeAt(oldIndex);
            widget.selectedGuardians.insert(newIndex, item);
          });
        },
        children: widget.selectedGuardians.asMap().entries.map((entry) {
          int index = entry.key;
          String item = entry.value.name;
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
      title: widget.guardians[index].name,
      subtitle: widget.guardians[index].phoneNumber,
      onButtonPressed: () => addGuardians(index),
    );
  }

  void addGuardians(int index) {
    setState(() {
      var selected = widget.guardians.removeAt(index);
      widget.selectedGuardians.add(selected);
    });
  }

  void removeGuardians(int index) {
    setState(() {
      // 追加された保護者リストから保護者を取得し削除
      GuardianResponse removedGuardian =
          widget.selectedGuardians.removeAt(index);

      //戻すときは、先頭に配置
      widget.guardians.insert(0, removedGuardian);
    });
  }
}
