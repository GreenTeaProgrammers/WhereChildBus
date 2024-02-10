import 'package:flutter/material.dart';

class BusListPage extends StatefulWidget {
  const BusListPage({super.key});

  @override
  State<BusListPage> createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {
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

  Widget busListCard(String name, bool isBusOperating) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.white,
          child: Row(
            children: [
              busPhoto(isBusOperating),
              busNameAndDescription(name),
            ],
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

  Widget busNameAndDescription(String name) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          busName(name),
          busDescription("テストの説明文")
        ],
      ),
    );
  }
}
