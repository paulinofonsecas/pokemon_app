import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_app/app/consts/const_app.dart';
import 'package:pokemon_app/app/models/pokemon.dart';
import 'package:pokemon_app/app/pages/pokemon_details/componentes/abilidade_widget.dart';

import '../../pokemon_details/pokemon_details.dart';

class PokemonListItem extends StatefulWidget {
  PokemonListItem({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  _PokemonListItemState createState() => _PokemonListItemState();
}

class _PokemonListItemState extends State<PokemonListItem> {
  final NumberFormat formater = NumberFormat('000');
  Color colorBg;

  @override
  void initState() {
    colorBg = ConstApp.getColorType(type: widget.pokemon.types[0].type.name);
    super.initState();
  }

  onClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          var pokeDetailsSplashScreen = PokeDetailsSplashScreen(
            widget.pokemon.name,
            color: ConstApp.getColorType(
              type: widget.pokemon.types[0].type.name,
            ),
          );
          return pokeDetailsSplashScreen;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 120,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pokemon.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.pokemon.types
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: AbilidadeWidget(type: e),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                          child: Opacity(
                            opacity: 0.4,
                            child: Image.asset('assets/pokeball.png'),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Image.network(
                              'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${formater.format(widget.pokemon.id)}.png',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
