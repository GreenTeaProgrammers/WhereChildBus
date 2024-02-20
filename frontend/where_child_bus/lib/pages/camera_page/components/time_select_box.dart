import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class TimeSelectValueBox extends StatefulWidget {
  final Function(BusType) onChanged;
  BusType selectedType = BusType.BUS_TYPE_MORNING;

  TimeSelectValueBox({required this.onChanged, super.key});
  @override
  State<TimeSelectValueBox> createState() => _TimeSelectValueBox();
}

class _TimeSelectValueBox extends State<TimeSelectValueBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<BusType>(
          value: widget.selectedType,
          items: const [
            DropdownMenuItem(
              value: BusType.BUS_TYPE_MORNING,
              child: Text("行き"),
            ),
            DropdownMenuItem(
              value: BusType.BUS_TYPE_EVENING,
              child: Text("帰り"),
            ),
          ],
          onChanged: (BusType? value) {
            if (value != null && mounted) {
              setState(() {
                widget.selectedType = value;
              });
              widget.onChanged(value);
            }
          }),
    );
  }
}
