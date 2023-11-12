import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Altere a cor conforme necessário
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor:
            Colors.white, // Ajuste a cor de fundo conforme necessário
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: const Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50, // Ajuste o tamanho conforme necessário
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.4871374905aa85c48423c26517b5bc71?rik=%2baH%2brtYTFbRAvA&pid=ImgRaw&r=0'), // Substitua pela URL da imagem
            ),
            SizedBox(height: 10),
            Text(
              'Nome do Usuário', // Substitua pelo nome do usuário
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'alan@bighub.com', // Substitua pelo e-mail do usuário
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            // Adicione outros detalhes que você deseja mostrar no perfil
          ],
        ),
      ),
    );
  }
}
