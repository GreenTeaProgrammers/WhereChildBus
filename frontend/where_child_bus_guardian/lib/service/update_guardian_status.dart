import "dart:developer" as developer;
import 'package:where_child_bus_api/proto-gen/google/protobuf/field_mask.pb.dart';
import 'package:where_child_bus_guardian/util/api/guardian.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart';

Future<UpdateGuardianResponse> updateGuardianStatusService(
    {String? guardianId,
    bool? hasUmbrella = false,
    bool? hasOther = false,
    bool? isUseMorningBus = false,
    bool? isUseEveningBus = false,
    FieldMask? updateMask}) async {
  try {
    var res = await updateGuardianStatus(
        guardianId, isUseMorningBus, isUseEveningBus, updateMask);
    return res;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}
