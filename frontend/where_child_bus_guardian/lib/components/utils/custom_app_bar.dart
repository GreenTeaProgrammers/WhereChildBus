import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/components/utils/half_circle_painter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;

  CustomAppBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 243, 190),
      title: Text(''),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomPaint(
          painter: HalfCirclePainter(),
          child: Container(
            height: 0,
          ),
        ),
      ),
      flexibleSpace: layoutBuilder(),
    );
  }

  LayoutBuilder layoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double appBarHeight = constraints.biggest.height;
        return Center(
          child: Container(
            child: Text(
              ['日々の記録', '地図', '乗車確認'][selectedIndex],
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 67, 55, 1)),
            ),
            // AppBarの高さに応じて位置を調整
            padding: EdgeInsets.only(top: appBarHeight / 2),
          ),
        );
      },
    );
  }
}
