import 'package:where_child_bus/util/api/child.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pbgrpc.dart';

Future<GetChildListByNurseryIDResponse> getChildListByNurseryIdService(
    String nurseryId) async {
  var res = await getChildListByNurseryId(nurseryId);
  return res;
}
