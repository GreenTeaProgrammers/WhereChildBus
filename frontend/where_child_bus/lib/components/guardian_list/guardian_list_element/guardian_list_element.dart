import 'package:flutter/material.dart';
import 'package:where_child_bus/components/util/number_icon.dart';

class GuardianListElement extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onButtonPressed;

  const GuardianListElement({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  _GuardianListElementState createState() => _GuardianListElementState();
}

class _GuardianListElementState extends State<GuardianListElement> {
  @override
  Widget build(BuildContext context) {
    return listElementPadding(
      Card(
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.white, // Cardの背景色
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                titleAndSubTitle(widget.title, widget.subtitle),
                addButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addButton() {
    return IconButton(
      onPressed: widget.onButtonPressed,
      icon: const Icon(Icons.add),
    );
  }

  Widget orderIcon(int number) {
    return NumberIcon(number: number);
  }

  Widget titleAndSubTitle(String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleText(title),
          subTitleText(subtitle),
        ],
      ),
    );
  }

  Text titleText(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
