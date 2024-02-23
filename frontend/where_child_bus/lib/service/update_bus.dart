import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus/util/api/busRoute.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';

Future<UpdateBusResponse> updateBusService(
    String nurseryId,
    String name,
    String plateNumber,
    Iterable<String> morningGuardianIds,
    Iterable<String> eveningGuardianIds) async {
  try {
    var res = await updateBus(nurseryId, name, plateNumber);
    if (morningGuardianIds.isNotEmpty) {
      await createMorningBusRoute(
          res.bus, nurseryId, morningGuardianIds, eveningGuardianIds);
    } else if (eveningGuardianIds.isNotEmpty) {
      await createEveningBusRoute(
          res.bus, nurseryId, morningGuardianIds, eveningGuardianIds);
    }
    return res;
  } catch (error) {
    return Future.error(error);
  }
}
