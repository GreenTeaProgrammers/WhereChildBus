
import 'package:flutter/material.dart';
import 'package:where_child_bus/components/guardian_list/guardian_list_element/guardian_list_element.dart';
import 'package:where_child_bus/pages/student_list_page/student_detail_sheet.dart';

class GuardianList extends StatefulWidget {
  final List<String> guardianNames;
  final List<String> groupNames;
  final VoidCallback? callback;

  const GuardianList({
    Key? key,
    required this.guardianNames,
    required this.groupNames,
    this.callback,
  }) : super(key: key);

  @override
  _GuardiansListState createState() => _GuardiansListState();
}

class _GuardiansListState extends State<GuardianList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.guardianNames.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 20, color: Colors.transparent),
      itemBuilder: (BuildContext context, int index) => guardianListElement(context, index),
    );
  }

  Widget guardianListElement(BuildContext context, int index) {
    return GuardianListElement(
      title: widget.guardianNames[index],
      subtitle: widget.groupNames[index],
      // imagePath: "assets/images/face_${widget.images[index]}.png",
    );
  }
}
