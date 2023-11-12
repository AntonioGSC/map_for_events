import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:map_for_events/screens/favorite.dart';
import 'package:map_for_events/screens/home.dart';
import 'package:map_for_events/screens/login.dart';
import 'package:map_for_events/screens/map.dart';
import 'package:map_for_events/screens/my_event.dart';
import 'package:map_for_events/screens/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map4Events',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true
          // primarySwatch: Colors.amber,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      routes: {
        "/": (context) => const LoginScreenWidget(),
        "/home": (context) => const HomeWidget(),
        "/events": (context) => const MyEventsWidget(),
        "/favorite": (context) => const FavoriteEventsWidget(),
        "/map": (context) => const MapWidget(),
        "/profile": (context) => const ProfileWidget(),
      },
      initialRoute: "/",
    );
  }
}
