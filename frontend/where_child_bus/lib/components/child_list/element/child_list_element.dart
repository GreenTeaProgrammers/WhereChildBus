import 'package:flutter/material.dart';
import 'package:where_child_bus/components/util/image_from_byte.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class ChildListElement extends StatelessWidget {
  final String title;
  final String subtitle;
  final ChildPhoto image;
  final VoidCallback? onTap;
  final Widget? actionButton;

  const ChildListElement({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listElementPadding(
      Card(
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ImageFromBytes(
                      imageData: image.photoData, height: 100, width: 100),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _createTitleAndSubTitle(title, subtitle),
                  ),
                  if (actionButton != null) actionButton!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _createTitleAndSubTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _createTitleText(title),
        _createSubTitleText(subtitle),
      ],
    );
  }

  Text _createTitleText(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  Widget _createSubTitleText(String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(subtitle),
    );
  }

  Padding _listElementPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
