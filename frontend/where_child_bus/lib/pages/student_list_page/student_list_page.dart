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
          onTap: () {
            showBottomSheet(context, index);
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

  Widget childImageAndChildName(int index) {
    return Row(children: <Widget>[
      childFaceImage(index),
      const SizedBox(
        width: 50,
      ),
      Text(name[index],
          style: const TextStyle(color: Colors.black, fontSize: 24)),
    ]);
  }

  Widget childDetailInfo(String title, String element) {
    return Row(
      children: <Widget>[
        detailTitle(title),
        const SizedBox(
          width: 50,
        ),
        Text(element, style: TextStyle(color: Colors.black, fontSize: 18))
      ],
    );
  }

  Widget detailTitle(String title) {
    return SizedBox(
      width: 18 * 6 + 6,
      child: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
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
                    childImageAndChildName(index),
                  ]),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        childDetailInfo("年齢", "3歳"),
                        childDetailInfo("クラス", group[index]),
                        childDetailInfo("保護者氏名", "保護者1"),
                        childDetailInfo("保護者連絡先", "xxx-xxxx-xxxx"),
                        childDetailInfo("利用コース", "○○コース"),
                        childDetailInfo("乗降場所", "○○駐車場前"),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
