import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class GuardianData {
  static final GuardianData _singleton = GuardianData._internal();
  late GuardianResponse _guardian;

  factory GuardianData() {
    return _singleton;
  }

  GuardianData._internal();

  void setGuardian(GuardianResponse guardian) {
    _guardian = guardian;
  }

  GuardianResponse getGuardian() {
    return _guardian;
  }
}
