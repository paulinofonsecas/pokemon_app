import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_app/app/models/pokemon.dart';

class SecaoCentro extends StatelessWidget {
  const SecaoCentro({
    Key key,
    @required this.context,
    @required this.pokemon,
    @required this.formater,
  }) : super(key: key);

  final BuildContext context;
  final Pokemon pokemon;
  final NumberFormat formater;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.25,
      child: Container(
        width: 200,
        height: 200,
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width - 200) / 2,
        ),
        child: Image.network(
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${formater.format(pokemon.id)}.png',
        ),
      ),
    );
  }
}