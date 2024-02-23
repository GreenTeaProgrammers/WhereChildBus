import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/arrival_time.dart';
import 'package:where_child_bus_guardian/pages/map_page/map_page.dart';
import '../../styles/styles.dart';
import 'package:where_child_bus_guardian/pages/map_page/components/arrival_time.dart';

class MapPageBottom extends StatefulWidget {
  final GuardianResponse guardian;
  final Bus bus;
  final List<Station> stations;
  final List<Waypoint> waypoints;
  final String nextStationId;
  final double busLatitude;
  final double busLongitude;
  final double nurseryLatitude;
  final double nurseryLongitude;

  const MapPageBottom(
      {Key? key,
      required this.guardian,
      required this.bus,
      required this.stations,
      required this.waypoints,
      required this.nextStationId,
      required this.busLatitude,
      required this.busLongitude,
      required this.nurseryLatitude,
      required this.nurseryLongitude})
      : super(key: key);

  @override
  State<MapPageBottom> createState() => _MapPageBottomState();
}

class _MapPageBottomState extends State<MapPageBottom> {
  Station guardianStation = Station();

  @override
  void initState() {
    super.initState();
    _loadGuardianStationData();
    if (mounted) {
      setState(() {
        widget.guardian.isUseEveningBus = widget.guardian.isUseEveningBus;
        widget.guardian.isUseEveningBus = widget.guardian.isUseEveningBus;
      });
    }
  }

  Future<void> _loadGuardianStationData() async {
    try {
      widget.stations.forEach((station) {
        if (station.guardianId == widget.guardian.id) {
          setState(() {
            guardianStation = station;
          });
        }
      });
    } catch (error) {
      developer.log('停留所の読み込みに失敗しました: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ArrivalTime(
              bus: widget.bus,
              waypoints: widget.waypoints,
              nextStationId: widget.nextStationId,
              busLatitude: widget.busLatitude,
              busLongitude: widget.busLongitude,
              guardianLatitude: guardianStation.latitude,
              guardianLongitude: guardianStation.longitude,
            ),
          ],
        ),
      ),
    );
  }
}
