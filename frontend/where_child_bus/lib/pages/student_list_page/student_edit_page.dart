import 'package:flutter/material.dart';

class StudentEditPage extends StatelessWidget {
  final String childName;

  const StudentEditPage({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            "編集画面",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ]));
  }
}
