import "dart:developer" as developer;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:where_child_bus/pages/bus_list_page/create_station_page/locate_user.dart';

class GoogleMapWidget extends StatefulWidget {
  Function(Set<Marker>) onTapped;

  GoogleMapWidget({super.key, required this.onTapped});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};

  final LatLng _center = const LatLng(35.68145403034362, 139.76707116150914);

  bool _isLoading = false;

  void _onLoad() {
    setState(() {
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    developer.log("GoogleMapControllerが作成されました");
    mapController = controller;
    locateUser(mapController, _onLoad);
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      // 既存のマーカーをクリア
      _markers.clear();

      // 新しいマーカーのID
      final markerId = MarkerId("unique_id");

      // 新しいマーカーの作成
      final marker = Marker(
        markerId: markerId,
        position: position,
      );

      // 新しいマーカーをセットに追加
      _markers.add(marker);
    });

    widget.onTapped?.call(_markers);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          onTap: _onMapTapped,
          markers: _markers,
          myLocationEnabled: true,
        ),
        if (_isLoading) // マップが読み込まれていない間はローディングインジケーターを表示
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
