import "package:flutter/material.dart";
import 'package:where_child_bus/components/child_list/child_list_element.dart';

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
}
