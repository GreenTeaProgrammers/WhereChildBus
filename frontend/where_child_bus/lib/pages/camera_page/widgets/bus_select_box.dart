import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusSelectValueBox extends StatefulWidget {
  final List<Bus> busLists;
  final Function(Bus?) onChanged;
  final Bus? selectedBus;

  const BusSelectValueBox({
    required this.busLists,
    required this.onChanged,
    this.selectedBus,
    super.key,
  });

  @override
  State<BusSelectValueBox> createState() => _BusSelectValueBoxState();
}

class _BusSelectValueBoxState extends State<BusSelectValueBox> {
  Bus? _selectedBus;

  @override
  void initState() {
    super.initState();
    _selectedBus = widget.selectedBus ?? widget.busLists.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<Bus>(
        value: _selectedBus,
        items: widget.busLists.map((Bus bus) {
          return DropdownMenuItem(value: bus, child: Text(bus.name));
        }).toList(),
        onChanged: (Bus? value) {
          setState(() {
            _selectedBus = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
