import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/components/util/operation_button.dart';
import 'package:where_child_bus/models/bus_edit_page_type.dart';
import 'package:where_child_bus/models/nursery_bus_data.dart';
import 'package:where_child_bus/pages/bus_list_page/bottom_sheet.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_edit_page.dart';
import 'package:where_child_bus/service/get_bus_list_by_nursery_id.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus/service/update_bus_status.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BusListPage extends StatefulWidget {
  const BusListPage({
    super.key,
  });

  @override
  State<BusListPage> createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {
  List<Bus> buses = [];
  bool _isLoading = true;
  bool _isFailLoading = false;

  @override
  void initState() {
    super.initState();
    _loadBusList();
  }

  Future<void> _fetchBusList() async {
    _isLoading = true;

    try {
      GetBusListByNurseryIdResponse busList =
          await getBusList(NurseryData().getNursery().id);
      NurseryBusData().setBusListResponse(busList);
      if (mounted) {
        setState(() {
          buses = NurseryBusData().getBusList();
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("バスリストのロード中にエラーが発生しました: $e");
      }
      setState(() => {_isLoading = false, _isFailLoading = true});
    }
  }

  Future<void> _loadBusList() async {
    if (NurseryBusData().getBusList().isNotEmpty) {
      if (mounted) {
        setState(() {
          buses = NurseryBusData().getBusList();
          _isLoading = false;
        });
      }
      return;
    } else {
      await _fetchBusList();
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
                if (_isFailLoading) loadFailText(),
                if (buses.isEmpty) busNotRegisteredText(),
                Expanded(
                  child: RefreshIndicator(
                      onRefresh: _fetchBusList, child: listViewBuilder()),
                )
              ],
            ),
          );
  }

  Widget busNotRegisteredText() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text("バスが登録されていません"),
    );
  }

  Widget addBusButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BusEditPage(
                      busEditPageType: BusEditPageType.create,
                    )));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      itemCount: buses.length,
      itemBuilder: (BuildContext context, int index) {
        return busListCard(buses[index]);
      },
    );
  }

  Widget busListCard(Bus bus) {
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
                      bus: bus,
                    );
                  });
            },
            child: Row(
              children: [
                busPhoto(bus.busStatus),
                busNameAndDescription(bus.name, bus.busStatus),
                const Spacer(),
                OperationButton(
                  bus: bus,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget busPhoto(BusStatus busStatus) {
    late String imagePath;
    if (busStatus == BusStatus.BUS_STATUS_RUNNING) {
      imagePath = "assets/images/bus_operating.png";
    } else if (busStatus == BusStatus.BUS_STATUS_STOPPED) {
      imagePath = "assets/images/bus_not_operating.png";
    } else {
      imagePath = "assets/images/bus_maintenance.png";
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

  Widget busDescription(BusStatus busStatus) {
    late String description;
    if (busStatus == BusStatus.BUS_STATUS_RUNNING) {
      description = "運行中";
    } else if (busStatus == BusStatus.BUS_STATUS_MAINTENANCE) {
      description = "経路未設定";
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

  Widget busNameAndDescription(String name, BusStatus busStatus) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [busName(name), busDescription(busStatus)],
      ),
    );
  }

  Widget loadFailText() {
    return const Text(
      "バスのロードに失敗しました",
      style: TextStyle(color: Colors.red, fontSize: 16),
    );
  }
}
