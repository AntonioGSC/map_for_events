import 'dart:ui';

class MapInformation {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String hourStart;
  final String hourFinish;
  final Color color;

  MapInformation(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.hourStart,
      required this.hourFinish,
      required this.color});
}
