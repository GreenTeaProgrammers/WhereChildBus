import 'package:flutter/material.dart';

// 再利用性の高いChildListElementクラスの定義
class ChildListElement extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback? onTap;
  final Widget? actionButton; 

  const ChildListElement({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
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
                  Image.asset(imagePath, width: 100, height: 100),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(subtitle),
                      ],
                    ),
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

  Padding listElementPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
