import 'package:flutter/material.dart';
import 'package:map_for_events/models/eventos.dart';
import 'package:map_for_events/models/map_information.dart';

const paddingAll = EdgeInsets.all(8);
const paddingAll4 = EdgeInsets.all(4);
const paddingTop = EdgeInsets.only(top: 8);
const paddingHorizontal = EdgeInsets.symmetric(horizontal: 8);
const paddingCard = EdgeInsets.only(top: 16, bottom: 2, left: 12, right: 12);

const marginTop = EdgeInsets.only(top: 60, left: 8, right: 8);
const marginHorizontal = EdgeInsets.symmetric(horizontal: 8);
const marginHorizontalCard = EdgeInsets.symmetric(horizontal: 4);
const marginAll10 = EdgeInsets.all(10);

const colorWhite = Color.fromARGB(255, 255, 255, 255);
const colorBackground = Color.fromARGB(250, 250, 250, 255);
const colorBlack = Color.fromARGB(255, 51, 51, 51);
const colorMainBlue = Color.fromARGB(255, 76, 81, 247);
const colorDarkGray = Color.fromARGB(255, 72, 89, 84);
const colorLightGray = Color.fromARGB(255, 173, 169, 187);
const colorDarkGreen = Color.fromARGB(255, 0, 134, 86);
const colorLightGreen = Color.fromARGB(255, 0, 191, 136);
const colorRed = Color.fromARGB(255, 227, 0, 28);
const colorSalmon = Color.fromARGB(255, 255, 59, 73);

const appName = Text("Map4Events");

const textStyle24 =
    TextStyle(fontSize: 24, color: colorBlack, fontWeight: FontWeight.bold);
const textStyle20 = TextStyle(fontSize: 20, color: colorBlack);

const textStyleTitleCard =
    TextStyle(fontSize: 18, color: colorWhite, fontWeight: FontWeight.bold);

const textStyleSubtitleCard = TextStyle(fontSize: 16, color: colorWhite);
const textStyleDescriptionCard = TextStyle(fontSize: 14, color: colorWhite);

const iconHome = Icon(Icons.home);
const iconSearch = Icon(Icons.search);
const iconTicket = Icon(Icons.confirmation_num);
const iconFavorite = Icon(Icons.favorite);
const iconUser = Icon(Icons.person);

final List<MapInformation> mapInformation = [
  MapInformation(
      id: 0,
      title: 'Netflix',
      subtitle: 'Estande Netflix com prêmios',
      description:
          'A Netflix anuncia seu painel: sábado, dia 3 de dezembro, a partir das 13h30. O serviço homenageia os fãs e reúne uma seleção de nomes nacionais e internacionais para celebrar algumas das séries e filmes mais amados pelo público brasileiro!',
      hourStart: '13:30',
      hourFinish: '22:00',
      color: colorRed),
  MapInformation(
      id: 1,
      title: 'Panini',
      subtitle: 'Estande Panini com novas HQs',
      description:
          'Panini divulgou uma chuva de lançamentos para 2023 durante a CCXP22. Dentre os lançamentos da Panini na CCXP deste ano está  ‘Star Wars: A Lenda de Luke Skywalker’. A trama promete se aprofundar ainda mais na história do Jedi mais lendário da saga Star Wars.',
      hourStart: '10:00',
      hourFinish: '22:00',
      color: colorDarkGreen),
  MapInformation(
      id: 1,
      title: 'Warner Bros.',
      subtitle: 'Estande Panini com novas HQs',
      description:
          'Nova aventura da Warner Bros. com o ícone global Barbie, que permitirá aos participantes uma viagem pelo universo cor-de-rosa do filme.',
      hourStart: '11:00',
      hourFinish: '22:00',
      color: colorDarkGray),
  MapInformation(
      id: 1,
      title: 'HBO Max.',
      subtitle: 'Estande com atores de The Last of Us',
      description:
          'HBO Max com uma área inteiramente dedicada à aguardada série inspirada no game de sucesso “The Last of Us”, com participação dos atores Pedro Pascal e Bella Ramsey.',
      hourStart: '13:00',
      hourFinish: '22:00',
      color: colorMainBlue),
];

final List<Eventos> eventos = [
  Eventos(
    "CCXP 2022",
    "Feira Geek, Games e cultura POP",
    "assets/ccxp-sp.jpeg",
    "9-12 de dezembro de 2022",
    "São Paulo, SP",
    "09:00 - 18:00",
    "Pago",
    "https://www.ccxp.com.br/",
    "Feira Geek, Games e cultura POP",
    true,
  ),
  Eventos(
    "CES 2018",
    "Feira de eletrônicos de consumo, apresentando as últimas inovações tecnológicas.",
    "assets/ces-2018.png",
    "9-12 de janeiro de 2018",
    "Las Vegas Convention Center, EUA",
    "09:00 - 18:00",
    "Pago",
    "https://www.ces.tech/",
    "Feira de Tecnologia",
    true,
  ),
  Eventos(
    "Google I/O 2018",
    "Conferência anual de desenvolvedores do Google, destacando novas tecnologias e produtos.",
    "assets/google-i-o.png",
    "8-10 de maio de 2018",
    "Shoreline Amphitheatre, Mountain View, EUA",
    "Varia",
    "Gratuito",
    "https://events.google.com/io/",
    "Conferência de Desenvolvedores",
    true,
  ),
  Eventos(
    "WWDC 2019",
    "Conferência Anual de Desenvolvedores da Apple, anunciando as últimas atualizações do iOS, macOS, etc.",
    "assets/WWDC2019.png",
    "3-7 de junho de 2019",
    "San Jose Convention Center, EUA",
    "Varia",
    "Gratuito",
    "https://developer.apple.com/wwdc/",
    "Conferência de Desenvolvedores",
    true,
  ),
  Eventos(
    "AWS re:Invent 2019",
    "Conferência da Amazon Web Services sobre computação em nuvem, inteligência artificial e muito mais.",
    "assets/aws-re-invent-2019.png",
    "2-6 de dezembro de 2019",
    "Las Vegas, EUA",
    "Varia",
    "Pago",
    "https://reinvent.awsevents.com/",
    "Conferência de Tecnologia",
    false,
  ),
  Eventos(
    "Mobile World Congress 2020",
    "Feira global de tecnologia móvel, destacando inovações em dispositivos móveis.",
    "assets/mwc_2020.png",
    "24-27 de fevereiro de 2020",
    "Fira Gran Via, Barcelona, Espanha",
    "09:00 - 18:00",
    "Pago",
    "https://www.mwcbarcelona.com/",
    "Feira de Tecnologia",
    true,
  ),
  Eventos(
    "E3 2020",
    "Feira de jogos eletrônicos, apresentando os últimos lançamentos da indústria de videogames.",
    "assets/e3_2020.png",
    "9-11 de junho de 2020",
    "Los Angeles Convention Center, EUA",
    "Varia",
    "Pago",
    "https://www.e3expo.com/",
    "Feira de Jogos",
    false,
  )
];
