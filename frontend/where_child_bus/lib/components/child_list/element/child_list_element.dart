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
    return listElementPadding(
      Card(
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.white, // Cardの背景色
          child: InkWell(
            onTap: onTap, // タップ時のアクション
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ImageFromBytes(
                      imageData: image.photoData, height: 100, width: 100),
                  const SizedBox(width: 16),
                  Expanded(
                    child: titleAndSubTitle(title, subtitle),
                  ),
                  if (actionButton != null) actionButton!, // アクションボタンを表示
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column titleAndSubTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleText(title),
        subTitleText(subtitle),
      ],
    );
  }

  Text titleText(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  Text subTitleText(String subtitle) {
    return Text(subtitle);
  }

  Padding listElementPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
