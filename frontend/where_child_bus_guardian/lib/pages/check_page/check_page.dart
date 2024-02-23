import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:where_child_bus_guardian/components/utils/current_time_body.dart';
import 'package:where_child_bus_guardian/pages/check_page/components/bus_toggle_button.dart';
import 'package:where_child_bus_guardian/service/update_guardian_status.dart';
import 'package:where_child_bus_guardian/util/guardian_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pb.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final GuardianResponse guardian = GuardianData().getGuardian();

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
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.16,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 220, 198, 161),
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleSwitchBody(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 220, 198, 161),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              "本日の乗車予定",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  busTitleAndToggleButton(
                      "朝のバス", guardian.isUseMorningBus, true),
                  SizedBox(
                    height: 20,
                  ),
                  busTitleAndToggleButton(
                      "夕方のバス", guardian.isUseEveningBus, false),
                ],
              ),
            ),
          ],
        ));
  }

  Widget busTitleAndToggleButton(
      String title, bool isRideBus, bool isMorningBus) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        BusToggleButton(
          guardian: guardian,
          isMorningBus: isMorningBus,
          isUseBus: isRideBus,
        ),
      ],
    );
  }
}
