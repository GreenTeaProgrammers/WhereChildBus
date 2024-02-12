import 'package:flutter/material.dart';

class StudentEditPage extends StatefulWidget {
  StudentEditPage({super.key});

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  final List<String> busCourse = <String>["コース1", "コース2", "コース3"];
  final List<String> busStop = <String>["停留所1", "停留所2", "停留所3"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: pageBody(context),
      ),
    );
  }

  Widget pageBody(BuildContext context) {
    return Center(
      child: childNameBody(context),
    );
  }

  Widget childNameBody(BuildContext context) {
    return Column(
      children: [
        textInputField(context, "園児氏名", "園児氏名を入力してください", TextInputType.name),
        textInputField(context, "年齢", "年齢を入力してください", TextInputType.number),
        textInputField(context, "保護者氏名", "保護者氏名を入力してください", TextInputType.name),
        textInputField(
            context, "保護者連絡先", "保護者連絡先を入力してください", TextInputType.phone),
        selectValueBox(context, busCourse),
        selectValueBox(context, busStop),
      ],
    );
  }

  Widget selectValueBox(BuildContext context, List<String> lists) {
    String isSelectedValue = lists.first;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: DropdownButton<String>(
          value: isSelectedValue,
          items: lists
              .map((String list) =>
                  DropdownMenuItem(value: list, child: Text(list)))
              .toList(),
          onChanged: (String? value) {
            setState(() {
              isSelectedValue = value!;
            });
          }),
    );
  }

  Widget textInputField(BuildContext context, String labelText, String hintText,
      TextInputType type) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextField(
          decoration: formInputDecoration(labelText, hintText),
          keyboardType: type,
        ));
  }

  InputDecoration formInputDecoration(String labelText, String hintText) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: const OutlineInputBorder(),
    );
  }
}
