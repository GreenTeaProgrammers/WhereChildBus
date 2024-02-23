import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/widgets/operation_button.dart';
import 'package:where_child_bus/models/bus_edit_page_type.dart';
import 'package:where_child_bus/models/nursery_bus_data.dart';
import 'package:where_child_bus/pages/bus_list_page/bottom_sheet.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_edit_page.dart';
import 'package:where_child_bus/service/get_bus_list_by_nursery_id.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

import 'widgets/bus_description_text.dart';
import 'widgets/bus_image.dart';
import 'widgets/bus_name_text.dart';
import 'widgets/load_fail_text.dart';
import 'widgets/no_bus_registered_text.dart';

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
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

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
      body: _createPageBody(),
      floatingActionButton: _createAddBusButton(),
    );
  }

  Widget _createPageBody() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isFailLoading) const LoadFailText(),
                if (buses.isEmpty) const NoBusRegisteredText(),
                Expanded(
                  child: RefreshIndicator(
                      onRefresh: _fetchBusList, child: _listViewBuilder()),
                )
              ],
            ),
          );
  }

  Widget _createAddBusButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const BusEditPage(
                      busEditPageType: BusEditPageType.create,
                    )));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _listViewBuilder() {
    return ListView.builder(
      itemCount: buses.length,
      itemBuilder: (BuildContext context, int index) {
        return _createBusListCard(buses[index]);
      },
    );
  }

  Widget _createBusListCard(Bus bus) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BusImage(busStatus: bus.busStatus),
                _createBusNameAndDescription(bus.name, bus.busStatus),
                // const Spacer(),
                OperationButton(
                  bus: bus,
                  onBusUpdated: (Bus updatedBus) {
                    if (bus.busStatus == BusStatus.BUS_STATUS_MAINTENANCE) {
                      _fetchBusList();
                    } else {
                      int index = buses.indexOf(bus);
                      if (index != -1) {
                        setState(() {
                          buses[index] = updatedBus;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createBusNameAndDescription(String name, BusStatus busStatus) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BusNameText(name: name),
            BusDescriptionText(busStatus: busStatus)
          ],
        ),
      ),
    );
  }
}
