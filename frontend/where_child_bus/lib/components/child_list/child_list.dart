import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/element/child_list_element.dart';
import 'package:where_child_bus/pages/student_list_page/student_detail_sheet.dart';

class ChildList extends StatefulWidget {
  final List<String> childNames;
  final List<String> groupNames;
  final List<String> images;
  final VoidCallback? callback;

  const ChildList({
    Key? key,
    required this.childNames,
    required this.groupNames,
    required this.images,
    this.callback,
  }) : super(key: key);

  @override
  _ChildListState createState() => _ChildListState();
}

class _ChildListState extends State<ChildList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.childNames.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 20, color: Colors.transparent),
      itemBuilder: (BuildContext context, int index) => childListElement(context, index),
    );
  }

  Widget childListElement(BuildContext context, int index) {
    return ChildListElement(
      title: widget.childNames[index],
      subtitle: widget.groupNames[index],
      imagePath: "assets/images/face_${widget.images[index]}.png",
      onTap: () {
        if (widget.callback == null) {
          childDetailModal(index);
        } else {
          widget.callback!();
        }
      }
    );
  }

  childDetailModal(int index) async{
    await showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StudentDetailSheet(childName: widget.childNames[index]);
        });
  }
}