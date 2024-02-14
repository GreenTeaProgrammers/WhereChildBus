import 'package:flutter/material.dart';
import 'package:where_child_bus/components/util/number_icon.dart';

class SelectedGuardianListElement extends StatefulWidget {
  final String title;
  final String subtitle;
  final int order; // 追加: リスト内の順序を表示するための順序番号
  final VoidCallback? onButtonPressed;

  const SelectedGuardianListElement({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.order, // 順序番号を必須引数として追加
    this.onButtonPressed,
  }) : super(key: key);

  @override
  _SelectedGuardianListElementState createState() => _SelectedGuardianListElementState();
}

class _SelectedGuardianListElementState extends State<SelectedGuardianListElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: widget.onButtonPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // 並び替え用のドラッグハンドルアイコンを追加
                ReorderableDragStartListener(
                  index: widget.order - 1, // orderは1ベースなので、0ベースのindexに変換
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.drag_handle),
                  ),
                ),
                NumberIcon(number: widget.order, color: Colors.indigo,), // 順序番号アイコン
                SizedBox(width: 16),
                titleText(widget.title,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget addButton() {
    // ボタンの表示をカスタマイズする場合はここで変更
    return IconButton(
      onPressed: widget.onButtonPressed,
      icon: const Icon(Icons.add),
    );
  }

  Text titleText(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Padding listElementPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
