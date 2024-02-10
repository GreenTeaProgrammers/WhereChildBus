import 'package:flutter/material.dart';

class BusListPage extends StatefulWidget {
  const BusListPage({super.key});

  @override
  State<BusListPage> createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {
  final items = ["バス1", "バス2", "バス3", "バス4", "バス5", "バス5", "バス5", "バス5", "バス5"];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          pageTitle(),
          Expanded(
            child: listViewBuilder(),
          )
        ],
      ),
    );
  }

  Widget pageTitle() {
    return const Padding(
      padding:  EdgeInsets.all(10),
      child:  Text(
        '送迎バスコース一覧',
      ),
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      //TODO: 実際にはAPIからデータを取得
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return busListCard(items[index]);
      },
    );
  }

  Widget busListCard(String name) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: busNameAndDescription(name),
    );
  }

  Widget busPhoto() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Card(
        child: Text("ここに画像が来る")
      ),
    );
  }

  Widget busName(name) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget busDescription(String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:  Text(
        description,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget busNameAndDescription(String name) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          busName(name),
          busDescription("テストの説明文")
        ],
      ),
    );
  }
}
