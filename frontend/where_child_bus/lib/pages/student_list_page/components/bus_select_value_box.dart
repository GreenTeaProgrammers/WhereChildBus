import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusSelectedValueBox extends StatefulWidget {
  final List<Bus> lists;
  Bus? selectedValue;
  Function(Bus?)? onChanged;

  BusSelectedValueBox(
      {required this.lists, super.key, this.selectedValue, this.onChanged});
  @override
  State<BusSelectedValueBox> createState() => _SelectValueBox();
}

class _SelectValueBox extends State<BusSelectedValueBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<Bus>(
          value: widget.selectedValue ?? widget.lists.first,
          items: widget.lists
              .map((Bus list) =>
                  DropdownMenuItem(value: list, child: Text(list.name)))
              .toList(),
          onChanged: (Bus? value) {
            setState(() {
              widget.selectedValue = value;
            });
            widget.onChanged?.call(value);
          }),
    );
  }
}
