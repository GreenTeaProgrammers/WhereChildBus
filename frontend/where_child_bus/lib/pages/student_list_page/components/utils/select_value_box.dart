import 'package:flutter/material.dart';

class SelectValueBox extends StatefulWidget {
  final List<String> lists;

  const SelectValueBox({required this.lists, super.key});
  @override
  State<SelectValueBox> createState() => _SelectValueBox();
}

class _SelectValueBox extends State<SelectValueBox> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<String>(
          value: selectedValue ?? widget.lists.first,
          items: widget.lists
              .map((String list) =>
                  DropdownMenuItem(value: list, child: Text(list)))
              .toList(),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          }),
    );
  }
}
