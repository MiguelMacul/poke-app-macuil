import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokeappmacuil/model/egg_pokemon_model.dart';
import 'package:pokeappmacuil/model/paginated_pokemon_model.dart';
import 'package:pokeappmacuil/model/pokemon_color_model.dart';
import 'package:pokeappmacuil/model/pokemon_model.dart';

import 'package:pokeappmacuil/utils/global_constants.dart';

class PokemonApi {
  Future<PaginatedPokemonModel> getPagePokemon(
      {int? maximoLimite = 150, int? minimoLimite = 0}) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${GlobalConstants.urlBase}pokemon?offset=${minimoLimite.toString()}&limit=${maximoLimite.toString()}'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final parsed = json.decode(await response.stream.bytesToString());
      return PaginatedPokemonModel.fromJson(parsed);
    } else {
      throw Exception(
          'Error al ejecutar proceso de obtener la paginacion pokemon${response.reasonPhrase}');
    }
  }

  Future<PokemonModel> getPokemon(String direccionApiPokemon) async {
    var request = http.Request('GET', Uri.parse(direccionApiPokemon));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final parsed = json.decode(await response.stream.bytesToString());
      return PokemonModel.fromJson(parsed);
    } else {
      throw Exception(
          'Error al ejecutar proceso de obtener el getPokemon${response.reasonPhrase}');
    }
  }

  Future<PokemonColorModel> getColoresPokemon(int idPokemon) async {
    var request = http.Request('GET',
        Uri.parse('${GlobalConstants.urlBase}pokemon-species/${idPokemon}/'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final parsed = json.decode(await response.stream.bytesToString());
      return PokemonColorModel.fromJson(parsed);
    } else {
      throw Exception(
          'Error al ejecutar proceso de obtener el getColoresPokemon${response.reasonPhrase}');
    }
  }

  Future<EggPokemonModel?> getEggPokemon({required int idpokemon}) async {
    var request = http.Request(
        'GET', Uri.parse('${GlobalConstants.urlBase}egg-group/${idpokemon}/'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final parsed = json.decode(await response.stream.bytesToString());
      return EggPokemonModel.fromJson(parsed);
    } else {
      return null;
    }
  }
}
