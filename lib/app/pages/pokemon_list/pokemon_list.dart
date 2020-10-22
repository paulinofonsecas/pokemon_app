import 'package:flutter/material.dart';
import 'package:pokemon_app/app/controllers/list_poke_controller.dart';
import 'package:pokemon_app/app/models/pokemon.dart';

import 'componentes/pokemon_list_item.dart';

class PokeListPage extends StatefulWidget {
  @override
  _PokeListPageState createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  ListPokeController _controller = ListPokeController();
  String path = 'pokemon';

  Widget _buildItem(Pokemon pokemon) {
    return PokemonListItem(pokemon: pokemon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPokeLogo(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildCustomAppBar(),
                _buildListPokemons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildListPokemons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Pokemon>>(
          future: _controller.pokemons(path),
          builder: (context, snapshot) {
            var pokemonList = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                ),
                children: pokemonList.map(_buildItem).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Column _buildCustomAppBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ],
    );
  }

  Positioned _buildPokeLogo() {
    return Positioned(
      top: -60,
      right: -60,
      child: Container(
        width: 200,
        height: 200,
        child: Opacity(
          opacity: 0.1,
          child: Image.asset('assets/pokeball_dark.png'),
        ),
      ),
    );
  }
}
