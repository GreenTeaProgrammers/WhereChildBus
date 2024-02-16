import "dart:developer" as developer;
import 'package:where_child_bus/util/api/station.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

Future<List<GuardianResponse>> getGuardiansByBusId(String busId) async {
  try {
    var res = await getStationListByBusId(busId);
    return res.guardians;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}
