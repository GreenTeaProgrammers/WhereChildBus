import 'package:flutter/material.dart';
import '../components/utils/current_time_body.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  var isRideMorningBus = true;
  var isRideEveningBus = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CurrentTimeBody(),
          const SizedBox(
            height: 50,
          ),
          toggleSwitchBody(context),
        ],
      ),
    );
  }

  Widget toggleSwitchBody(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              "本日の乗車予定",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  busTitleAndToggleSwitch(
                      context, "朝のバス", isRideMorningBus, true),
                  busTitleAndToggleSwitch(
                      context, "夕方のバス", isRideEveningBus, false),
                ],
              ),
            ),
          ],
        ));
  }

  Widget busTitleAndToggleSwitch(
      BuildContext context, String title, bool isRide, bool isMorning) {
    return Column(children: [
      Text(title),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          displayRideOrNot(context, isRide),
          toggleSwitch(context, isRide, isMorning),
        ],
      ),
    ]);
  }

  Widget toggleSwitch(BuildContext context, bool isRide, bool isMorning) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Switch(
            value: !isRide,
            onChanged: (value) {
              setState(() {
                isMorning
                    ? isRideMorningBus = !value
                    : isRideEveningBus = !value;
              });
            }));
  }

  Widget displayRideOrNot(BuildContext context, bool isRide) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: isRide ? Colors.green[100] : Colors.red[100],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: isRide ? Colors.green : Colors.red)),
      child: Text(
        isRide ? "乗る" : "乗らない",
        style: TextStyle(
            color: isRide ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
