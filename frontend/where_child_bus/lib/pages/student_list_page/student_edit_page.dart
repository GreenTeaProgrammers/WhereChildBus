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
      child: editFormBody(context),
    );
  }

  Widget editFormBody(BuildContext context) {
    return Column(
      children: [
        inputLabelAndTextField(
            context, "園児氏名", "園児氏名を入力してください", TextInputType.name),
        inputLabelAndTextField(
            context, "年齢", "年齢を入力してください", TextInputType.number),
        inputLabelAndTextField(
            context, "保護者氏名", "保護者氏名を入力してください", TextInputType.name),
        inputLabelAndTextField(
            context, "保護者連絡先", "保護者連絡先を入力してください", TextInputType.phone),
        inputLabelAndSelectBox(context, "利用バスコース", busCourse),
        inputLabelAndSelectBox(context, "乗降場所", busStop)
      ],
    );
  }

  Widget inputLabelAndTextField(
      BuildContext context, String label, String hintText, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        inputValueLabel(label),
        textInputField(context, hintText, type)
      ],
    );
  }

  Widget inputLabelAndSelectBox(
      BuildContext context, String label, List<String> lists) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        inputValueLabel(label),
        selectValueBox(context, lists),
      ],
    );
  }

  Widget inputValueLabel(String label) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ));
  }

  Widget textInputField(
      BuildContext context, String hintText, TextInputType type) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 40,
        child: TextField(
          decoration: formInputDecoration(hintText),
          keyboardType: type,
        ));
  }

  InputDecoration formInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 13),
      border: const OutlineInputBorder(),
    );
  }

  Widget selectValueBox(BuildContext context, List<String> lists) {
    String isSelectedValue = lists.first;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
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
}
