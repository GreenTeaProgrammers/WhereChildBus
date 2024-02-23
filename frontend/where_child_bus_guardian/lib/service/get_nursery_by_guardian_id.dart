import 'package:where_child_bus_guardian/util/api/nursery.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/nursery.pb.dart';

Future<GetNurseryByGuardianIdResponse> getNurseryByGuardianIdService(
    String guardianId) async {
  try {
    var res = await getNurseryByGuardianId(guardianId);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
