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
      if (_eventos[index].status) {
        return Padding(
        padding: const EdgeInsets.all(8.0),
          child: Tooltip(
          
          message: _eventos[index].descricao.toString(),
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(top: 30, left:30,right: 30),
          decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.8),
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
                    }, // Adicione o título do evento aqui
                  ),
                ),
            ],
          ),
        ),
      );}
     else {
        // Se o evento não tiver status true, retorne um widget vazio ou null.
        return Container();
      }
    },
  );
}
}
