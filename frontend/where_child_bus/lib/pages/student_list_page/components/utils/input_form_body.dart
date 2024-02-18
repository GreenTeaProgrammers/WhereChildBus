import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where_child_bus/service/get_bus_list_by_nursery_id.dart';
import 'package:where_child_bus/service/get_guardian_list_by_nursery_id.dart';
import 'package:where_child_bus/util/nursery_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'input_value_label.dart';
import 'text_input_field.dart';
import 'select_value_box.dart';
import 'submit_button.dart';

class InputFormBody extends StatefulWidget {
  final List<String> busName;
  final List<String> busStop;

  const InputFormBody({required this.busName, required this.busStop, Key? key})
      : super(key: key);

  @override
  State<InputFormBody> createState() => _InputFormBodyState();
}

class _InputFormBodyState extends State<InputFormBody> {
  late Future<void> _loadDataFuture; // 非同期処理の結果を保持する変数
  List<GuardianResponse> guardians = [];
  List<Bus> buses = [];
  List<File>? images;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // initState内で非同期処理をトリガーし、結果を変数に格納
    _loadDataFuture = _loadBusesAndGuardians();
  }

  Future<void> _loadBusesAndGuardians() async {
    try {
      await _loadGuardians();
      await _loadBuses();
    } catch (error) {
      developer.log("Caught Error", error: error.toString());
    }
  }

  Future<void> _loadGuardians() async {
    try {
      var res = await getGuardianListByNurseryIdService(
          NurseryData().getNursery().id);
      setState(() {
        guardians = res;
      });
    } catch (error) {
      developer.log("Caught Error", error: error.toString());
      setState(() {
        guardians = [];
      });
    }
  }

  Future<void> _loadBuses() async {
    try {
      var res = await getBusList(NurseryData().getNursery().id);
      setState(() {
        buses = res;
      });
    } catch (error) {
      developer.log("Caught Error", error: error.toString());
      setState(() {
        buses = [];
      });
    }
  }

  Future getImageFromGallery() async {
    final pickedFiles = await picker.pickMultiImage();

    setState(() {
      if (pickedFiles.isNotEmpty) {
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
          FutureBuilder<void>(
            future: _loadDataFuture, // 修正: 非同期処理の結果を格納した変数を使用
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return const Text("保護者情報の読み込みに失敗しました。");
              } else {
                // 非同期処理が完了し、データがある場合
                return editFormBody(context);
              }
            },
          ),
        ],
      ),
    );
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

  Widget editFormBody(
    BuildContext context,
  ) {
    return Column(
      children: [
        inputLabelAndTextField(
            context, "園児氏名", "園児氏名を入力してください", TextInputType.name),
        inputLabelAndTextField(
            context, "年齢", "年齢を入力してください", TextInputType.number),
        inputLabelAndSelectBox(
          context,
          "保護者",
          guardians.map((guardian) => guardian.name).toList(),
        ),
        inputLabelAndSelectBox(context, "利用バス", widget.busName),
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
