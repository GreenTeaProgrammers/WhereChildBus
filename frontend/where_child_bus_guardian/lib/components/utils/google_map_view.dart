import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Waypoint {
  final double latitude;
  final double longitude;
  final String name;

  Waypoint(
      {required this.latitude, required this.longitude, required this.name});
}

//TODO: 将来的に停留所のデータを受け取る
final List<Waypoint> waypoints = [
  Waypoint(latitude: 34.7159, longitude: 137.7368, name: "停留所1"),
  Waypoint(latitude: 34.7108, longitude: 137.7261, name: "停留所2"),
  Waypoint(latitude: 34.7169, longitude: 137.7285, name: "停留所3"),
];

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapView();
}

class _GoogleMapView extends State<GoogleMapView> {
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(0.0, 0.0), zoom: 14);

  late GoogleMapController mapController;

  //TODO: 将来的に保育園の緯度経度を受け取る
  double nurseryLatitude = 34.7056, nurseryLongitude = 137.7343;

  //TODO: 将来的にバスの現在位置を受け取る
  double busLatitude = 34.7057, busLongitude = 137.7317;

  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = dotenv.get("GOOGLE_MAP_API_KEY");

  @override
  void initState() {
    super.initState();
    _addMarker(LatLng(nurseryLatitude, nurseryLongitude), "保育園",
        BitmapDescriptor.defaultMarker);

    _addMarker(LatLng(busLatitude, busLongitude), "バス",
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

    waypoints.forEach((Waypoint waypoint) {
      _addMarker(LatLng(waypoint.latitude, waypoint.longitude), waypoint.name,
          BitmapDescriptor.defaultMarkerWithHue(90));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: GoogleMap(
          initialCameraPosition: _initialLocation,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            _getPolyline(waypoints);
          },
          markers: Set<Marker>.of(markers.values),
          polylines: Set<Polyline>.of(polylines.values),
        ));
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyline() {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blue,
        points: polylineCoordinates,
        width: 5);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline(List<Waypoint> waypoints) async {
    List<PolylineWayPoint> polylineWayPoints = waypoints
        .map((waypoint) => PolylineWayPoint(
            location: "${waypoint.latitude},${waypoint.longitude}"))
        .toList();
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(nurseryLatitude, nurseryLongitude),
        PointLatLng(nurseryLatitude, nurseryLongitude),
        travelMode: TravelMode.driving,
        avoidTolls: true,
        avoidHighways: false,
        avoidFerries: false,
        wayPoints: polylineWayPoints,
        optimizeWaypoints: true,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      _addPolyline();
    } catch (e) {
      print(e);
    }

    if (polylineCoordinates.isNotEmpty) {
      double minLat = polylineCoordinates.first.latitude;
      double maxLat = polylineCoordinates.first.latitude;
      double minLng = polylineCoordinates.first.longitude;
      double maxLng = polylineCoordinates.first.longitude;

      for (LatLng point in polylineCoordinates) {
        if (point.latitude < minLat) minLat = point.latitude;
        if (point.latitude > maxLat) maxLat = point.latitude;
        if (point.longitude < minLng) minLng = point.longitude;
        if (point.longitude > maxLng) maxLng = point.longitude;
      }

      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      );
      mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
    }
  }
}
