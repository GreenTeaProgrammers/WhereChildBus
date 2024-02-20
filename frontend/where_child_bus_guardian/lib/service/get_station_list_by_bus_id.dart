import 'package:where_child_bus_guardian/util/api/station.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/station.pb.dart';

Future<GetStationListByBusIdResponse> getStationListByBusIdService(
    String busId) async {
  try {
    var res = await getStationListByBusId(busId);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
