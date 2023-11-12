import 'package:flutter/material.dart';

class MyEventsWidget extends StatefulWidget {
  const MyEventsWidget({super.key});

  @override
  State<MyEventsWidget> createState() => _MyEventsWidgetState();
}

class _MyEventsWidgetState extends State<MyEventsWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Events', style: TextStyle(fontSize: 60))),
    );
  }
}
