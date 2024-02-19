import "dart:developer" as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/child_list.dart';
import 'package:where_child_bus/models/child_data.dart';
import 'package:where_child_bus/pages/student_list_page/student_edit_page.dart';
import 'package:where_child_bus/service/get_child_list_by_nursery_id.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/child.pbgrpc.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class ChildListPage extends StatefulWidget {
  const ChildListPage({
    super.key,
  });

  @override
  State<ChildListPage> createState() => _ChildListPageState();
}

class _ChildListPageState extends State<ChildListPage> {
  List<Child> children = [];
  List<ChildPhoto> photos = [];
  bool _isLoading = false;
  bool _isFailLoading = false;

  @override
  void initState() {
    super.initState();
    _loadChildren();
  }

  Future<void> _loadChildren() async {
    try {
      _isLoading = true;

      // If the child list is already loaded, use it
      if (NurseryChildListData().getChildList().isNotEmpty) {
        if (mounted) {
          setState(() {
            children = NurseryChildListData().getChildList();
            photos = NurseryChildListData().getPhotos();
            _isLoading = false;
          });
        }
        return;
      } else {
        GetChildListByNurseryIDResponse res =
            await getChildListByNurseryIdService(NurseryData().getNursery().id);
        NurseryChildListData().setChildListResponse(res);
        if (mounted) {
          setState(() {
            children = res.children;
            photos = res.photos;
            _isLoading = false;
          });
        }
      }
    } catch (error) {
      if (kDebugMode) {
        developer.log("子供のロード中にエラーが発生しました", error: error);
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
          _isFailLoading = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const StudentEditPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget pageBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_isFailLoading) {
      return const Center(
        child: Text('Failed to load children.'),
      );
    } else {
      return ChildList(children: children, images: photos);
    }
  }
}
