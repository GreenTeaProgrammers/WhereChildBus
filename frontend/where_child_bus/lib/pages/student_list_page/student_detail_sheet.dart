import 'package:flutter/material.dart';

class StudentDetailSheet extends StatelessWidget {
  final String childName;

  //将来的にはChild型を受け取る。
  const StudentDetailSheet({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: modalBody(),
    );
  }

  Widget modalBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        modalHeader(),
        Container(
            margin: const EdgeInsets.only(top: 20), child: childDetailList())
      ],
    );
  }

  Widget modalHeader() {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.topRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          //将来的に編集画面へ遷移する。
          onPressed: () {},
          child: const Icon(Icons.edit),
        ),
      ),
      childImageAndChildName(),
    ]);
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

  //TODO: 将来的に画像を受け取る。
  Widget childFaceImage() {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.grey,
      ),
    );
  }

  //TODO: 将来的にはデータを受け取る。
  Widget childDetailList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        childDetailItem("年齢", "3歳"),
        childDetailItem("クラス", "1組"),
        childDetailItem("保護者氏名", "保護者1"),
        childDetailItem("保護者連絡先", "xxx-xxxx-xxxx"),
        childDetailItem("利用コース", "○○コース"),
        childDetailItem("乗降場所", "○○駐車場前"),
      ],
    );
  }

  Widget childDetailItem(String title, String element) {
    return Row(
      children: <Widget>[
        detailItemTitle(title),
        const SizedBox(
          width: 50,
        ),
        Text(element, style: const TextStyle(color: Colors.black, fontSize: 18))
      ],
    );
  }

  Widget detailItemTitle(String title) {
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
