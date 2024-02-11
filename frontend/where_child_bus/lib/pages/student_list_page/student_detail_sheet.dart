import 'package:flutter/material.dart';

class StudentDetailSheet extends StatelessWidget {
  final String childName;

  StudentDetailSheet({required this.childName});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30.0),
        height: 1000,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
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
              childImageAndChildName(),
            ]),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  childDetailInfo("年齢", "3歳"),
                  childDetailInfo("クラス", "1組"),
                  childDetailInfo("保護者氏名", "保護者1"),
                  childDetailInfo("保護者連絡先", "xxx-xxxx-xxxx"),
                  childDetailInfo("利用コース", "○○コース"),
                  childDetailInfo("乗降場所", "○○駐車場前"),
                ],
              ),
            ),
          ],
        ));
  }

  Widget childImageAndChildName() {
    return Row(children: <Widget>[
      childFaceImage(),
      const SizedBox(
        width: 50,
      ),
      Text(childName,
          style: const TextStyle(color: Colors.black, fontSize: 24)),
    ]);
  }

  Widget childFaceImage() {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.grey,
      ),
    );
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
}
