import "dart:developer" as developer;
import 'package:where_child_bus_api/proto-gen/google/protobuf/field_mask.pb.dart';
import 'package:where_child_bus_guardian/util/api/child.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pbgrpc.dart';

Future<UpdateChildResponse> updateChildItemStatusService(
    {String? childId,
    bool? checkForMissingItems = false,
    bool? hasBag = false,
    bool? hasLunchBox = false,
    bool? hasWaterBottle = false,
    bool? hasUmbrella = false,
    bool? hasOther = false,
    FieldMask? updateMask}) async {
  try {
    var res = await updateChildItemStatus(childId, checkForMissingItems, hasBag,
        hasLunchBox, hasWaterBottle, hasUmbrella, hasOther, updateMask);
    return res;
  } catch (error) {
    developer.log("Caught Error:", error: error);
    return Future.error(error);
  }
}
