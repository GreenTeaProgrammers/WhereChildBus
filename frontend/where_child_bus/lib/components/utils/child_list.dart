import "package:flutter/material.dart";

class ChildList extends StatelessWidget {
  final List<String> childNames;
  final List<String> groupNames;
  final List<String> images;
  final VoidCallback? callback;

  ChildList({required this.childNames, required this.groupNames, required this.images, this.callback});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return childCardListBuilder(screenSize);
  }

    //TODO: 将来的にはAPIからデータを取得する。
  Widget childCardListBuilder(Size screenSize) {
    return ListView.separated(
        itemCount: childNames.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 20,
            color: Colors.transparent,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return childCardListInner(index, screenSize);
        }
    );
  }

  Widget childCardListInner(int index, Size screenSize) {
    return FractionallySizedBox(
        widthFactor: 0.8,
        child: InkWell(
          onTap: () {},
          child: childCard(index, screenSize),
        ));
  }

  //TODO: Child型を受け取る
  Widget childCard(int index, Size screenSize) {
    return Card(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[
              childFaceImage(index),
              SizedBox(
                width: screenSize.width * 0.05,
              ),
              childNameAndGroupName(index),
            ]
          )
        )
      );
  }

  Widget childFaceImage(int index) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset("assets/images/face_${images[index]}.png"));
  }

  Widget childNameAndGroupName(int index) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(childNames[index],
              style: const TextStyle(color: Colors.black, fontSize: 24)),
          Text(
            groupNames[index],
            style: const TextStyle(color: Colors.black),
          ),
          busStopName(),
        ]);
  }

  //TODO: 引数に停留所名を加える。
  Widget busStopName() {
    return const Row(children: <Widget>[
      Icon(Icons.location_on),
      Text("停留所名"),
    ]);
  }
}