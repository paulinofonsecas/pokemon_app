import 'package:flutter/material.dart';
import 'package:pokemon_app/app/models/pokemon.dart';
import 'package:pokemon_app/usecases/featch_data.dart';

import 'componentes/poke_details.dart';

class PokeDetailsSplashScreen extends StatefulWidget {
  PokeDetailsSplashScreen(this.title, {this.color});
  final String title;
  final Color color;

  @override
  _PokeDetailsSplashScreenState createState() =>
      _PokeDetailsSplashScreenState();
}

class _PokeDetailsSplashScreenState extends State<PokeDetailsSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Future<Pokemon> get getPokemon async {
    var pokemon = await buscarPokemon(widget.title);
    return pokemon;
  }

  @override
  initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..addListener(() {
        if (_controller.isCompleted) _controller.forward();
      });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Pokemon>(
        future: getPokemon,
        builder: (context, snapshot) {
          var pokemon = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return _buildSplashScreen();
          } else {
            _controller.stop();
            return PokeDetails(pokemon: pokemon);
          }
        },
      ),
    );
  }

  Container _buildSplashScreen() {
    return Container(
      color: widget.color,
      width: double.infinity,
      height: double.infinity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return Transform.rotate(
            angle: _controller.value,
            child: widget,
          );
        },
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            child: Image.asset('assets/pokeball.png'),
          ),
        ),
      ),
    );
  }
}
