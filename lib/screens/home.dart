import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_for_events/models/emalta.dart';
import 'package:map_for_events/models/eventos.dart';
import 'package:map_for_events/screens/login.dart';
import 'package:map_for_events/utils/contants.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Eventos> eventos = [
    Eventos('nome', 'descricao', 'imagem', 'data', 'local', 'horario', 'valor',
        'link', 'categoria', false)
  ];

  List<EmAlta> emAlta = [
    EmAlta('CCXP 2023', 'Maior festival de cultura pop do planeta',
        'assets/ccxp.jpg'),
    EmAlta(
        'Estética in São Paulo',
        'Participe do evento mais importante de estética, saúde',
        'assets/esteticainsaopaulo.png'),
    EmAlta('Hospitalar 2024', 'A maior Feira da América Latina Efe',
        'assets/hospitalar.jpg'),
    EmAlta('Anime Friends 2024', 'O maior evento de cultura pop da América',
        'assets/animefriends.jpg'),
    EmAlta('Brasil Game Show 2024', 'A Maior Feira de Games da América Latina',
        'assets/bgs.jpeg'),
    EmAlta(
        'REATECH BRASIL 2024',
        'Feira Internacional de Inclusão e Acessibilidade',
        'assets/reatech.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(700, 1400));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                
                Image.asset(
                  'assets/ccxp-sp.jpeg',
                  height: 200,
                  fit: BoxFit.cover,

                ),
                
                 Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.gamepad, color: Colors.white),
                        Text('Geek, Games, Pop',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'CCXP 2024',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                 )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Em Alta',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 290,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.4,
                    ),
                    items: List.generate(
                      6,
                      (index) => Container(
                        width: 100,
                        child: Column(
                          children: [
                            Image.asset(
                              emAlta[index].imagem,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(emAlta[index].title,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text(emAlta[index].subtitulo,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Gastronomia e Culinária',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 290,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.4,
                    ),
                    items: List.generate(
                      6,
                      (index) => Container(
                        width: 100,
                        child: Column(
                          children: [
                            Image.asset(
                              emAlta[index].imagem,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(emAlta[index].title,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text(emAlta[index].subtitulo,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Geek e Games',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 290,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.4,
                    ),
                    items: List.generate(
                      6,
                      (index) => Container(
                        width: 100,
                        child: Column(
                          children: [
                            Image.asset(
                              emAlta[index].imagem,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(emAlta[index].title,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text(emAlta[index].subtitulo,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
