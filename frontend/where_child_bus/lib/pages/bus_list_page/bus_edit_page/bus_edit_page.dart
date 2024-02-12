import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/input_element.dart';
import 'package:where_child_bus/pages/bus_list_page/bus_edit_page/components/stations_list.dart';

class BusEditPage extends StatelessWidget {
  final List<String> busStations;

  BusEditPage({required List<String> this.busStations});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: pageBody(context)
      ),
    );
  }

  Widget pageBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          inputFieldsAndThumbnail(context),
          StationsList(busStationsList: busStations)
        ],
      ),
    );
  }

  Widget inputFieldsAndThumbnail(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputElement(inputFieldTitle: "コース名", labelText: "コース名", hintText: "コース名を入力してください"),
          busThumbnail(context),
        ],
      );
  }


  Widget busThumbnail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8),
          child:  Text("サムネイル"),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.3,
          child: Card(),
        ),
      ]
    );
  }
}