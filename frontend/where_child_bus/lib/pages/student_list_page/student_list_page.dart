import 'package:flutter/material.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
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

    return ListView.separated(
        itemCount: name.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 20,
            color: Colors.transparent,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return FractionallySizedBox(
              widthFactor: 0.8,
              child: Card(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(children: <Widget>[
                        childImage(),
                        SizedBox(
                          width: 30,
                        ),
                        nameAndGroup(name[index], group[index]),
                      ]))));
        });
  }

  Widget childImage() {
    return SizedBox(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.grey,
        ));
  }

  Widget nameAndGroup(String name, String group) {
    return SizedBox(
        width: 200,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name, style: TextStyle(color: Colors.black, fontSize: 24)),
              Text(
                group,
                style: TextStyle(color: Colors.black),
              ),
              place(),
            ]));
  }

  Widget place() {
    return Row(children: <Widget>[
      Text("乗降場所："),
      Text("停留所名"),
    ]);
  }
}
