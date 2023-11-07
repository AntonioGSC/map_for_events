import 'package:flutter/material.dart';
import 'package:map_for_events/utils/contants.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: appName,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: iconHome, label: 'Home', backgroundColor: colorMainBlue),
          BottomNavigationBarItem(icon: iconSearch, label: 'Procurar'),
          BottomNavigationBarItem(icon: iconTicket, label: 'Eventos'),
          BottomNavigationBarItem(icon: iconFavorite, label: 'Favoritos'),
          BottomNavigationBarItem(icon: iconUser, label: 'Perfil'),
        ],
      ),
    );
  }
}
