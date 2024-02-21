import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusImage extends StatelessWidget {
  const BusImage({
    super.key,
    required this.busStatus,
  });

  final BusStatus busStatus;

  @override
  Widget build(BuildContext context) {
    late String imagePath;
    if (busStatus == BusStatus.BUS_STATUS_RUNNING) {
      imagePath = "assets/images/bus_operating.png";
    } else if (busStatus == BusStatus.BUS_STATUS_STOPPED) {
      imagePath = "assets/images/bus_not_operating.png";
    } else {
      imagePath = "assets/images/bus_maintenance.png";
    }

    return SizedBox(
        width: 100,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ));
  }
}
