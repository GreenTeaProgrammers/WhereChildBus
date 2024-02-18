import "package:flutter/material.dart";
import "package:where_child_bus/components/child_list/element/child_list_element_with_mark.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

class ChildListWithMark extends StatefulWidget {
  final List<String> childNames;
  final List<String> groupNames;
  final List<ChildPhoto> images;
  final VoidCallback? callback;

  const ChildListWithMark({
    Key? key,
    required this.childNames,
    required this.groupNames,
    required this.images,
    this.callback,
  }) : super(key: key);

  @override
  _ChildListWithMarkState createState() => _ChildListWithMarkState();
}

class _ChildListWithMarkState extends State<ChildListWithMark> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.childNames.length,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 20, color: Colors.transparent),
      itemBuilder: (BuildContext context, int index) =>
          childListElement(context, index),
    );
  }

  Widget childListElement(BuildContext context, int index) {
    return ChildListElementWithMark(
        title: widget.childNames[index],
        subtitle: widget.groupNames[index],
        image: widget.images[index],
        onTap: () {
          widget.callback!();
        });
  }
}
