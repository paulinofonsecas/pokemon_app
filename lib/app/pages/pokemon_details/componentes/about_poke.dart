import 'package:flutter/material.dart';
import 'package:pokemon_app/app/models/pokemon.dart';

class AboutPoke extends StatelessWidget {
  const AboutPoke({Key key, this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Wrap(
                spacing: 10,
                direction: Axis.vertical,
                children: [
                  Text(
                    'Species',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Height',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Weight',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Abilities',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Wrap(
                direction: Axis.vertical,
                spacing: 10,
                children: [
                  Text(
                    pokemon.species.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    pokemon.height.toString(),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${(pokemon.weight * 0.1000).toString()} Kg',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    pokemon.abilities.fold('', (previousValue, element) {
                      if (previousValue.isNotEmpty)
                        return '$previousValue, ${element.ability.name}';
                      else {
                        return element.ability.name;
                      }
                    }),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}