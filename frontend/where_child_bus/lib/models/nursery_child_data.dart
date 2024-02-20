import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pbgrpc.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class NurseryChildListData {
  static final NurseryChildListData _singleton =
      NurseryChildListData._internal();
  GetChildListByNurseryIDResponse? _childList;

  factory NurseryChildListData() {
    return _singleton;
  }

  NurseryChildListData._internal();

  void setChildListResponse(res) {
    _childList = res;
  }

  List<Child> getChildList() {
    return _childList?.children ?? [];
  }

  List<ChildPhoto> getPhotos() {
    return _childList?.photos ?? [];
  }
}
