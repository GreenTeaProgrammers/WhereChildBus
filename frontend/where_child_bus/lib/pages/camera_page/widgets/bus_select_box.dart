import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusSelectValueBox extends StatefulWidget {
  final List<Bus> busLists;
  final Function(Bus?) onChanged;
  Bus? selectedBus;

  BusSelectValueBox(
      {required this.busLists, required this.onChanged, super.key});
  @override
  State<BusSelectValueBox> createState() => _SelectValueBox();
}

class _SelectValueBox extends State<BusSelectValueBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<Bus>(
          value: widget.selectedBus ?? widget.busLists.first,
          items: widget.busLists
              .map((Bus list) =>
                  DropdownMenuItem(value: list, child: Text(list.name)))
              .toList(),
          onChanged: (Bus? value) {
            setState(() {
              widget.selectedBus = value;
            });
            widget.onChanged(value);
          }),
    );
  }
}
