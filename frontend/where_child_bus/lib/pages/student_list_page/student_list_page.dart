import 'package:flutter/material.dart';

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
              child: InkWell(
                  onTap: () {
                    showBottomSheet(context, index);
                  },
                  child: Card(
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: <Widget>[
                            childImage(index),
                            SizedBox(
                              width: screenSize.width * 0.05,
                            ),
                            nameAndGroup(index),
                          ])))));
        });
  }

  Widget childImage(int index) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset("assets/images/face_${image[index]}.png"));
  }

  Widget nameAndGroup(int index) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name[index],
              style: TextStyle(color: Colors.black, fontSize: 24)),
          Text(
            group[index],
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

  Widget detail(String element) {
    return Text(element, style: TextStyle(color: Colors.black, fontSize: 18));
  }

  void showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: const EdgeInsets.all(30.0),
              height: 1000,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        onPressed: () {},
                        child: Icon(Icons.edit),
                      ),
                    ),
                    Row(children: <Widget>[
                      childImage(index),
                      SizedBox(
                        width: 50,
                      ),
                      Text(name[index],
                          style: TextStyle(color: Colors.black, fontSize: 24)),
                    ]),
                  ]),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        detail("年齢: "),
                        detail("クラス: ${group[index]}"),
                        detail("保護者氏名: "),
                        detail("保護者連絡先: "),
                        detail("利用コース: "),
                        detail("乗降場所: "),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
