import "package:flutter/material.dart";
import "package:where_child_bus/pages/bus_list_page/bus_edit_page/styles/styles.dart";

class InputFieldTitle extends StatelessWidget {
  final String title;

  const InputFieldTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: normalText()
      ),
    );
  }
}