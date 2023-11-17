import 'package:flutter/material.dart';
import 'package:map_for_events/models/eventos.dart';
import 'package:map_for_events/utils/contants.dart';

class ImageCardList extends StatelessWidget {
  // Lista de caminhos para as imagens
  
  final List<Eventos> _eventos = eventos;
  
@override
Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: _eventos.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Image.asset(
                _eventos[index].imagem,
                height: 150, // Ajuste a altura conforme necessário
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _eventos[index].nome, // Adicione o título do evento aqui
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
}