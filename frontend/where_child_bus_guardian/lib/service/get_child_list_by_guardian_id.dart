import 'package:where_child_bus_guardian/util/api/child.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

Future<List<Child>> getChildList(String guardianId) async {
  try {
    GetChildListByGuardianIDResponse childListResponse =
        await getChildListByGuardianID(guardianId);
    return childListResponse.children;
  } catch (error) {
    return Future.error(error);
  }
}
