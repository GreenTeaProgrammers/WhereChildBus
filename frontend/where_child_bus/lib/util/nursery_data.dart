import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class NurseryData {
  static final NurseryData _singleton = NurseryData._internal();
  late NurseryResponse _nursery;

  factory NurseryData() {
    return _singleton;
  }

  NurseryData._internal();

  void setNursery(NurseryResponse nursery) {
    _nursery = nursery;
  }

  NurseryResponse getNursery() {
    return _nursery;
  }
}
