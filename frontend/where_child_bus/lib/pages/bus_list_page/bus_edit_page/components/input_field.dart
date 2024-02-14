
import "package:flutter/material.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/styles/styles.dart";

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;

  const InputField({super.key, required this.labelText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 30, 
      child: TextField(
        decoration: editPageInputDecoration(labelText, hintText),
      ),
    );
  }
}