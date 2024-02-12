import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/styles/styles.dart';

class BusEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: pageBody()
      ),
    );
  }

  Widget pageBody() {
    return Center(
      child: courseNameBody(),
    );
  }

  Widget courseNameBody() {
    return Column(
      children: [
        courseNameTitle(),
        courseNameInputField(),
      ],
    );
  }

  

  Widget courseNameTitle() {
    return  Padding(
      padding:  const EdgeInsets.all(8.0),
      child: Text(
        "コース名",
        style: normalText(), 
      ),
    );
  }

  Widget courseNameInputField() {
    return TextField(
      decoration: editPageInputDecoration("コース名", "コース名を入力して下さい")
    );
  }
}