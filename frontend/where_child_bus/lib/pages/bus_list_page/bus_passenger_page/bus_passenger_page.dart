import "dart:developer" as developer;
import "package:flutter/material.dart";
import "package:where_child_bus/components/child_list/child_list_with_mark.dart";
import "package:where_child_bus/service/check_child_in_bus.dart";
import "package:where_child_bus/service/get_child_list_by_bus_id.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

class ChildrenAndPhotos {
  final List<Child> children;
  final List<ChildPhoto> photos;
  final List<bool> isInBus;

  ChildrenAndPhotos(
      {required this.children, required this.photos, required this.isInBus});
}

class BusPassengerPage extends StatefulWidget {
  final Bus bus;

  const BusPassengerPage({super.key, required this.bus});

  @override
  State<BusPassengerPage> createState() => _BusPassengerPage();
}

class _BusPassengerPage extends State<BusPassengerPage> {
  late Future<ChildrenAndPhotos> _childrenFuture;

  Future<ChildrenAndPhotos> _loadChildren() async {
    try {
      var res = await getChildListByBusIDService(widget.bus.id);
      List<bool> isInBus = [];
      List<ChildPhoto> photos = [];
      photos = res.photos;

      for (var child in res.children) {
        var res = await checkIsChildInBusService(child.id);
        isInBus.add(res.isInBus);
      }

      developer.log("園児のロードが完了しました", name: "LoadChildren");
      return ChildrenAndPhotos(
          children: res.children, photos: photos, isInBus: isInBus);
    } catch (e) {
      developer.log("園児のロード中にエラーが発生しました: $e", name: "LoadChildren");
      throw Exception('Failed to load children');
    }
  }

  @override
  void initState() {
    super.initState();
    _childrenFuture = _loadChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("乗客情報"),
      ),
      body: FutureBuilder<ChildrenAndPhotos>(
        future: _childrenFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('エラーが発生しました: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ChildListWithMark(
              childNames:
                  snapshot.data!.children.map((child) => child.name).toList(),
              groupNames: snapshot.data!.children
                  .map((child) => child.age.toString())
                  .toList(),
              isInBus: snapshot.data!.isInBus,
              images: snapshot.data!.photos,
            );
          } else {
            return const Text("データがありません");
          }
        },
      ),
    );
  }
}
