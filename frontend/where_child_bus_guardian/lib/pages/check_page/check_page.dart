import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
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
                  busTitleAndToggleButton(
                      context, "朝のバス", isRideMorningBus, true),
                  busTitleAndToggleButton(
                      context, "夕方のバス", isRideEveningBus, false),
                ],
              ),
            ),
          ],
        ));
  }

  Widget busTitleAndToggleButton(
      BuildContext context, String title, bool isRide, bool isMorning) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
      toggleSwitch(context, isRide, isMorning),
    ]);
  }

  Widget toggleSwitch(BuildContext context, bool isRide, bool isMorning) {
    int selectedIndex = isRide ? 0 : 1;
    return FlutterToggleTab(
      width: 70,
      height: 50,
      borderRadius: 15,
      selectedBackgroundColors: const [Colors.blue],
      selectedTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      unSelectedTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      labels: const ["乗る", "乗らない"],
      selectedIndex: selectedIndex,
      selectedLabelIndex: (index) {
        setState(() {
          setRideState(isMorning, index);
        });
      },
      marginSelected: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
    );
  }

  void setRideState(bool isMorning, int index) {
    if (isMorning) {
      isRideMorningBus = index == 0;
    } else {
      isRideEveningBus = index == 0;
    }
  }
}
