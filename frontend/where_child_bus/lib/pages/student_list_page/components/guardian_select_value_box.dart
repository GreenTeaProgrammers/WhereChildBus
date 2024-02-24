import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class GuardianSelectValueBox extends StatefulWidget {
  final List<GuardianResponse> lists;
  GuardianResponse? selectedValue;
  Function? onChanged;

  GuardianSelectValueBox(
      {required this.lists, super.key, this.selectedValue, this.onChanged});
  @override
  State<GuardianSelectValueBox> createState() => _SelectValueBox();
}

class _SelectValueBox extends State<GuardianSelectValueBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<GuardianResponse>(
          value: widget.selectedValue ?? widget.lists.first,
          items: widget.lists
              .map((GuardianResponse list) =>
                  DropdownMenuItem(value: list, child: Text(list.name)))
              .toList(),
          onChanged: (GuardianResponse? value) {
            setState(() {
              widget.selectedValue = value;
            });
            widget.onChanged?.call(value);
          }),
    );
  }
}
