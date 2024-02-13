import 'package:flutter/material.dart';
import '../components/utils/current_time_body.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  bool isRideBus = true;

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
          toggleButtonBody(),
        ],
      ),
    );
  }

  Widget toggleButtonBody() {
    return Column(
      children: [
        const Text(
          "本日の乗車予定",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        isRideBusToggleButtonBody("乗る", true),
        const SizedBox(height: 20),
        isRideBusToggleButtonBody("乗らない", false),
      ],
    );
  }

  Widget isRideBusToggleButtonBody(String text, bool isRide) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isRideBus = isRide;
          });
        },
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 20),
          backgroundColor: isRideBus != isRide ? Colors.grey : null,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        child: Text(text),
      ),
    );
  }
}
