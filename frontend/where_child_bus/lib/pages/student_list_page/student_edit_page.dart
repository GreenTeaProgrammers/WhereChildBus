import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentEditPage extends StatefulWidget {
  const StudentEditPage({super.key});

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  List<File>? images;
  final picker = ImagePicker();

  final List<String> busName = <String>["バス1", "バス2", "バス3"];
  final List<String> busStop = <String>["停留所1", "停留所2", "停留所3"];

  Future getImageFromGallery() async {
    final pickedFiles = await picker.pickMultiImage();

    setState(() {
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        images = pickedFiles.map((xFile) => File(xFile.path)).toList();
      } else {
        print("画像が選択できませんでした。");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: pageBody(context),
      ),
    );
  }

  Widget pageBody(BuildContext context) {
    return Center(
        child: ListView(
      children: <Widget>[
        selectChildImage(),
        editFormBody(context),
      ],
    ));
  }

  Widget selectChildImage() {
    return Column(
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: images == null || images!.isEmpty
              ? [const Text("画像が選択されていません。")]
              : images!
                  .map((image) => Image.file(
                        image,
                        width: 100,
                        height: 100,
                      ))
                  .toList(),
        ),
        Center(
            child: ElevatedButton(
          onPressed: getImageFromGallery,
          child: const Text("画像を選択する"),
        ))
      ],
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
        inputLabelAndSelectBox(context, "利用バス", busName),
        inputLabelAndSelectBox(context, "乗降場所", busStop),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: MediaQuery.of(context).size.width * 0.6,
          child: submitButton(),
        )
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
          style: const TextStyle(color: Colors.black, fontSize: 16),
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
    String? selectedValue;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<String>(
          value: selectedValue ?? lists.first,
          items: lists
              .map((String list) =>
                  DropdownMenuItem(value: list, child: Text(list)))
              .toList(),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          }),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        onPressed: () {},
        child: const Text("保存"));
  }
}
