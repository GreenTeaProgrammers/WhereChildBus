import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/element/child_list_element.dart';

enum ButtonIconType { add, remove }

class ChildListWithButton extends StatefulWidget {
  final List<String> childNames;
  final List<String> groupNames;
  final List<String> images;
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
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 20, color: Colors.transparent),
      itemBuilder: (BuildContext context, int index) => ChildListElementWithButton(widget: widget, context: context, index: index),
    );
  }
}

class ChildListElementWithButton extends StatelessWidget {
  const ChildListElementWithButton({
    super.key,
    required this.widget,
    required this.context,
    required this.index,
  });

  final ChildListWithButton widget;
  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
    // 各アイテムに対応するボタンアイコンタイプを取得
    ButtonIconType buttonIconType = widget.buttonIconTypes[index];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          ChildListElement(
            title: widget.childNames[index],
            subtitle: widget.groupNames[index],
            imagePath: "assets/images/face_${widget.images[index]}.png",
            onTap: widget.callback,
          ),
          Positioned(
            right: 4,
            bottom: 4,
            child: IconButton(
              icon: Icon(buttonIconType == ButtonIconType.add ? Icons.add : Icons.remove),
              onPressed: () {
                // ここにボタンタップ時のアクションを実装
              },
              color: Theme.of(context).primaryColor,
              iconSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
