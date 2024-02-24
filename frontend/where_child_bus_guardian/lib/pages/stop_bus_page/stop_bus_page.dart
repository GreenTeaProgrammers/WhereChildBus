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
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[100],
                      foregroundColor: Colors.green[900]),
                  onPressed: _fetchData,
                  child: _isLoading
                      ? const Center(
                          child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        ))
                      : const Text('更新')),
            ),
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
