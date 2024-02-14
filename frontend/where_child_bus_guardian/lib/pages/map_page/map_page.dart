import 'package:flutter/material.dart';
import '../styles/styles.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var isRide = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[mapBody(), pageBottomBody()],
      ),
    );
  }

  Widget mapBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.grey,
    );
  }

  Widget pageBottomBody() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            arrivalTimeBody(),
            isRideScheduled(),
          ],
        ),
      ),
    );
  }

  Widget arrivalTimeBody() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          fieldTitleAndTime("到着まで", "n分"),
          fieldTitleAndTime("到着予定時刻", "HH:MM")
        ]);
  }

  Widget fieldTitleAndTime(String title, String time) {
    return Column(
      children: <Widget>[
        Text(title),
        Text(
          time,
          style: const TextStyle(fontSize: 30),
        )
      ],
    );
  }

  Widget isRideScheduled() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("乗車予定: "),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: statusFieldDecoration(isRide),
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                isRide ? "あり" : "なし",
                style: statusFieldTextStyle(isRide),
                textAlign: TextAlign.center,
              )),
        )
      ],
    );
  }
}
