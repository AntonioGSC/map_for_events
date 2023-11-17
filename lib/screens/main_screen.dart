import 'package:flutter/material.dart';
import 'package:map_for_events/screens/favorite.dart';
import 'package:map_for_events/screens/home.dart';
import 'package:map_for_events/screens/map.dart';
import 'package:map_for_events/screens/my_event.dart';
import 'package:map_for_events/screens/profile.dart';
import 'package:map_for_events/utils/contants.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int currentIndex = 0;
  late PageController pc;

  final duration = const Duration(milliseconds: 400);
  final pages = const [
    HomeWidget(),
    MyEventsWidget(),
    FavoriteEventsWidget(),
    ProfileWidget()
  ];

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentIndex);
  }

  setPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPage,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorWhite,
        selectedItemColor: colorMainBlue,
        unselectedItemColor: colorLightGray,
        currentIndex: currentIndex,
        iconSize: 35,
        selectedFontSize: 18,
        showUnselectedLabels: false,
        onTap: (index) => setState(() {
          pc.animateToPage(index, duration: duration, curve: Curves.ease);
        }),
        items: const [
          BottomNavigationBarItem(icon: iconHome, label: 'Home'),
          BottomNavigationBarItem(icon: iconTicket, label: 'Eventos'),
          BottomNavigationBarItem(icon: iconFavorite, label: 'Favoritos'),
          BottomNavigationBarItem(icon: iconUser, label: 'Perfil'),
        ],
      ),
    );
  }
}
