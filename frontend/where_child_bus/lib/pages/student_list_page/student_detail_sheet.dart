import "dart:developer" as developer;
import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/student_list_page/student_edit_page.dart';
import 'package:where_child_bus/service/get_guardians_list_by_child_id.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class StudentDetailSheet extends StatefulWidget {
  final Child child;

  const StudentDetailSheet({Key? key, required this.child}) : super(key: key);

  @override
  _StudentDetailSheetState createState() => _StudentDetailSheetState();
}

class _StudentDetailSheetState extends State<StudentDetailSheet> {
  late GuardianResponse guardian;
  bool _isLoading = false;
  bool _isFailLoading = false;

  @override
  void initState() {
    super.initState();
    _loadGuardian();
  }

  Future<void> _loadGuardian() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var res = await getGuardianListByChildIdService(widget.child.id);

      if (mounted) {
        setState(() {
          guardian = res;
          _isLoading = false;
        });
      }
    } catch (error) {
      developer.log("Caught ErrorAAAAAA", error: error);
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
    return Container(
      padding: const EdgeInsets.all(30.0),
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: modalBody(context),
    );
  }

  Widget modalBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        modalHeader(context),
        Container(
            margin: const EdgeInsets.only(top: 20),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : childDetailList())
      ],
    );
  }

  Widget modalHeader(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.topRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => StudentEditPage(
                      child: widget.child,
                    )));
          },
          child: const Icon(Icons.edit),
        ),
      ),
      childImageAndChildName(),
    ]);
  }

  Widget childImageAndChildName() {
    return Row(children: <Widget>[
      childFaceImage(),
      const SizedBox(
        width: 50,
      ),
      Text(widget.child.name,
          style: const TextStyle(color: Colors.black, fontSize: 24)),
    ]);
  }

  Widget childFaceImage() {
    // 画像を受け取る処理を将来的に実装
    return const SizedBox(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.grey,
      ),
    );
  }

  Widget childDetailList() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_isLoading == false && _isFailLoading) {
      return const Text("ロードに失敗しました");
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          childDetailItem("年齢", "${widget.child.age}歳"),
          // childDetailItem("クラス", "1組"),
          childDetailItem("保護者氏名", "${guardian.name}"),
          childDetailItem("保護者連絡先", guardian.phoneNumber),
          childDetailItem("利用バス", "○○コース"),
          // childDetailItem("乗降場所", "○○駐車場前"),
        ],
      );
    }
  }

  Widget childDetailItem(String title, String element) {
    return Row(
      children: <Widget>[
        detailItemTitle(title),
        const SizedBox(
          width: 50,
        ),
        Text(element, style: const TextStyle(color: Colors.black, fontSize: 18))
      ],
    );
  }

  Widget detailItemTitle(String title) {
    return SizedBox(
      width: 18 * 6 + 6,
      child: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
