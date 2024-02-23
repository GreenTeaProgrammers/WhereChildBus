import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'components/utils/input_form_body.dart';

class StudentEditPage extends StatefulWidget {
  final Child? child;
  final ChildPhoto? childPhoto;
  final bool isEdit;

  const StudentEditPage(
      {super.key, this.child, this.childPhoto, required this.isEdit});

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  List<GuardianResponse> guardiansList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: InputFormBody(
          child: widget.child,
          isEdit: widget.isEdit,
        ),
      ),
    );
  }
}
