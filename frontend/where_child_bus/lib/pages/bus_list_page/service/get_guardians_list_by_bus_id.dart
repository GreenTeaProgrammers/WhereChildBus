import "dart:developer" as developer;
import 'package:where_child_bus/util/api/guardians.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart';

Future<GetGuardianListByBusIdResponse> getGuardiansListByBusIdService(
    String busId) async {
  try {
    var res = await getGuardiansListByBusId(busId);
    return res;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}
