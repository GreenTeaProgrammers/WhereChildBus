import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/student_list_page/student_detail_sheet.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
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

    return childCardListBuilder(screenSize);
  }

  Widget childCardListBuilder(Size screenSize) {
    return ListView.separated(
        itemCount: name.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 20,
            color: Colors.transparent,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return childCardListInner(index, screenSize);
        });
  }

  Widget childCardListInner(int index, Size screenSize) {
    return FractionallySizedBox(
        widthFactor: 0.8,
        child: InkWell(
          onTap: () async {
            await showBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return StudentDetailSheet(childName: name[index]);
                });
          },
          child: childCard(index, screenSize),
        ));
  }

  Widget childCard(int index, Size screenSize) {
    return Card(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: childFaceImageNameAndGroupName(index, screenSize)));
  }

  Widget childFaceImageNameAndGroupName(int index, Size screenSize) {
    return Row(children: <Widget>[
      childFaceImage(index),
      SizedBox(
        width: screenSize.width * 0.05,
      ),
      childNameAndGroupName(index),
    ]);
  }

  Widget childFaceImage(int index) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset("assets/images/face_${image[index]}.png"));
  }

  Widget childNameAndGroupName(int index) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name[index],
              style: const TextStyle(color: Colors.black, fontSize: 24)),
          Text(
            group[index],
            style: const TextStyle(color: Colors.black),
          ),
          busStopName(),
        ]);
  }

  Widget busStopName() {
    return const Row(children: <Widget>[
      Icon(Icons.location_on),
      Text("停留所名"),
    ]);
  }
}
