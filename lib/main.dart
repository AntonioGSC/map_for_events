import 'package:flutter/material.dart';
import 'package:map_for_events/screens/favorite.dart';
import 'package:map_for_events/screens/home.dart';
import 'package:map_for_events/screens/map.dart';
import 'package:map_for_events/screens/my_event.dart';
import 'package:map_for_events/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true
          // primarySwatch: Colors.amber,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      routes: {
        "/": (context) => const HomeWidget(),
        "/events": (context) => const MyEventsWidget(),
        "/favorite": (context) => const FavoriteEventsWidget(),
        "/map": (context) => const MapWidget(),
        "/profile": (context) => const ProfileWidget(),
      },
      initialRoute: "/",
    );
  }
}
