import 'package:where_child_bus_guardian/util/api/bus.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pb.dart';

Future<GetRunningBusByGuardianIdResponse> getRunningBusByGuardianIdService(
    String guardianId) async {
  try {
    var res = await getRunningBusByGuardianId(guardianId);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
