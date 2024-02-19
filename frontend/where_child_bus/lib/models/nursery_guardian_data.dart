import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class NurseryGuardianData {
  static final NurseryGuardianData _singleton = NurseryGuardianData._internal();
  GetGuardianListByNurseryIdResponse? _guardianList;

  factory NurseryGuardianData() {
    return _singleton;
  }

  NurseryGuardianData._internal();

  void setGuardianListResponse(GetGuardianListByNurseryIdResponse res) {
    _guardianList = res;
  }

  List<GuardianResponse> getGuardianList() {
    return _guardianList?.guardians ?? [];
  }

  void clearGuardianList() {
    _guardianList = null;
  }
}
