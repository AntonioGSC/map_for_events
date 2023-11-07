import 'package:flutter/material.dart';
import 'package:map_for_events/screens/main_screen.dart';
import 'package:map_for_events/utils/contants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map4Events',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorMainBlue),
          useMaterial3: true),
      home: const MainWidget(),
    );
  }
}
