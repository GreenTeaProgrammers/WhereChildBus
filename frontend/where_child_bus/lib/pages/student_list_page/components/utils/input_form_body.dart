import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where_child_bus/models/nursery_bus_data.dart';
import 'package:where_child_bus/models/nursery_guardian_data.dart';
import 'package:where_child_bus/pages/camera_page/widgets/bus_select_box.dart';
import 'package:where_child_bus/pages/student_list_page/components/guardian_select_value_box.dart';
import 'package:where_child_bus/service/get_bus_list_by_nursery_id.dart';
import 'package:where_child_bus/service/get_guardian_list_by_nursery_id.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus/util/api/child.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import '../../../../components/util/input_value_label.dart';
import 'text_input_field.dart';
import '../../../../components/util/select_value_box.dart';
import 'submit_button.dart';

class InputFormBody extends StatefulWidget {
  final Child? child;
  final bool isEdit;

  const InputFormBody({Key? key, this.child, required this.isEdit})
      : super(key: key);

  @override
  State<InputFormBody> createState() => _InputFormBodyState();
}

class _InputFormBodyState extends State<InputFormBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  late Future<void> _loadDataFuture; // 非同期処理の結果を保持する変数
  bool _isCreatingChild = false;
  List<GuardianResponse> guardians = [];
  List<Bus> buses = [];
  List<File>? images;
  final picker = ImagePicker();

  Sex? selectedSex;
  GuardianResponse? selectedGuardian;

  @override
  void initState() {
    super.initState();
    if (widget.child != null) {
      _nameController.text = widget.child!.name;
      _ageController.text = widget.child!.age.toString();
    }
    _loadDataFuture = _loadBusesAndGuardians();
  }

  Future<void> _loadBusesAndGuardians() async {
    try {
      await _loadGuardians();
      await _loadBuses();
      if (widget.isEdit == false) {
        _onGuardianSelected(guardians[0]);
        _onSexSelected("男");
      }
    } catch (error) {
      developer.log("Caught Error", error: error.toString());
    }
  }

  Future<void> _loadGuardians() async {
    try {
      var res = await getGuardianListByNurseryIdService(
          NurseryData().getNursery().id);
      NurseryGuardianData().setGuardianListResponse(res);
      setState(() {
        guardians = NurseryGuardianData().getGuardianList();
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
      NurseryBusData().setBusListResponse(res);
      setState(() {
        buses = NurseryBusData().getBusList();
      });
    } catch (error) {
      developer.log("Caught Error", error: error.toString());
      setState(() {
        buses = [];
      });
    }
  }

  Future<void> _createChild() async {
    if (selectedGuardian == null || selectedSex == null) {
      developer.log("保護者、利用バス、性別が選択されていません。");
      return;
    }
    if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
      developer.log("園児氏名、年齢が入力されていません。");
      return;
    }
    if (images == null || images!.isEmpty) {
      developer.log("画像が選択されていません。");
      return;
    }

    try {
      if (mounted) {
        setState(() {
          _isCreatingChild = true;
        });
      }
      var photos = images!.map((file) => file.readAsBytesSync()).toList();
      var res = await createChild(
          NurseryData().getNursery().id,
          selectedGuardian!.id,
          _nameController.text,
          int.parse(_ageController.text),
          selectedSex!,
          photos);
      developer.log("園児情報の登録が完了しました。$res");
      Navigator.pop(context);
    } catch (error) {
      developer.log("Caught Error", error: error.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isCreatingChild = false;
        });
      }
    }
  }

  Future _getImageFromGallery() async {
    final pickedFiles = await picker.pickMultiImage();

    setState(() {
      if (pickedFiles.isNotEmpty) {
        images = pickedFiles.map((xFile) => File(xFile.path)).toList();
      } else {
        developer.log("画像が選択できませんでした。");
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
          onPressed: _getImageFromGallery,
          child: const Text("画像を選択する"),
        ))
      ],
    );
  }

  void _onSexSelected(String? value) {
    if (value == "男") {
      selectedSex = Sex.SEX_MAN;
    } else if (value == "女") {
      selectedSex = Sex.SEX_WOMAN;
    } else {
      selectedSex = Sex.SEX_OTHER;
    }
  }

  void _onGuardianSelected(GuardianResponse? value) {
    selectedGuardian = value;
  }

  Widget editFormBody(
    BuildContext context,
  ) {
    return Column(
      children: [
        _createInputLabelAndTextField(context, "園児氏名", "園児氏名を入力してください",
            TextInputType.name, _nameController),
        _createInputLabelAndTextField(
            context, "年齢", "年齢を入力してください", TextInputType.number, _ageController),
        _createSexInputLabelAndSelectBox(
          context,
          "性別",
          ["男", "女", "その他"],
          _onSexSelected,
        ),
        _createGuardianInputLabelAndSelectBox(
          context,
          "保護者",
          guardians,
          _onGuardianSelected,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: MediaQuery.of(context).size.width * 0.6,
          child: submitButton(),
        )
      ],
    );
  }

  Widget _createInputLabelAndTextField(BuildContext context, String label,
      String hintText, TextInputType type, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputValueLabel(label: label),
        TextInputField(
          hintText: hintText,
          type: type,
          controller: controller,
        )
      ],
    );
  }

  Widget _createSexInputLabelAndSelectBox(BuildContext context, String label,
      List<String> lists, Function? onChanged) {
    String selected = "男";
    if (widget.isEdit) {
      switch (widget.child!.sex) {
        case Sex.SEX_MAN:
          selected = "男";
          break;
        case Sex.SEX_WOMAN:
          selected = "女";
          break;
        default:
          selected = "その他";
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputValueLabel(label: label),
        SelectValueBox(
          lists: lists,
          onChanged: onChanged,
          selectedValue: selected,
        ),
      ],
    );
  }

  Widget _createGuardianInputLabelAndSelectBox(BuildContext context,
      String label, List<GuardianResponse> lists, Function? onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputValueLabel(label: label),
        GuardianSelectValueBox(
          lists: lists,
          onChanged: onChanged,
          selectedValue: widget.isEdit
              ? guardians.firstWhere(
                  (guardian) => guardian.id == widget.child!.guardianId)
              : null,
        ),
      ],
    );
  }

  Widget _createBusInputLabelAndSelectBox(BuildContext context, String label,
      List<Bus> lists, Function(Bus?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputValueLabel(label: label),
        BusSelectValueBox(
          busLists: lists,
          onChanged: onChanged,
          //TODO: 修正: 選択されたバスを初期値として設定
        ),
      ],
    );
  }

  Widget submitButton() {
    return _isCreatingChild
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SubmitButton(
            onPressed: widget.isEdit
                ? () => developer.log("UnImplemented", name: "updateChild")
                : _createChild);
  }
}
