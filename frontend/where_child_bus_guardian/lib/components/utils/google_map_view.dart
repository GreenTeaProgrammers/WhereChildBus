import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../../pages/map_page/map_page.dart';
import 'package:where_child_bus_guardian/util/google_map_manager.dart';

class GoogleMapView extends StatefulWidget {
  final List<Waypoint> waypoints;
  double nurseryLatitude, nurseryLongitude;
  double busLatitude, busLongitude;

  GoogleMapView(
      {super.key,
      required this.waypoints,
      required this.nurseryLatitude,
      required this.nurseryLongitude,
      required this.busLatitude,
      required this.busLongitude});

  @override
  State<GoogleMapView> createState() => _GoogleMapView();
}

class _GoogleMapView extends State<GoogleMapView> {
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(0.0, 0.0), zoom: 14);

  late GoogleMapController mapController;
  Timer? _timer;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        _addMarker(LatLng(widget.nurseryLatitude, widget.nurseryLongitude),
            "保育園", BitmapDescriptor.defaultMarker);

        _addMarker(LatLng(widget.busLatitude, widget.busLongitude), "バス",
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

        widget.waypoints.forEach((Waypoint waypoint) {
          _addMarker(LatLng(waypoint.latitude, waypoint.longitude),
              waypoint.name, BitmapDescriptor.defaultMarkerWithHue(90));
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: googleMapBody(),
            )));
  }

  Widget googleMapBody() {
    _addMarker(LatLng(widget.busLatitude, widget.busLongitude), "バス",
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

    return GoogleMap(
      initialCameraPosition: _initialLocation,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
        _getPolyline(widget.waypoints);
      },
      markers: Set<Marker>.of(markers.values),
      polylines: Set<Polyline>.of(polylines.values),
    );
  }

  void _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    setState(() {
      markers[markerId] = marker;
    });
  }

  void _addPolyline() {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blue,
        points: polylineCoordinates,
        width: 5);
    setState(() {
      polylines[id] = polyline;
    });
  }

  void _getPolyline(List<Waypoint> waypoints) async {
    try {
      polylineCoordinates = await GoogleMapAPIManager().getPolylinePoints(
        startLat: widget.busLatitude.toString(),
        startLng: widget.busLongitude.toString(),
        endLat: widget.nurseryLatitude.toString(),
        endLng: widget.nurseryLongitude.toString(),
        waypoints: waypoints,
      );
      developer.log("polylineCoordinates: $polylineCoordinates",
          name: "GetPolyline");
      _addPolyline();
    } catch (e) {
      print(e);
    }

    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(widget.nurseryLatitude, widget.nurseryLongitude),
        zoom: 14)));
  }
}
