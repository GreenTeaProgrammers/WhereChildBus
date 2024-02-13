import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/element/child_list_element.dart';

// ChildListElementを再利用する新しいStatefulWidgetクラス
class ChildListElementWithMark extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback? onTap;
  final Widget mark; // マークを表示するためのウィジェット

  const ChildListElementWithMark({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onTap,
    required this.mark,
  }) : super(key: key);

  @override
  _ChildListElementWithMarkState createState() => _ChildListElementWithMarkState();
}

class _ChildListElementWithMarkState extends State<ChildListElementWithMark> {
  @override
  Widget build(BuildContext context) {
    // ChildListElementを再利用して、actionButtonとしてmarkを渡す
    return ChildListElement(
      title: widget.title,
      subtitle: widget.subtitle,
      imagePath: widget.imagePath,
      onTap: widget.onTap,
      actionButton: Padding(
        padding: const EdgeInsets.only(left: 16), // マークと他の要素との間隔を調整
        child: widget.mark,
      ),
    );
  }
}
