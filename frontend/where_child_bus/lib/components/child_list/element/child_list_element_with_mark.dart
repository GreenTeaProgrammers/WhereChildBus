import 'package:flutter/material.dart';
import 'package:where_child_bus/components/child_list/element/child_list_element.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class ChildListElementWithMark extends StatefulWidget {
  final String title;
  final String subtitle;
  final ChildPhoto image;
  final bool isInBus;
  final VoidCallback? onTap;

  const ChildListElementWithMark({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isInBus,
    this.onTap,
  }) : super(key: key);

  @override
  State<ChildListElementWithMark> createState() =>
      _ChildListElementWithMarkState();
}

class _ChildListElementWithMarkState extends State<ChildListElementWithMark> {
  @override
  Widget build(BuildContext context) {
    // ChildListElementを再利用して、actionButtonとしてmarkを渡す
    return ChildListElement(
      title: widget.title,
      subtitle: widget.subtitle,
      image: widget.image,
      onTap: widget.onTap,
      actionButton: Padding(
        padding: const EdgeInsets.only(left: 16), // マークと他の要素との間隔を調整
        child: widget.isInBus ? markRide() : markNotRide(),
      ),
    );
  }

  Widget markRide() {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Card(
        child: Center(
          child: Icon(
            Icons.circle,
            size: 50,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget markNotRide() {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Card(
        child: Center(
          child: Icon(
            Icons.close,
            size: 50,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
