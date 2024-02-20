import "dart:developer" as developer;
import "package:where_child_bus/util/api/guardians.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

Future<GuardianResponse> getGuardianListByChildIdService(String childId) async {
  try {
    var res = await getGuardiansListByChildId(childId);
    return res.guardian;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}
