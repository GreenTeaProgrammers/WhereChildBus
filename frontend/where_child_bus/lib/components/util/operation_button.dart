import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/util/api/bus.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class OperationButton extends StatefulWidget {
  Bus bus;
  Function(Bus) onBusUpdated;

  OperationButton({
    super.key,
    required this.bus,
    required this.onBusUpdated,
  });

  @override
  State<OperationButton> createState() => _OperationButtonState();
}

class _OperationButtonState extends State<OperationButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _createOperationButton();
  }

  Future<void> _updateBusStatus() async {
    BusStatus busStatus;

    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    if (widget.bus.busStatus == BusStatus.BUS_STATUS_STOPPED) {
      busStatus = BusStatus.BUS_STATUS_RUNNING;
    } else {
      busStatus = BusStatus.BUS_STATUS_STOPPED;
    }

    try {
      var res = await updateBusStatus(widget.bus.id, busStatus);
      if (mounted) {
        setState(() {
          widget.onBusUpdated(res.bus);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log("バスの運行状態の更新中にエラーが発生しました: $e");
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _createOperationButton() {
    Color buttonColor;
    String buttonText;
    VoidCallback onPressed;

    switch (widget.bus.busStatus) {
      case BusStatus.BUS_STATUS_STOPPED:
        buttonColor = Colors.green;
        buttonText = "運航開始";
        onPressed = _updateBusStatus;
        break;
      case BusStatus.BUS_STATUS_MAINTENANCE:
        buttonColor = Colors.lime;
        buttonText = "設定";
        onPressed = () {};
        break;
      default:
        buttonColor = Colors.red;
        buttonText = "運航停止";
        onPressed = _updateBusStatus;
    }

    return _buildButton(buttonColor, buttonText, onPressed);
  }

  Widget _buildButton(Color color, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
