import "package:flutter/material.dart";
  
class StationsList extends StatelessWidget {
  final List<String> busStationsList;

  StationsList({required this.busStationsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: stationsList(context, busStationsList));
  }

  //将来的にはStationのListを参照
  Widget stationsList(BuildContext context, List<String> busStationsList) {
    return ListView.builder(
      itemCount: busStationsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(50,  10,  0,  0),
          child: stationsListElement(busStationsList[index]),
        );
      },
    );
  }

  Widget stationsListElement(String stationName) {
    return Text(
      stationName,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize:  18,
      ),
    );
  }
}