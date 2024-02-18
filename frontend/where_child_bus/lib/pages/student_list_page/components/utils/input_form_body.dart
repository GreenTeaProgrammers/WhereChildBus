import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'input_value_label.dart';
import 'text_input_field.dart';
import 'select_value_box.dart';
import 'submit_button.dart';

class InputFormBody extends StatefulWidget {
  final List<String> busName;
  final List<String> busStop;

  const InputFormBody(
      {required this.busName, required this.busStop, super.key});

  @override
  State<InputFormBody> createState() => _InputFormBody();
}

class _InputFormBody extends State<InputFormBody> {
  List<File>? images;
  final picker = ImagePicker();

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
        inputLabelAndSelectBox(context, "保護者", widget.busName),
        inputLabelAndSelectBox(context, "利用バス", widget.busName),
        inputLabelAndSelectBox(context, "乗降場所", widget.busStop),
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
        InputValueLabel(label: label),
        TextInputField(hintText: hintText, type: type)
      ],
    );
  }

  Widget inputLabelAndSelectBox(
      BuildContext context, String label, List<String> lists) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputValueLabel(label: label),
        SelectValueBox(lists: lists),
      ],
    );
  }

  Widget submitButton() {
    return SubmitButton(onPressed: () {});
  }
}
