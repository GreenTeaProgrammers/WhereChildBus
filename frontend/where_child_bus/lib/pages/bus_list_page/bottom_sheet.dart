import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/models/bus_edit_page_type.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/bus_edit_page.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/confirm_button.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/guardians_list.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/styles/styles.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_passenger_page/bus_passenger_page.dart';
import 'package:where_child_bus/pages/bus_list_page/service/get_guardians_list_by_bus_id.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class BottomSheetWidget extends StatefulWidget {
  final Bus bus;

  const BottomSheetWidget({super.key, required this.bus});

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  List<GuardianResponse> guardians = [];
  bool _isLoading = true;
  bool _isFailLoading = false;

  @override
  void initState() {
    super.initState();
    _loadGuardians();
  }

  Future<void> _loadGuardians() async {
    try {
      var res = await getGuardiansListByBusIdService(widget.bus.id);
      if (mounted) {
        setState(() {
          guardians = res.guardians;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("保護者リストのロード中にエラーが発生しました: $e");
      }
      if (mounted) {
        setState(() => {_isLoading = false, _isFailLoading = true});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Stack(children: [
        modalBody(context),
        editButton(context),
      ]),
    );
  }

  Widget modalBody(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        modalHeader(widget.bus.name, "test"),
        _isFailLoading ? loadingFailText() : guardiansListView(),
        ConfirmButton(
          buttonText: "乗客情報",
          onTap: () => moveToBusPassengerPage(context),
        ),
      ],
    ));
  }

  Widget guardiansListView() {
    return _isLoading
        ? const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : GuardiansList(
            guardiansList: guardians,
          );
  }

  moveToBusPassengerPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BusPassengerPage()));
  }

  Widget editButton(BuildContext context) {
    return Align(
      alignment: const Alignment(1, -0.98),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BusEditPage(
                          bus: widget.bus,
                          busEditPageType: BusEditPageType.update,
                        )));
          },
          style: editButtonStyle(),
          child: const Text("Edit",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
        ),
      ),
    );
  }

  Widget modalHeader(String busCourseName, String busOperatorName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          busThumbnail(widget.bus.status),
          courseAndOperator(busCourseName, busOperatorName),
        ],
      ),
    );
  }

  Widget courseAndOperator(String courseName, String operatorName) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          courseNameText(courseName),
          operatorNameText(operatorName),
        ],
      ),
    );
  }

  Widget loadingFailText() {
    return const Text(
      "保護者リストの読み込みに失敗しました",
      style: TextStyle(
        color: Colors.red,
        fontSize: 16,
      ),
    );
  }

  Widget courseNameText(String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 150),
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget operatorNameText(String name) {
    return Text("担当：$name",
        style: const TextStyle(
          color: Colors.grey,
        ));
  }

  Widget busThumbnail(Status busStatus) {
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
}
