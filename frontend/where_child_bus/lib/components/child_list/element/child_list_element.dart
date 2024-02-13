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
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
    );
  }
}
