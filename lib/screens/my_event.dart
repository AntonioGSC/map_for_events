import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_for_events/models/ImageCardList.dart';
import 'package:map_for_events/utils/contants.dart';

class MyEventsWidget extends StatefulWidget {
  const MyEventsWidget({super.key});

  @override
  State<MyEventsWidget> createState() => _MyEventsWidgetState();
}

class _MyEventsWidgetState extends State<MyEventsWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(700, 1400));
    return Scaffold(
      body: Column(
        children: [
          Row(children: [
          Row(
            children: [
              Container(
                  margin: marginTop,
                  child: const Text(
                    'Meus eventos ativos',
                    style: textStyle24,
                  ))
            ],
          )            
          ],),
          Expanded(
            child: ImageCardList(),
          )
                    
        ],)
    );
  }
}
