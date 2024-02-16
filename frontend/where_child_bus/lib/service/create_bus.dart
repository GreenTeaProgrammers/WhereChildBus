import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';

Future<void> createBusService(
    String nurseryId,
    String name,
    String plateNumber,
    Iterable<String> morningGuardianIds,
    Iterable<String> eveningGuardianIds) async {
  try {
    await createBus(
        nurseryId, name, plateNumber, morningGuardianIds, eveningGuardianIds);
  } catch (error) {
    return Future.error(error);
  }
}
