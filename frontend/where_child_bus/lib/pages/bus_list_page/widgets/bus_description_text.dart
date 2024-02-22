import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusDescriptionText extends StatelessWidget {
  const BusDescriptionText({
    super.key,
    required this.busStatus,
  });

  final BusStatus busStatus;

  @override
  Widget build(BuildContext context) {
    late String description;
    if (busStatus == BusStatus.BUS_STATUS_RUNNING) {
      description = "運行中";
    } else if (busStatus == BusStatus.BUS_STATUS_MAINTENANCE) {
      description = "経路未設定";
    } else {
      description = "停止中";
    }
    return Text(
      description,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
