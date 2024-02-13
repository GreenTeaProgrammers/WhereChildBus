import 'package:flutter/material.dart';
import 'package:where_child_bus/components/utils/child_list.dart';

class BusChildManagePage extends StatefulWidget {
  // final List<String> childNames;
  // final List<String> groupNames;
  // final List<String> images;


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

  // BusChildManagePage({required this.childNames, required this.groupNames, required this.images});

  @override
  _BusChildManagePage createState() => _BusChildManagePage(childNames: name, groupNames: group, images: image);
}

class _BusChildManagePage extends State<BusChildManagePage> {
  final List<String> childNames;
  final List<String> groupNames;
  final List<String> images;
  _BusChildManagePage({required this.childNames, required this.groupNames, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppBar(),
      body: pageBody(),
    ); 
  }

  pageAppBar() {
    return AppBar(
      title: const Text("子供の管理"),
      backgroundColor: Colors.white,
    );
  }

  Widget pageBody() {
    return ChildList(childNames: childNames, groupNames: groupNames, images: images);
  }
}