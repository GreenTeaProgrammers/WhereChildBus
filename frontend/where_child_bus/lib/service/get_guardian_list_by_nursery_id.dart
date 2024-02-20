import 'package:where_child_bus/util/api/guardians.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

Future<GetGuardianListByNurseryIdResponse> getGuardianListByNurseryIdService(
    String nurseryId) async {
  var res = await getGuardiansListByNurseryId(nurseryId);
  return res;
}
