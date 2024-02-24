import 'package:flutter/material.dart';

class StopBusPage extends StatefulWidget {
  Function onPressed;

  StopBusPage({super.key, required this.onPressed});

  @override
  State<StopBusPage> createState() => _StopBusPageState();
}

class _StopBusPageState extends State<StopBusPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '現在走行中のバスはありません',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: _fetchData,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text('更新')),
          ),
        ],
      ),
    );
  }

  void _fetchData() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    await widget.onPressed();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
