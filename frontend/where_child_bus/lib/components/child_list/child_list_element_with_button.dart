import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/child_list_element.dart';

// ChildListElementWithButtonクラスの定義
class ChildListElementWithButton extends ChildListElement {
  final VoidCallback? onButtonTap;

  const ChildListElementWithButton({
    Key? key,
    required String childName,
    required String groupName,
    required String image,
    required Size screenSize,
    VoidCallback? onTap,
    this.onButtonTap,
  }) : super(
          key: key,
          childName: childName,
          groupName: groupName,
          image: image,
          screenSize: screenSize,
          onTap: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        super.build(context), // 親クラスのbuildメソッドを呼び出す
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            mini: true,
            child: Icon(Icons.edit),
            onPressed: onButtonTap,
          ),
        ),
      ],
    );
  }
}