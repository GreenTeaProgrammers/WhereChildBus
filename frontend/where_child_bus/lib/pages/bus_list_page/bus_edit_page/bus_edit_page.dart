import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_child_manage_page/bus_child_manage_page.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_child_manage_page/bus_guardian_manage_page.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/input_element.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/stations_list.dart';

class BusEditPage extends StatefulWidget {
  final List<String> busStations;
  static const defaultBusStations = ["バス停が登録されていません"];

  BusEditPage({ this.busStations = defaultBusStations});

  @override
  _BusEditPage createState() => _BusEditPage(busStations: busStations);
}

class _BusEditPage extends State<BusEditPage> {
  final List<String> busStations;
  final ImagePicker _picker = ImagePicker();
  String? _selectedImagePath;
  bool _isPickingImage = false;

  _BusEditPage({required this.busStations});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: pageBody(context)
      ),
    );
  }

  Widget pageBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputFieldsAndThumbnail(context),
          manageChildrenButton(),
          ConfirmButton(buttonText: "保存"),
        ],
      ),
    );
  }

  Widget inputFieldsAndThumbnail(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
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
    return const Column(
      children: [
        InputElement(inputFieldTitle: "バス名", labelText: "バス名を入力してください", hintText: "バス名を入力してください"),
        InputElement(inputFieldTitle: "ナンバー", labelText: "ナンバーを入力してください", hintText: "ナンバーを入力してください"),
      ],
    );
  }

  Widget busThumbnail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.all(8),
          child:  Text("サムネイル"),
        ),
        GestureDetector(
          onTap: () => pickImage(),
          child: _selectedImagePath != null ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Image.file(File(_selectedImagePath!)),
          ) : Center(
            child: unselectedImageButton(), 
          ),
        ),
      ]
    );
  }

  Widget unselectedImageButton() {
    return ElevatedButton(
      onPressed: () => pickImage(),
      child: const Text (
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
                context,MaterialPageRoute(builder: (context) => BusGuardianManagePage())
              ); 
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
      _isPickingImage= true;
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