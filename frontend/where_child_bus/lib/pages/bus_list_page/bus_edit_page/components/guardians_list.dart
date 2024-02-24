import "package:flutter/material.dart";
import "package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart";

class GuardiansList extends StatelessWidget {
  final List<GuardianResponse> guardiansList;

  const GuardiansList({super.key, required this.guardiansList});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: guardiansListView(context, guardiansList));
  }

  Widget guardiansListView(
      BuildContext context, List<GuardianResponse> guardiansList) {
    return ListView.builder(
      itemCount: guardiansList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.1, 10, 0, 0),
          child: stationsListElement(guardiansList[index].name),
        );
      },
    );
  }

  Widget stationsListElement(String guardianName) {
    return Text(
      "$guardianNameさん",
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
