import 'package:flutter/material.dart';
import 'package:map_for_events/models/map_information.dart';
import 'package:map_for_events/utils/contants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final _mapInformation = mapInformation;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(700, 1400));
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CCXP - São Paulo',
            style: textStyle24,
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(670),
                    height: ScreenUtil().setHeight(500),
                    margin: marginHorizontal,
                    padding: paddingAll,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorBlack,
                    ),
                    child: InteractiveViewer(
                        maxScale: 10,
                        minScale: 1,
                        boundaryMargin: marginAll10,
                        child: Image.asset('assets/map.jpg')),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(670),
                    height: ScreenUtil().setHeight(590),
                    padding: paddingAll,
                    margin: marginHorizontal,
                    child: CarouselSlider(
                        items: _carouselInformation(),
                        options: CarouselOptions(
                            height: ScreenUtil().setHeight(500),
                            enlargeCenterPage: true)),
                  )
                ],
              )
            ],
          ),
        ));
  }

  List<Widget> _carouselInformation() {
    List<Widget> result = [];

    result = _mapInformation.map((item) {
      String hour = 'Horário: ${item.hourStart} - ${item.hourFinish}';
      return Container(
        margin: marginHorizontalCard,
        padding: paddingCard,
        decoration: BoxDecoration(
            color: item.color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(item.title, style: textStyleTitleCard),
            Text(item.subtitle, style: textStyleSubtitleCard),
            const Padding(padding: paddingAll4),
            RichText(
                maxLines: 10,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: item.description, style: textStyleDescriptionCard)),
            const Padding(padding: paddingAll),
            Text(hour, style: textStyleDescriptionCard),
          ],
        ),
      );
    }).toList();

    return result;
  }
}
