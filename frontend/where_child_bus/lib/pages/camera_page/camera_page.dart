import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:grpc/grpc.dart';
import 'package:where_child_bus/config/config.dart';
import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus/util/nursery_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';
import "package:where_child_bus/main.dart" as where_child_bus;

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  final StreamController<StreamBusVideoRequest> _streamController =
      StreamController<StreamBusVideoRequest>.broadcast();

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
      // _streamVideoToServer();
      streamBusVideo(_streamController.stream);
      developer.log("Finish streaming video to server", name: "CameraPage");
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
      developer.log("Caught Error:", error: error.toString());
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
          videoChunks.add(image.planes[0].bytes);
          _streamController.add(StreamBusVideoRequest(
              nurseryId: NurseryData().getNursery().id,
              videoChunk: videoChunks));
          developer.log("Received image frame", name: "CameraPage");
          videoChunks = [];
        }
      });
    }
  }

  void _streamVideoToServer() async {
    final stream = _streamController.stream;
    await streamBusVideo(stream);
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
      body: CameraPreview(_controller),
    );
  }
}
