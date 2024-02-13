import "package:flutter/material.dart";
import "package:where_child_bus/components/utils/child_list_element.dart";

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
        return ChildListElement(
          childName: childNames[index],
          groupName: groupNames[index],
          image: images[index],
          screenSize: screenSize,
          onTap: callback,
        );
      }
    );
  }

  Widget childCardListInner(String childName, String groupName, String image, Size screenSize) {
    return FractionallySizedBox(
        widthFactor: 0.8,
        child: InkWell(
          onTap: callback,
          child: childCard(childName, groupName, image, screenSize),
        ));
  }

  Widget childCard(String childName, String groupName, String image, Size screenSize) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: <Widget>[
          childFaceImage(image),
          SizedBox(
            width: screenSize.width * 0.05,
          ),
          childNameAndGroupName(childName, groupName),
        ])
      )
    );
  }

  Widget childFaceImage(String image) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset("assets/images/face_$image.png"),
    );
  }

  Widget childNameAndGroupName(String childName, String groupName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(childName,
            style: const TextStyle(color: Colors.black, fontSize: 24)),
        Text(
          groupName,
          style: const TextStyle(color: Colors.black),
        ),
      ]);
  }
}
