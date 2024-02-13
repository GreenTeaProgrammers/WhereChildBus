import "package:flutter/material.dart";
import "package:where_child_bus/app.dart";
import "package:where_child_bus/components/child_list/child_list.dart";

class BusPassengerPage extends StatefulWidget {
  final List<String> name = <String>[
    "園児1",
    "園児2",
    "園児3",
    "園児4",
    "園児5",
  ];
  final List<String> group = <String>[
    "1組",
    "2組",
    "3組",
    "4組",
    "5組",
  ];
  final List<String> image = <String>[
    "1",
    "2",
    "1",
    "1",
    "2",
  ];

  @override
  _BusPassengerPage createState() => _BusPassengerPage();
}

class _BusPassengerPage extends State<BusPassengerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppBar(),
      body:pageBody(),
    );
  }

  AppBar pageAppBar() {
    return AppBar(
      title: const Text("乗客情報"),
    );
  }

  Widget pageBody() {
    return ChildList(childNames: widget.name, groupNames: widget.group, images: widget.image);
  }
}