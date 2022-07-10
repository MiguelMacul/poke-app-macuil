import 'package:sqflite/sqflite.dart';

import 'package:pokeappmacuil/database/db_provider.dart';
import 'package:pokeappmacuil/model/estadistica_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/habilitie_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/pelicula_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/pokemon_entitie.dart';
import 'package:pokeappmacuil/model/tipo_pokemon_entitie.dart';

class PokemonDao {
  final _table = 'Pokemon';
  final _table2 = 'TipoPokemon';
  final _table3 = 'HabilitiPokemon';
  final _table4 = 'EstadisticasPokemon';
  final _table5 = 'PeliculaPokemon';
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> crearPokemon({required PokemonEntitie pokemonEntitie}) async {
    final db = await dbProvider.database;
    var result = db!.insert(_table, pokemonEntitie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> crearSubtipoPokemon(
      {required TipoPokemonEntitie tipoPokemonEntitie}) async {
    final db = await dbProvider.database;
    var result = db!.insert(_table2, tipoPokemonEntitie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<PokemonEntitie>> getPokemons() async {
    final db = await dbProvider.database;
    var result = await db!.query(_table);
    List<PokemonEntitie> list = result.isNotEmpty
        ? result.map((c) => PokemonEntitie.fromJson(c)).toList()
        : [];
    return list;
  }

  Future<PokemonEntitie?> getPokemonById({required int idPokemon}) async {
    final db = await dbProvider.database;
    var result =
        await db!.query(_table, where: 'idPokemon = ?', whereArgs: [idPokemon]);
    PokemonEntitie? list =
        result.isNotEmpty ? PokemonEntitie.fromJson(result.first) : null;
    return list;
  }

  Future<List<TipoPokemonEntitie>> getSubtipoPokemons(
      {required int idPokemon}) async {
    final db = await dbProvider.database;
    var result = await db!
        .query(_table2, where: 'idPokemon = ?', whereArgs: [idPokemon]);
    List<TipoPokemonEntitie> list = result.isNotEmpty
        ? result.map((c) => TipoPokemonEntitie.fromJson(c)).toList()
        : [];
    return list;
  }

  Future<int> crearHabilitiePokemon(
      {required HabilitiePokemonEntitie habilitiePokemonEntitie}) async {
    final db = await dbProvider.database;
    var result = db!.insert(_table3, habilitiePokemonEntitie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<HabilitiePokemonEntitie>> getHabilitiePokemons(
      {required int idPokemon}) async {
    final db = await dbProvider.database;
    var result = await db!
        .query(_table3, where: 'idPokemon = ?', whereArgs: [idPokemon]);
    List<HabilitiePokemonEntitie> list = result.isNotEmpty
        ? result.map((c) => HabilitiePokemonEntitie.fromJson(c)).toList()
        : [];
    return list;
  }

  Future<int> crearEstadisticaPokemon(
      {required EstadisticaPokemonEntitie estadisticaPokemonEntitie}) async {
    final db = await dbProvider.database;

    var result = db!.insert(_table4, estadisticaPokemonEntitie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<EstadisticaPokemonEntitie>> getEstadisticaPokemons(
      {required int idPokemon}) async {
    final db = await dbProvider.database;
    var result = await db!
        .query(_table4, where: 'idPokemon = ?', whereArgs: [idPokemon]);
    List<EstadisticaPokemonEntitie> list = result.isNotEmpty
        ? result.map((c) => EstadisticaPokemonEntitie.fromJson(c)).toList()
        : [];
    return list;
  }

  Future<int> crearMoviePokemon(
      {required PelicularPokemonEntitie pelicularPokemonEntitie}) async {
    final db = await dbProvider.database;

    var result = db!.insert(_table5, pelicularPokemonEntitie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<PelicularPokemonEntitie>> getPeliculasPokemons(
      {required int idPokemon}) async {
    final db = await dbProvider.database;
    var result = await db!
        .query(_table5, where: 'idPokemon = ?', whereArgs: [idPokemon]);
    List<PelicularPokemonEntitie> list = result.isNotEmpty
        ? result.map((c) => PelicularPokemonEntitie.fromJson(c)).toList()
        : [];
    return list;
  }
}
