import 'package:where_child_bus_guardian/util/api/child.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pb.dart';

Future<GetChildListByGuardianIDResponse> getChildListByGuardianIdService(
    String guardianId) async {
  try {
    var res = await getChildListByGuardianId(guardianId);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
