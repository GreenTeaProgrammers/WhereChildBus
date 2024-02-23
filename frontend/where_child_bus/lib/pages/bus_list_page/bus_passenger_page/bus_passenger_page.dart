import "dart:developer" as developer;
import "package:flutter/material.dart";
import "package:where_child_bus/components/child_list/child_list_with_mark.dart";
import "package:where_child_bus/service/get_child_list_by_bus_id.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

class BusPassengerPage extends StatefulWidget {
  final Bus bus;

  const BusPassengerPage({super.key, required this.bus});

  @override
  State<BusPassengerPage> createState() => _BusPassengerPage();
}

class _BusPassengerPage extends State<BusPassengerPage> {
  List<Child> _childList = [];
  List<ChildPhoto> _images = [];
  bool _isLoading = false;

  Future<void> _loadChildren() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      var res = await getChildListByBusIDService(widget.bus.id);
      if (mounted) {
        setState(() {
          _childList = res.children;
          _images = res.photos;
          _isLoading = false;
        });
      }
    } catch (e) {
      developer.log("園児のロード中にエラーが発生しました: $e", name: "LoadChildren");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppBar(),
      body: pageBody(),
    );
  }

  AppBar pageAppBar() {
    return AppBar(
      title: const Text("乗客情報"),
    );
  }

  Widget pageBody() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ChildListWithMark(
            childNames: _childList.map((child) => child.name).toList(),
            groupNames:
                _childList.map((child) => child.age.toString()).toList(),
            images: _images);
  }
}
