import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:grpc/grpc.dart';
import 'package:where_child_bus/config/config.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus/pages/camera_page/widgets/riding_toggle.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';
import "package:where_child_bus/main.dart" as where_child_bus;
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class CameraPage extends StatefulWidget {
  final Bus bus;
  final BusType busType;

  const CameraPage({Key? key, required this.bus, required this.busType})
      : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  final StreamController<StreamBusVideoRequest> _streamController =
      StreamController<StreamBusVideoRequest>.broadcast();
  VehicleEvent _vehicleEvent = VehicleEvent.VEHICLE_EVENT_GET_ON;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final firstCamera = where_child_bus.cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.medium);

    try {
      await _controller.initialize();
      if (!mounted) return;
      setState(() {});
      _startImageStream();
      developer.log("Start streaming video to server", name: "CameraPage");
      streamBusVideo(_streamController.stream);
    } catch (e) {
      developer.log('Failed to initialize camera: $e');
    }
  }

  Future<void> streamBusVideo(
      Stream<StreamBusVideoRequest> requestStream) async {
    final channel = ClientChannel(
      appConfig.grpcEndpoint,
      port: appConfig.grpcPort,
      options: const ChannelOptions(),
    );
    final grpcClient = BusServiceClient(channel);
    developer.log("ServiceClient created");
    final res = grpcClient.streamBusVideo(requestStream);

    try {
      developer.log("Streamed video to server");
      await for (var response in res.asStream()) {
        developer.log("Received response: $response");
      }
    } catch (error) {
      developer.log("Caught Error:", error: error);
    } finally {
      await channel.shutdown();
    }
  }

  void _startImageStream() {
    List<List<int>> videoChunks = [];
    if (!_controller.value.isStreamingImages) {
      int frameCounter = 0;
      _controller.startImageStream((CameraImage image) {
        frameCounter++;
        if (frameCounter % 60 == 0) {
          videoChunks.add(image.planes[0].bytes.toList());
          _streamController.add(StreamBusVideoRequest(
            nurseryId: NurseryData().getNursery().id,
            busId: widget.bus.id,
            busType: widget.busType,
            vehicleEvent: _vehicleEvent,
            videoChunk: videoChunks,
            photoHeight: image.height,
            photoWidth: image.width,
          ));
          developer.log("width ${image.width}", name: "CameraPage");
          developer.log("height ${image.height}", name: "CameraPage");

          videoChunks = [];
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const SizedBox.shrink(); // カメラが初期化されていない場合は何も表示しない
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("カメラ"),
      ),
      body: _createPageBody(),
    );
  }

  Widget _createPageBody() {
    return Stack(
      children: [
        CameraPreview(_controller),
        Positioned(
            right: 15,
            child: RidingToggle(
                onToggled: (event) => {
                      setState(() {
                        if (event) {
                          _vehicleEvent = VehicleEvent.VEHICLE_EVENT_GET_ON;
                        } else {
                          _vehicleEvent = VehicleEvent.VEHICLE_EVENT_GET_OFF;
                        }
                      }),
                    }))
      ],
    );
  }
}
