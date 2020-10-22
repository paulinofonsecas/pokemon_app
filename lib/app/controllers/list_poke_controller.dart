import 'package:pokemon_app/app/models/poke_list.dart';
import 'package:pokemon_app/app/models/pokemon.dart';
import 'package:pokemon_app/app/models/pokemon_color.dart';
import 'package:pokemon_app/usecases/featch_data.dart';

class ListPokeController {
  PokeList cache;

  Future<PokemonColor> color(dynamic nome) async {
    var pokemonColor = await getColor(nome);
    return pokemonColor;
  }

  Future<List<String>> nomesDosPokemons(String path) async {
    PokeList pokeList = await buscarPokemons(path);
    cache = pokeList;
    return pokeList.results.map((e) => e.name).toList();
  }

  Future<List<Pokemon>> pokemons(String path) async {
    var nomeDosPokemons = await nomesDosPokemons(path);
    var lista = <Pokemon>[];
    for (var nome in nomeDosPokemons) {
      var poke = await buscarPokemon(nome);
      lista.add(poke);
    }
    return lista;
  }

  Future<Pokemon> pokemon(String nome) async {
    Pokemon pokemon = await buscarPokemon(nome);
    return pokemon;
  }
}
