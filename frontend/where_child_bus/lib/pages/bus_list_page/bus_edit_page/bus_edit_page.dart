import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where_child_bus/models/bus_edit_page_type.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_child_manage_page/bus_guardian_manage_page.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/input_element.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusEditPage extends StatefulWidget {
  Bus? bus;
  final BusEditPageType busEditPageType;

  BusEditPage({super.key, this.bus, required this.busEditPageType});

  @override
  _BusEditPage createState() => _BusEditPage();
}

class _BusEditPage extends State<BusEditPage> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();

  String? _selectedImagePath;
  bool _isPickingImage = false;

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

  Widget pageBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // inputFieldsAndThumbnail(context),
          inputFields(),
          manageChildrenButton(),
          ConfirmButton(
            buttonText: "保存",
          ),
        ],
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
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BusGuardianManagePage()));
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
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      setState(() {
        _isPickingImage = false;
      });
    }
  }
}
