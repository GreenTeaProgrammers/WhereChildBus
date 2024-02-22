import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
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
  State<CameraPage> createState() => _CameraPageState();
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
      developer.log("Camera aspect ratio: ${_controller.value.aspectRatio}",
          name: "CameraPage");
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
      await for (var response in res.asStream()) {
        developer.log("Received response: $response", name: "CameraPage");
      }
    } catch (error) {
      developer.log("Caught Error:", error: error);
    } finally {
      await channel.shutdown();
    }
  }

  List<int> _processCameraImage2gray(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    const int bgraPixelStride = 4; // BGRAフォーマットではピクセルあたり4バイト
    final bgraBytes = image.planes[0].bytes;

    // グレースケール画像データを格納するためのリストを初期化
    List<int> grayscaleBytes = List.filled(width * height, 0);

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int index = x * bgraPixelStride + y * image.planes[0].bytesPerRow;
        final int b = bgraBytes[index];
        final int g = bgraBytes[index + 1];
        final int r = bgraBytes[index + 2];
        // 輝度Yを計算
        final int yValue = (0.299 * r + 0.587 * g + 0.114 * b).round();
        grayscaleBytes[x + y * width] = yValue;
      }
    }

    return grayscaleBytes;
  }

  void _startImageStream() {
    List<List<int>> videoChunks = [];
    if (!_controller.value.isStreamingImages) {
      int frameCounter = 0;
      _controller.startImageStream((CameraImage image) {
        frameCounter++;
        if (frameCounter % 60 == 0) {
          //TODO プラットフォームで画像を変える
          if (Platform.isAndroid) {
            videoChunks.add(image.planes[0].bytes.toList());
          } else if (Platform.isIOS) {
            videoChunks.add(_processCameraImage2gray(image));
          }
          _streamController.add(StreamBusVideoRequest(
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

  Future<void> _playAudio() async {
    //TODO 音声を再生する
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
        Center(
          child: AspectRatio(
              aspectRatio: 1 / _controller.value.aspectRatio,
              child: CameraPreview(_controller)),
        ),
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
