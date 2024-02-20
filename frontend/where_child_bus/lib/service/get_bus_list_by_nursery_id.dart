import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pb.dart';

Future<GetBusListByNurseryIdResponse> getBusList(String nurseryId) async {
  try {
    GetBusListByNurseryIdResponse busListResponse =
        await getBusListByNurseryId(nurseryId);
    return busListResponse;
  } catch (error) {
    return Future.error(error);
  }
}
