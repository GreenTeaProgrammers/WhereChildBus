import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/bottom_sheet.dart';

class BusListPage extends StatefulWidget {
  const BusListPage({super.key});

  @override
  State<BusListPage> createState() => _BusListPageState();
}


class _BusListPageState extends State<BusListPage> {
  //TODO: 将来的には動的にデータを受け取る。そのためのメソッドが増える
  final items = ["バス1", "バス2", "バス3", "バス4", "バス5", "バス5", "バス5", "バス5", "バス5"];
  final busesOperatingState = [true, false, true, false, false, false, false, false, false];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: listViewBuilder(),
          )
        ],
      ),
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      //TODO: 実際にはAPIからデータを取得
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return busListCard(items[index], busesOperatingState[index]);
      },
    );
  }

  //TODO: 将来的にBus型を受け取る, 将来的にモーダルにバスを渡す
  Widget busListCard(String name, bool isBusOperating) {
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
                    return BottomSheetWidget(busName: name,);
                  });
            },
            child: Row(
              children: [
                busPhoto(isBusOperating),
                busNameAndDescription(name),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget busPhoto(bool isBusOperating) {
    String imagePath = isBusOperating
          ? "assets/images/bus_operating.png"
          : "assets/images/bus_not_operating.png";

    return SizedBox(
      width: 100,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          imagePath,
          fit:BoxFit.cover,
        ),
      )
    );
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

  Widget busDescription(String description) {
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
  Widget busNameAndDescription(String name) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        //TODO:動的になる
        children: [
          busName(name),
          busDescription("テストの説明文")
        ],
      ),
    );
  }
}

