import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/child_list.dart';
import 'package:where_child_bus/pages/student_list_page/student_detail_sheet.dart';
import 'package:where_child_bus/pages/student_list_page/student_edit_page.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class ChildListPage extends StatefulWidget {
  final NurseryResponse nursery;

  const ChildListPage({super.key, required this.nursery});

  @override
  State<ChildListPage> createState() => _ChildListPageState();
}

class _ChildListPageState extends State<ChildListPage> {
  //TODO: 将来的には動的にデータを受け取る。
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
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ChildList(
        childNames: name,
        groupNames: group,
        images: image,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const StudentEditPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
