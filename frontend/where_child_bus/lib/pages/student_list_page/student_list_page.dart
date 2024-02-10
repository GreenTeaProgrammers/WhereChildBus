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
    final List<String> image = <String>[
      "1",
      "2",
      "1",
      "1",
      "2",
    ];

    var screenSize = MediaQuery.of(context).size;

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
                        childImage(image[index]),
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        nameAndGroup(name[index], group[index], screenSize),
                      ]))));
        });
  }

  Widget childImage(String image) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset("assets/images/face_${image}.png"));
  }

  Widget nameAndGroup(String name, String group, Size size) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(color: Colors.black, fontSize: 24)),
          Text(
            group,
            style: TextStyle(color: Colors.black),
          ),
          place(),
        ]);
  }

  Widget place() {
    return Row(children: <Widget>[
      Icon(Icons.location_on),
      Text("停留所名"),
    ]);
  }
}
