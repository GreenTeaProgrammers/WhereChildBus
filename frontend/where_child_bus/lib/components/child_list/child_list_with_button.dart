import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/element/child_list_element_with_button.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

enum ButtonIconType { add, remove }

class ChildListWithButton extends StatefulWidget {
  final List<String> childNames;
  final List<String> groupNames;
  final List<ChildPhoto> images;
  final List<ButtonIconType> buttonIconTypes; // 各アイテムのボタンアイコンタイプ
  final VoidCallback? callback;

  ChildListWithButton({
    Key? key,
    required this.childNames,
    required this.groupNames,
    required this.images,
    required this.buttonIconTypes, // コンストラクタでボタンアイコンタイプを受け取る
    this.callback,
  }) : super(key: key);

  @override
  _ChildListWithButtonState createState() => _ChildListWithButtonState();
}

class _ChildListWithButtonState extends State<ChildListWithButton> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.childNames.length,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 20, color: Colors.transparent),
      itemBuilder: (BuildContext context, int index) {
        // ChildListElementWithButtonに必要な情報を渡す
        return ChildListElementWithButton(
          childName: widget.childNames[index],
          groupName: widget.groupNames[index],
          image: widget.images[index],
          buttonIconType: widget.buttonIconTypes[index], // 各アイテムに対応するアイコンタイプ
          onTap: () {
            // ここでリストアイテムがタップされたときの動作を定義
            print("${widget.childNames[index]}がタップされました");
          },
          onButtonTap: () {
            // ここでアイコンボタンがタップされたときの動作を定義
            print("${widget.childNames[index]}のボタンがタップされました");
          },
        );
      },
    );
  }
}
