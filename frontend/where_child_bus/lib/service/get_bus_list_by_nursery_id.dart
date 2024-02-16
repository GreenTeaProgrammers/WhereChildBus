import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

Future<List<Bus>> getBusList(String nurseryId) async {
  try {
    GetBusListByNurseryIdResponse busListResponse =
        await getBusListByNurseryId(nurseryId);
    return busListResponse.buses;
  } catch (error) {
    return Future.error(error);
  }
}
