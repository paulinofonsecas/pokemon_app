
import 'package:dio/dio.dart';
import 'package:pokemon_app/app/models/poke_list.dart';
import 'package:pokemon_app/app/models/pokemon.dart';
import 'package:pokemon_app/app/models/pokemon_color.dart';

var url = 'https://pokeapi.co/api/v2/';
var localDio = Dio(BaseOptions(baseUrl: url));

Future<PokeList> buscarPokemons(String url, [Dio dio]) async {
  Dio finalDio;
  if (dio == null)
    finalDio = localDio;
  else {
    finalDio = dio;
  }
  var response = await finalDio.get(url);
  var data = response.data;
  var list = PokeList.fromJson(Map.from(data));
  return list;
}

Future<Pokemon> buscarPokemon(String nome) async {
  var response = await localDio.get('pokemon/$nome');
  var data = response.data;
  return Pokemon.fromJson(Map.from(data));
}

Future<PokemonColor> getColor(dynamic nome) async {
  try {
    var response = await localDio.get('pokemon-color/${nome.toString()}/');
    var data = response.data;
    var pokeColor = PokemonColor.fromJson(Map.from(data));
    return pokeColor;
  } catch (e) {
    return PokemonColor(name: 'null');
  }
}
