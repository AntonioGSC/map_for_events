import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:map_for_events/models/eventos.dart';
import 'package:map_for_events/utils/contants.dart';


class ImageCardListFavorite extends StatelessWidget {
  // Lista de caminhos para as imagens

  final List<Eventos> _eventos = eventos;

  @override
Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: _eventos.length,
    itemBuilder: (context, index) {
      if (!_eventos[index].status) {
        return Padding(
        padding: const EdgeInsets.all(8.0),
          child: Tooltip(
          
          message: _eventos[index].descricao.toString(),
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(top: 30, left:30,right: 30),
          decoration: BoxDecoration(
              color: Colors.blueAccent.shade400.withOpacity(0.95),
              borderRadius: BorderRadius.circular(22)),
          textStyle: const TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              color: Colors.white),
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
                  child: ListTile(
                    title: Text(_eventos[index].nome),
                    onTap: () {
                      Navigator.pushNamed(context, '/map');
                    },
                    trailing: const Row(mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_rounded, 
                    color: Colors.pink),
                  ],
                ), // Adicione o título do evento aqui
                  ),
                ),
            ],
          ),
        ),
      );
    }
    else {
      return Container();
    }
    },
  );
}
}





