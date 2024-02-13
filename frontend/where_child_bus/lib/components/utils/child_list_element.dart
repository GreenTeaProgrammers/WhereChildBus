import 'package:flutter/material.dart';

class ChildListElement extends StatelessWidget {
  final String childName;
  final String groupName;
  final String image;
  final Size screenSize;
  final VoidCallback? onTap;

  const ChildListElement({
    Key? key,
    required this.childName,
    required this.groupName,
    required this.image,
    required this.screenSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[
              ChildImage(image: image),
              SizedBox(width: screenSize.width * 0.05),
              ChildDetails(childName: childName, groupName: groupName),
            ]),
          ),
        ),
      ),
    );
  }
}

class ChildImage extends StatelessWidget {
  final String image;

  const ChildImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset("assets/images/face_$image.png"),
    );
  }
}

class ChildDetails extends StatelessWidget {
  final String childName;
  final String groupName;

  const ChildDetails({Key? key, required this.childName, required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          childName,
          style: const TextStyle(color: Colors.black, fontSize: 24),
        ),
        Text(
          groupName,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
