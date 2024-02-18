import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/components/utils/current_time_body.dart';
import 'package:where_child_bus_guardian/pages/daily_page/components/daily_record_slider.dart';
import 'package:where_child_bus_guardian/service/get_child_list_by_guardian_id.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class DailyPage extends StatefulWidget {
  final GuardianResponse guardian;

  const DailyPage({super.key, required this.guardian});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  List<Child> children = [];
  bool _isLoading = true;
  bool _isFailLoading = false;

  @override
  void initState() {
    super.initState();
    _loadChildList();
  }

  Future<void> _loadChildList() async {
    String guardianId = widget.guardian.id;
    List<Child> childList = await getChildList(guardianId);
    try {
      if (mounted) {
        setState(() {
          children = childList;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("園児リストのロード中にエラーが発生しました: $e");
      }
      setState(() => {_isLoading = false, _isFailLoading = true});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CurrentTimeBody(),
                const SizedBox(
                  height: 20,
                ),
                if (_isFailLoading) loadFailText(),
                if (children.isEmpty) noChildDataText(),
                DailyRecordSlider(children: children),
              ],
            ),
          );
  }

  Widget loadFailText() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text("園児のロードに失敗しました"),
    );
  }

  Widget noChildDataText() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text("園児が登録されていません"),
    );
  }
}
