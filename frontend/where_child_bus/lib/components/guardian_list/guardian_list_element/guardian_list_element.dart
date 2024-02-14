
import 'package:flutter/material.dart';

class GuardianListElement extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? actionButton; 

  const GuardianListElement({
    Key? key,
    required this.title,
    required this.subtitle,
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
                  // Image.asset(imagePath, width: 100, height: 100),
                  // const SizedBox(width: 16),
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
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
    );
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
