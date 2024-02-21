import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class TimeSelectValueBox extends StatefulWidget {
  final Function(BusType) onChanged;
  final BusType initialSelectedType;

  TimeSelectValueBox(
      {required this.onChanged,
      this.initialSelectedType = BusType.BUS_TYPE_MORNING,
      super.key});

  @override
  State<TimeSelectValueBox> createState() => _TimeSelectValueBoxState();
}

class _TimeSelectValueBoxState extends State<TimeSelectValueBox> {
  late BusType _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialSelectedType; // 初期状態を設定
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton<BusType>(
        value: _selectedType, // 選択された状態を使用
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
          if (value != null) {
            setState(() {
              _selectedType = value; // 選択された値で更新
            });
            widget.onChanged(value); // 親ウィジェットに変更を通知
          }
        },
      ),
    );
  }
}
