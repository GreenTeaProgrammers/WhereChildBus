import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:grpc/grpc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:location/location.dart';
import 'package:where_child_bus/components/util/audio_manager.dart';
import 'package:where_child_bus/config/config.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus/pages/camera_page/widgets/riding_toggle.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus.pbgrpc.dart';
import "package:where_child_bus/main.dart" as where_child_bus;
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

import 'widgets/next_station_button.dart';

class CameraPage extends StatefulWidget {
  Bus bus;
  final BusType busType;

  CameraPage({Key? key, required this.bus, required this.busType})
      : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  late CameraController _controller;
  final StreamController<StreamBusVideoRequest> _streamController =
      StreamController<StreamBusVideoRequest>.broadcast();
  final StreamController<SendLocationContinuousRequest> _locationStream =
      StreamController<SendLocationContinuousRequest>.broadcast();
  VehicleEvent _vehicleEvent = VehicleEvent.VEHICLE_EVENT_GET_ON;
  final Location location = Location();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    var camera = where_child_bus.cameras.first;
    try {
      camera = where_child_bus.cameras[1];
    } catch (e) {
      developer.log("Failed to get camera: $e");
    }

    _controller = CameraController(camera, ResolutionPreset.medium);

    try {
      await _controller.initialize();
      if (!mounted) return;
      setState(() {});
      developer.log("Camera aspect ratio: ${_controller.value.aspectRatio}",
          name: "CameraPage");
      _startImageStream();
      streamBusVideo(_streamController.stream);
      developer.log("Start streaming coordinate to server", name: "CameraPage");
      _streamCoordinate(_locationStream.stream);
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
        await _playAudio(response);
      }
    } catch (error) {
      developer.log("Caught Error:", error: error, name: "StreamBusVideo");
    } finally {
      await channel.shutdown();
    }
  }

  Future<void> _streamCoordinate(
      Stream<SendLocationContinuousRequest> requestStream) async {
    final channel = ClientChannel(
      appConfig.grpcEndpoint,
      port: appConfig.grpcPort,
      options: const ChannelOptions(),
    );
    final grpcClient = BusServiceClient(channel);
    developer.log("ServiceClient created");
    final res = grpcClient.sendLocationContinuous(requestStream);

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

  Future<LocationData> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    // サービスが有効かどうかを確認
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      // サービスが無効の場合は、ユーザーに有効化を求める
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location service is not enabled.');
      }
    }

    // 位置情報の権限を確認
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      // 権限が拒否されている場合は、権限をリクエスト
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location service is not enabled.');
      }
    }

    // 現在地の取得
    locationData = await location.getLocation();
    developer
        .log("現在地の緯度: ${locationData.latitude}, 経度: ${locationData.longitude}");
    return locationData;
  }

  List<int> _processCameraImage2gray(CameraImage image) {
    //Note:実験的に縦横を入れ替えてみる
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

  List<int> _rotateImageLeft90Degrees(
      int width, int height, List<int> grayscaleBytes) {
    List<int> rotatedGrayscaleBytes = List.filled(width * height, 0);

    for (int originalY = 0; originalY < height; originalY++) {
      for (int originalX = 0; originalX < width; originalX++) {
        // 元の位置のインデックス
        int originalIndex = originalY * width + originalX;
        // 回転後の位置のインデックス
        int rotatedX = originalY;
        int rotatedY = width - originalX - 1;
        int rotatedIndex = rotatedY * height + rotatedX;
        // 輝度値を新しい位置にコピー
        rotatedGrayscaleBytes[rotatedIndex] = grayscaleBytes[originalIndex];
      }
    }

    return rotatedGrayscaleBytes;
  }

  void _startImageStream() async {
    List<List<int>> videoChunks = [];
    if (!_controller.value.isStreamingImages) {
      int frameCounter = 0;
      _controller.startImageStream((CameraImage image) async {
        frameCounter++;
        if (frameCounter % 60 == 0) {
          if (Platform.isAndroid) {
            videoChunks.add(image.planes[0].bytes.toList());
          } else if (Platform.isIOS) {
            videoChunks.add(_rotateImageLeft90Degrees(
                image.width, image.height, _processCameraImage2gray(image)));
          }

          _streamController.add(StreamBusVideoRequest(
            busId: widget.bus.id,
            nurseryId: NurseryData().getNursery().id,
            busType: widget.busType,
            vehicleEvent: _vehicleEvent,
            videoChunk: videoChunks,
            photoHeight: image.height,
            photoWidth: image.width,
          ));

          try {
            // await _getCurrentLocation();
            await _getCurrentLocation().then((locationData) {
              _locationStream.add(SendLocationContinuousRequest(
                busId: widget.bus.id,
                latitude: locationData.latitude,
                longitude: locationData.longitude,
              ));
            });
          } catch (e) {
            developer.log("Failed to get current location: $e");
          }

          developer.log("width ${image.width}", name: "CameraPage");
          developer.log("height ${image.height}", name: "CameraPage");

          videoChunks = [];
        }
      });
    }
  }

  Future<void> _playAudio(StreamBusVideoResponse res) async {
    List<String> audioFiles = [];

    if (res.children.any((child) => child.hasBag)) {
      audioFiles.add("sounds/bag.wav");
    }

    if (res.children.any((child) => child.hasLunchBox)) {
      audioFiles.add("sounds/lunch_box.wav");
    }

    if (res.children.any((child) => child.hasWaterBottle)) {
      audioFiles.add("sounds/water_bottle.wav");
    }

    if (res.children.any((child) => child.hasUmbrella)) {
      audioFiles.add("sounds/umbrella.wav");
    }

    AudioManager(audioFiles: audioFiles).playSequentially();
  }

  void _onNextButtonPressed(Bus bus) {
    developer.log("Next button pressed", name: "CameraPage");
    setState(() {
      widget.bus = bus;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _streamController.close();
    _locationStream.close();
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NextStationButton(
                    bus: widget.bus,
                    busType: widget.busType,
                    onPressed: _onNextButtonPressed),
                RidingToggle(
                    onToggled: (event) => {
                          setState(() {
                            if (event) {
                              _vehicleEvent = VehicleEvent.VEHICLE_EVENT_GET_ON;
                            } else {
                              _vehicleEvent =
                                  VehicleEvent.VEHICLE_EVENT_GET_OFF;
                            }
                          }),
                        }),
              ],
            )),
        //NOTE: テスト用
        // ElevatedButton(
        //     onPressed: AudioManager(audioFiles: ["sounds/water_bottle.wav"])
        //         .playSequentially,
        //     child: const Text("Play")),
      ],
    );
  }
}
