import "dart:developer" as developer;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus/util/api/busRoute.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class NextStationButton extends StatefulWidget {
  final Bus bus;
  final BusType busType;
  Function(Bus) onPressed;

  NextStationButton(
      {Key? key,
      required this.bus,
      required this.busType,
      required this.onPressed})
      : super(key: key);

  @override
  State<NextStationButton> createState() => _NextStationButtonState();
}

class _NextStationButtonState extends State<NextStationButton> {
  BusRoute? _busRoute;
  bool _isLoading = false;

  Future<void> _fetchMorningBusRoute() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      final res = await getBusRouteByBusId(widget.bus.id, widget.busType);
      if (mounted) {
        setState(() {
          _busRoute = res.busRoute;
          _isLoading = false;
        });
      }
    } catch (error) {
      developer.log("Caught Error By NextStationButton:",
          error: error, name: "NextStationButton");
    }
  }

  Future<void> _updateNextStation() async {
    _isLoading = true;
    var nextStationIndex = _busRoute!.orderedStations
            .indexWhere((station) => station.id == widget.bus.nextStationId) +
        1;

    if (nextStationIndex >= _busRoute!.orderedStations.length) {
      return;
    }
    try {
      var res = await updateNextStation(
          widget.bus.id, _busRoute!.orderedStations[nextStationIndex].id);
      widget.onPressed(res.bus);
      _isLoading = false;
    } catch (error) {
      developer.log("Caught Error By NextStationButton:",
          error: error, name: "NextStationButton");
    } finally {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMorningBusRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: _isLoading
          ? const Center(
              child: SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator()))
          : ElevatedButton(
              onPressed: _updateNextStation,
              child: const Text("次の停留所へ"),
            ),
    );
  }
}
