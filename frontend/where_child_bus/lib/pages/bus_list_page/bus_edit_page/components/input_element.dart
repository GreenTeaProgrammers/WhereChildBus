import "package:flutter/material.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/components/input_field.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/components/input_field_title.dart";

class InputElement extends StatelessWidget {
  final String inputFieldTitle;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const InputElement(
      {super.key,
      required this.inputFieldTitle,
      required this.labelText,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputFieldTitle(title: inputFieldTitle),
          InputField(
            labelText: labelText,
            hintText: hintText,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
