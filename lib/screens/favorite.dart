import 'package:flutter/material.dart';

class FavoriteEventsWidget extends StatefulWidget {
  const FavoriteEventsWidget({super.key});

  @override
  State<FavoriteEventsWidget> createState() => _FavoriteEventsWidgetState();
}

class _FavoriteEventsWidgetState extends State<FavoriteEventsWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Favorite', style: TextStyle(fontSize: 60))),
    );
  }
}
