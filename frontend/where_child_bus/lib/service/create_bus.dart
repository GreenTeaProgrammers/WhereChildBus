import 'package:where_child_bus/util/api/bus.dart';

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
