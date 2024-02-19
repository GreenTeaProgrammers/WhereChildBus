import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/child_list_with_button.dart';
import 'package:where_child_bus/components/child_list/element/child_list_element.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class ChildListElementWithButton extends StatefulWidget {
  final String childName;
  final String groupName;
  final ChildPhoto image;
  final VoidCallback? onTap;
  final VoidCallback? onButtonTap;
  final ButtonIconType buttonIconType;

  ChildListElementWithButton({
    Key? key,
    required this.childName,
    required this.groupName,
    required this.image,
    this.onTap,
    this.onButtonTap,
    this.buttonIconType = ButtonIconType.add, // デフォルト値を提供
  }) : super(key: key);

  @override
  _ChildListElementWithButtonState createState() =>
      _ChildListElementWithButtonState();
}

class _ChildListElementWithButtonState
    extends State<ChildListElementWithButton> {
  ButtonIconType? currentButtonType;

  @override
  void initState() {
    super.initState();
    currentButtonType = widget.buttonIconType; // 初期アイコンタイプを設定
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          ChildListElement(
            title: widget.childName,
            subtitle: widget.groupName,
            image: widget.image,
            onTap: widget.onTap,
          ),
          Positioned(
            right: 25,
            bottom: 2,
            child: IconButton(
              icon: Icon(
                currentButtonType == ButtonIconType.add
                    ? Icons.add
                    : Icons.remove,
                // アイコンの色を動的に変更
                color: currentButtonType == ButtonIconType.add
                    ? Colors.green
                    : Colors.red,
                size: 50.0, // アイコンサイズの指定もここで行う
              ),
              onPressed: () {
                if (widget.onButtonTap != null) {
                  widget.onButtonTap!();
                }
                // アイコンタイプの切り替え
                setState(() {
                  currentButtonType = currentButtonType == ButtonIconType.add
                      ? ButtonIconType.remove
                      : ButtonIconType.add;
                });
              },
              // IconButton自体の色指定は不要になるため削除
            ),
          ),
        ],
      ),
    );
  }
}
