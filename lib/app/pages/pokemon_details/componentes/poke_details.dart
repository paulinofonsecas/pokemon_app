import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_app/app/consts/const_app.dart';
import 'package:pokemon_app/app/models/pokemon.dart';
import 'package:pokemon_app/app/pages/pokemon_details/componentes/primeira_secao.dart';
import 'package:pokemon_app/app/pages/pokemon_details/componentes/secao_centro.dart';

import 'secao_baixo.dart';

class PokeDetails extends StatelessWidget {
  PokeDetails({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  final NumberFormat formater = NumberFormat('000');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: ConstApp.getColorType(type: pokemon.types[0].type.name),
          ),
          child: PrimeiraSecao(
            context: context,
            pokemon: pokemon,
            formater: formater,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.55,
          child: SingleChildScrollView(
            child: SecaoBaixo(pokemon: pokemon),
          ),
        ),
        SecaoCentro(
          context: context,
          pokemon: pokemon,
          formater: formater,
        ),
      ],
    );
  }
}
