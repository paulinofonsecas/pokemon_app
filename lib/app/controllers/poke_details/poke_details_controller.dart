import 'package:flutter/material.dart';
import 'package:pokemon_app/app/models/pokemon.dart';
import 'package:pokemon_app/app/pages/pokemon_details/componentes/custom_progress_indicator.dart';

class PokeDetailsController {
  final tabs = [
    'Abaut',
    'Base stats',
    'Evolution',
    'Moves',
  ];

  Widget buildPropertys(List<Stats> stats, BoxConstraints size) {
    var nomes = <Widget>[];
    var valores2 = <Widget>[];

    stats.forEach((element) {
      var titlo = element.stat.name;
      var baseStat = element.baseStat;

      if (titlo == 'special-attack') titlo = 'Sp-Atk';
      if (titlo == 'special-defense') titlo = 'Sp-Def';

      nomes.add(Text(titlo));
      valores2.add(Row(
        children: [
          Text(
            baseStat.toString(),
          ),
          SizedBox(width: 20),
          CustomProgressIndicator(
            size: size,
            baseStat: element.baseStat,
          ),
        ],
      ));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: nomes,
        ),
        Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: valores2,
        ),
      ],
    );
  }
}
