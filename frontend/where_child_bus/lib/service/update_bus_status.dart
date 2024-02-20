import 'dart:async';
import 'dart:developer' as developer;
import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

Future<UpdateBusResponse> updateBusStatusService(
    String busId, BusStatus busStatus) async {
  try {
    var res = updateBusStatus(busId, busStatus);
    return res;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}
