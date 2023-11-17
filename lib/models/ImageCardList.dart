import 'package:flutter/material.dart';

class ImageCardList extends StatelessWidget {
  // Lista de caminhos para as imagens
  final List<String> imagePaths = [
  'assets/reatech.jpg',
  'assets/ccxp-2022.jpg',
  'assets/ccxp-sp.jpeg',
  'assets/ccxp.jpg',
  'assets/tela.png',
  'assets/bgs.jpeg',
  'assets/animefriends.jpg',
  'assets/esteticainsaopaulo.png',
  'assets/hospitalar.jpg'  
    // Adicione mais caminhos de imagem conforme necessário
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: imagePaths.map((imagePath) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  height: 150, // Ajuste a altura conforme necessário
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Título do Card'),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

}