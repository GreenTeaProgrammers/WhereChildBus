import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class CreateBusValidator {
  static bool validateFields(String name, String plateNumber) {
    return name.isEmpty && plateNumber.isEmpty;
  }

  static bool validateGuardians<T>(
      List<T> morningGuardians, List<T> eveningGuardians) {
    return morningGuardians.isEmpty && eveningGuardians.isEmpty;
  }

  static bool validateNameLength(String name) {
    return name.length <= 20;
  }
}
