import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[isRideBusToggleButton()],
      ),
    );
  }

  Widget isRideBusToggleButton() {
    return Column(
      children: [
        toggleButtonBody("乗る", true),
        const SizedBox(height: 20),
        toggleButtonBody("乗らない", false),
      ],
    );
  }

  Widget toggleButtonBody(String text, bool isRide) {
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
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        child: Text(text),
      ),
    );
  }
}
