import 'package:where_child_bus_guardian/util/api/bus_route.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/station.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pbenum.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus_route.pbgrpc.dart';

Future<GetBusRouteByBusIDResponse> getBusRouteByBusService(
    String busId, BusType busType) async {
  try {
    var res = await getBusRouteByBusID(busId, busType);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
