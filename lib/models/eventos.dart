import 'dart:ffi';

class Eventos {
  int? id;
  final String nome;
  final String descricao;
  final String imagem;
  final String data;
  final String local;
  final String horario;
  final String valor;
  final String link;
  final String categoria;

  Eventos(this.nome, this.descricao, this.imagem, this.data, this.local, this.horario, this.valor, this.link, this.categoria);
}