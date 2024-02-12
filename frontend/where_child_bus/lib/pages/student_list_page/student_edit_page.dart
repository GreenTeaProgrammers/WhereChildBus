import 'package:flutter/material.dart';

class StudentEditPage extends StatefulWidget {
  const StudentEditPage({super.key});

  @override
  State<StudentEditPage> createState() => _StudentEditPage();
}

class _StudentEditPage extends State<StudentEditPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(children: <Widget>[
      Text("編集画面"),
    ]));
  }
}
