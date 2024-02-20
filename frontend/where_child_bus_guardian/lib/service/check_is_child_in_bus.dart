import 'package:where_child_bus_guardian/util/api/child.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pb.dart';

Future<CheckIsChildInBusResponse> checkIsChildInBusService(
    String childId) async {
  try {
    var res = await checkIsChildInBus(childId);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
