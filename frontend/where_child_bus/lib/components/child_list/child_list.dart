import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/element/child_list_element.dart';
import 'package:where_child_bus/pages/student_list_page/child_detail_sheet.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class ChildList extends StatefulWidget {
  final List<Child> children;
  final List<ChildPhoto> images;
  final VoidCallback? callback;

  const ChildList({
    Key? key,
    required this.children,
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
      itemCount: widget.children.length,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 20, color: Colors.transparent),
      itemBuilder: (BuildContext context, int index) =>
          _createChildListElements(context, index),
    );
  }

  Widget _createChildListElements(BuildContext context, int index) {
    return ChildListElement(
        title: widget.children[index].name,
        subtitle: "${widget.children[index].age.toString()}歳",
        image: widget.images[index],
        onTap: () {
          if (widget.callback == null) {
            childDetailModal(index);
          } else {
            widget.callback!();
          }
        });
  }

  Future<void> childDetailModal(int index) async {
    await showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StudentDetailSheet(
            child: widget.children[index],
            image: widget.images[index],
          );
        });
  }
}
