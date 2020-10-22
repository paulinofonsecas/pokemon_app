import 'package:flutter/material.dart';
import 'package:pokemon_app/app/models/pokemon.dart';

class AbilidadeWidget extends StatelessWidget {
  const AbilidadeWidget({
    Key key,
    this.type,
  }) : super(key: key);

  final Types type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(90),
      ),
      child: Text(
        type.type.name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}