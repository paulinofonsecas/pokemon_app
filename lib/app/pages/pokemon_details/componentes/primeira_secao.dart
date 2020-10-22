import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_app/app/models/pokemon.dart';

import 'abilidade_widget.dart';

class PrimeiraSecao extends StatelessWidget {
  const PrimeiraSecao({
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '#${formater.format(pokemon.id)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              Row(
                children: pokemon.types.map<Widget>(
                  (tipo) {
                    return AbilidadeWidget(type: tipo);
                  },
                ).toList(),
              )
            ],
          ),
        ),
        _buildLogosCenter(context),
      ],
    );
  }

  Positioned _buildLogosCenter(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.23,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 70),
            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Column(
                children: [
                  buildIconList(),
                  buildIconList(),
                  buildIconList(),
                ],
              ),
            ),
            SizedBox(width: 80),
            Container(
              width: 200,
              height: 200,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset('assets/pokeball.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconList() {
    return Row(children: [
      ...List.generate(5, (index) {
        return Container(
          width: 5,
          height: 5,
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(90),
          ),
        );
      })
    ]);
  }
}