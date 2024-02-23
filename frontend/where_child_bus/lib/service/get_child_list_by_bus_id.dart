import 'package:where_child_bus/util/api/child.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pbgrpc.dart';

Future<GetChildListByBusIDResponse> getChildListByBusIDService(
    String busID) async {
  try {
    var res = await getChildListByBusId(busID);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
