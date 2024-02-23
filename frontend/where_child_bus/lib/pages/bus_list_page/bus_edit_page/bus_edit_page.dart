import 'dart:io';
import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where_child_bus/models/bus_edit_page_type.dart';
import 'package:where_child_bus/models/create_bus_error.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_child_manage_page/bus_guardian_manage_page.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/input_element.dart';
import 'package:where_child_bus/service/create_bus.dart';
import 'package:where_child_bus/service/update_bus.dart';
import 'package:where_child_bus/util/validation/create_bus_validation.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusEditPage extends StatefulWidget {
  final Bus? bus;
  final BusEditPageType busEditPageType;

  const BusEditPage({super.key, this.bus, required this.busEditPageType});

  @override
  _BusEditPageState createState() => _BusEditPageState();
}

class _BusEditPageState extends State<BusEditPage> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();
  List<String> morningSelectedGuardiansId = [];
  List<String> eveningSelectedGuardiansId = [];

  String? _selectedImagePath;
  bool _isPickingImage = false;
  bool _isCreatingBus = false;
  CreateBusError? _createBusError;

  @override
  void initState() {
    super.initState();
    if (widget.bus != null) {
      setState(() {
        _busNameController.text = widget.bus!.name;
        _busNumberController.text = widget.bus!.plateNumber;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(appBar: AppBar(), body: pageBody(context)),
    );
  }

  bool validation() {
    if (CreateBusValidator.validateFields(
        _busNameController.text, _busNumberController.text)) {
      developer.log("バス名とナンバーを入力してください");
      setState(() {
        _createBusError = CreateBusError.fieldsNotFilled;
      });
      return true;
    }
    //Note 今のところ保護者が選択されていなくても作成できる
    // } else if (CreateBusValidator.validateGuardians(
    //     morningSelectedGuardiansId, eveningSelectedGuardiansId)) {
    //   setState(() {
    //     _createBusError = CreateBusError.noGuardiansSelected;
    //   });
    // return true;

    //Todo 将来的に修正する
    // } else if (CreateBusValidator.validateNameLength(_busNameController.text)) {
    //   setState(() {
    //     _createBusError = CreateBusError.nameTooLong;
    //   });
    //   return true;
    // }

    return false;
  }

  Future<void> _updateBus() async {
    // throw UnimplementedError();

    if (validation()) {
      return;
    }

    try {
      if (mounted) {
        setState(() {
          _isCreatingBus = true;
        });
      }

      var res = await updateBusService(
        NurseryData().getNursery().id,
        _busNameController.text,
        _busNumberController.text,
        morningSelectedGuardiansId,
        eveningSelectedGuardiansId,
      );
      developer.log("バスの更新に成功しました $res", name: "BusUpdateButton");
      Navigator.pop(context);
    } catch (e) {
      if (kDebugMode) {
        developer.log("バスの更新中にエラーが発生しました",
            error: e, name: "BusUpdateButtonError");
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCreatingBus = false;
        });
      }
    }
  }

  Future<void> _createBus() async {
    if (validation()) {
      return;
    }

    try {
      if (mounted) {
        setState(() {
          _isCreatingBus = true;
        });
      }

      var res = await createBusService(
        NurseryData().getNursery().id,
        _busNameController.text,
        _busNumberController.text,
        morningSelectedGuardiansId,
        eveningSelectedGuardiansId,
      );
      developer.log("バスの作成に成功しました: $res", name: "BusEditPage");
      Navigator.pop(context);
    } catch (e) {
      if (kDebugMode) {
        developer.log("バスの作成中にエラーが発生しました: $e");
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCreatingBus = false;
        });
      }
    }
  }

  Widget pageBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // inputFieldsAndThumbnail(context),
          inputFields(),
          manageChildrenButton(),
          _createErrorMessage(),
          _isCreatingBus
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ConfirmButton(
                  buttonText: "保存",
                  onTap: widget.busEditPageType == BusEditPageType.update
                      ? _updateBus
                      : _createBus,
                ),
        ],
      ),
    );
  }

  Widget _createErrorMessage() {
    String errorMessage;
    if (_createBusError == CreateBusError.fieldsNotFilled) {
      errorMessage = "バス名とナンバーを入力してください";
    } else if (_createBusError == CreateBusError.noGuardiansSelected) {
      errorMessage = "保護者を選択してください";
    } else if (_createBusError == CreateBusError.nameTooLong) {
      errorMessage = "バス名は20文字以内で入力してください";
    } else {
      errorMessage = "";
    }

    if (_createBusError == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget inputFieldsAndThumbnail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          busThumbnail(context),
          inputFields(),
        ],
      ),
    );
  }

  Widget inputFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputElement(
          inputFieldTitle: "バス名",
          labelText: "バス名を入力してください",
          hintText: "バス名を入力してください",
          controller: _busNameController,
        ),
        InputElement(
          inputFieldTitle: "ナンバー",
          labelText: "ナンバーを入力してください",
          hintText: "ナンバーを入力してください",
          controller: _busNumberController,
        ),
      ],
    );
  }

  Widget busThumbnail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.all(8),
        child: Text("サムネイル"),
      ),
      GestureDetector(
        onTap: () => pickImage(),
        child: _selectedImagePath != null
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Image.file(File(_selectedImagePath!)),
              )
            : Center(
                child: unselectedImageButton(),
              ),
      ),
    ]);
  }

  Widget unselectedImageButton() {
    return ElevatedButton(
      onPressed: () => pickImage(),
      child: const Text(
        "画像が選択されていません",
      ),
    );
  }

  Widget manageChildrenButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () async {
            var res = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BusGuardianManagePage(
                          morningSelectedGuardiansId:
                              morningSelectedGuardiansId,
                          eveningSelectedGuardiansId:
                              eveningSelectedGuardiansId,
                        )));
            if (res != null && res is Map<String, List<GuardianResponse>>) {
              developer.log("${res["morning"]}");
              morningSelectedGuardiansId =
                  res["morning"]?.map((e) => e.id).toList() ?? [];
              eveningSelectedGuardiansId =
                  res["evening"]?.map((e) => e.id).toList() ?? [];
            }
          },
          child: const Text("バスを利用する保護者を変更"),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    if (_isPickingImage) {
      //  画像選択が既に進行中なので、新たに画像選択を開始しない
      return;
    }

    setState(() {
      _isPickingImage = true;
    });

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _selectedImagePath = image.path;
        });
      } else {
        developer.log('No image selected.');
      }
    } catch (e) {
      developer.log('Error picking image: $e');
    } finally {
      setState(() {
        _isPickingImage = false;
      });
    }
  }
}
