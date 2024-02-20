import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class NurseryBusData {
  static final NurseryBusData _singleton = NurseryBusData._internal();
  GetBusListByNurseryIdResponse? _busList;

  NurseryBusData._internal();

  factory NurseryBusData() {
    return _singleton;
  }

  void setBusListResponse(GetBusListByNurseryIdResponse res) {
    _busList = res;
  }

  List<Bus> getBusList() {
    return _busList?.buses ?? [];
  }
}
