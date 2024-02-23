import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:where_child_bus_guardian/pages/daily_page/components/daily_record_body.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

class DailyRecordSlider extends StatefulWidget {
  final List<Child> children;
  final List<ChildPhoto> images;
  final VoidCallback? callback;

  const DailyRecordSlider(
      {Key? key, required this.children, required this.images, this.callback})
      : super(key: key);

  @override
  _DailyRecordSlider createState() => _DailyRecordSlider();
}

class _DailyRecordSlider extends State<DailyRecordSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> recordList = widget.children.map((child) {
      int index = widget.children.indexOf(child);
      return DailyRecordBody(
        child: child,
        image: widget.images[index],
      );
    }).toList();

    return Column(
      children: [
        recordCarouselSlider(recordList),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        dotIndicator(recordList)
      ],
    );
  }

  Widget recordCarouselSlider(List<Widget> recordList) {
    return CarouselSlider(
      items: recordList,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.55,
        initialPage: 0,
        autoPlay: false,
        viewportFraction: 1,
        enableInfiniteScroll: recordList.length > 1 ? true : false,
        onPageChanged: ((index, reason) {
          setState(() {
            currentIndex = index;
          });
        }),
      ),
    );
  }

  Widget dotIndicator(List<Widget> recordList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recordList.map((url) {
        int index = recordList.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentIndex == index ? Colors.grey[800] : Colors.grey[500]),
        );
      }).toList(),
    );
  }
}
