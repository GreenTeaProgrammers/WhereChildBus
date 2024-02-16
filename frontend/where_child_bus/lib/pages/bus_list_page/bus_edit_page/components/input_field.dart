import "package:flutter/material.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/styles/styles.dart";

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const InputField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 40,
      child: TextField(
        decoration: editPageInputDecoration(labelText, hintText),
        controller: controller,
      ),
    );
  }
}
