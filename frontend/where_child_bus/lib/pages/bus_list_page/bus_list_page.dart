import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/bottom_sheet.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_edit_page.dart';
import 'package:where_child_bus/pages/bus_list_page/service/get_bus_list_by_nursery_id.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusListPage extends StatefulWidget {
  final NurseryResponse nursery;

  const BusListPage({super.key, required this.nursery});

  @override
  State<BusListPage> createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {
  final busesOperatingState = [
    true,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<Bus> buses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBusList();
  }

  Future<void> _loadBusList() async {
    String nurseryId = widget.nursery.id;
    List<Bus> busList = await getBusList(nurseryId);
    try {
      if (mounted) {
        setState(() {
          buses = busList;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("バスリストのロード中にエラーが発生しました: $e");
      }
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageBody(),
      floatingActionButton: addBusButton(),
    );
  }

  Widget pageBody() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: listViewBuilder(),
                )
              ],
            ),
          );
  }

  Widget addBusButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BusEditPage()));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      //TODO: 実際にはAPIからデータを取得
      itemCount: buses.length,
      itemBuilder: (BuildContext context, int index) {
        return busListCard(buses[index].name, buses[index].status);
      },
    );
  }

  //TODO: 将来的にBus型を受け取る, 将来的にモーダルにバスを渡す
  Widget busListCard(String name, Status busStatus) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () async {
              await showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: false,
                  enableDrag: true,
                  isDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  builder: (context) {
                    return BottomSheetWidget(
                      busName: name,
                    );
                  });
            },
            child: Row(
              children: [
                busPhoto(busStatus),
                busNameAndDescription(name, busStatus),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget busPhoto(Status busStatus) {
    late String imagePath;
    if (busStatus == Status.STATUS_RUNNING) {
      imagePath = "assets/images/bus_operating.png";
    } else {
      imagePath = "assets/images/bus_not_operating.png";
    }

    return SizedBox(
        width: 100,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget busName(name) {
    return Text(
      name,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
    );
  }

  Widget busDescription(Status busStatus) {
    late String description;
    if (busStatus == Status.STATUS_RUNNING) {
      description = "運行中";
    } else if (busStatus == Status.STATUS_MAINTEINANCE) {
      description = "メンテナンス中";
    } else {
      description = "停止中";
    }
    return Text(
      description,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  //TODO: 将来的には説明文も引数として受け取る
  Widget busNameAndDescription(String name, Status busStatus) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //TODO:動的になる
        children: [busName(name), busDescription(busStatus)],
      ),
    );
  }
}
