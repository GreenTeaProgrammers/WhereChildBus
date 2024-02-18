import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'components/utils/input_form_body.dart';

class StudentEditPage extends StatefulWidget {
  final Child? child;

  const StudentEditPage({super.key, this.child});

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  List<GuardianResponse> guardiansList = [];
  final List<String> busName = <String>["バス1", "バス2", "バス3"];
  final List<String> busStop = <String>["停留所1", "停留所2", "停留所3"];

  @override
  void initState() {
    super.initState();
    _loadGuardians();
  }

  Future<void> _loadGuardians() async {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: InputFormBody(
          busName: busName,
          busStop: busStop,
        ),
      ),
    );
  }
}
