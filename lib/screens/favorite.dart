import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_for_events/models/ImageCardList.dart';
import 'package:map_for_events/models/ImageCardListFavourite.dart';
import 'package:map_for_events/utils/contants.dart';

class FavoriteEventsWidget extends StatefulWidget {
  const FavoriteEventsWidget({super.key});

  @override
  State<FavoriteEventsWidget> createState() => _FavoriteEventsWidgetState();
}

class _FavoriteEventsWidgetState extends State<FavoriteEventsWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(700, 1400));
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(
                    margin: marginTop,
                    child: const Text(
                      'Meus favoritos',
                      style: textStyle24,
                    ))
              ],
            )
          ],
        ),
        Expanded(
          child: ImageCardListFavorite(),
        )
      ],
    ));
  }
}
