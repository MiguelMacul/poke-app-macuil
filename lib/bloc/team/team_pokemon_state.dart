part of 'team_pokemon_bloc.dart';

@immutable
abstract class TeamPokemonState {
  bool esActiveGenerarTeam;
  List<PokemonModel>? pokemons;
  List<EquipoModel>? equipos;
  List<PokemonEntitie>? pokemonsTeam;
  String? nombreEquipo;
  TeamPokemonState({
    this.esActiveGenerarTeam = false,
    this.pokemons,
    this.equipos,
    this.pokemonsTeam,
    this.nombreEquipo,
  });
}

class TeamPokemonInitial extends TeamPokemonState {
  TeamPokemonInitial() : super();
}

class ActualizarEstadoActivarTeam extends TeamPokemonState {
  ActualizarEstadoActivarTeam({required bool esActiveGenerarTeam})
      : super(esActiveGenerarTeam: esActiveGenerarTeam);
}

class ActualizarEquipoState extends TeamPokemonState {
  ActualizarEquipoState(
      {required List<PokemonModel> pokemons, required bool esActiveGenerarTeam})
      : super(pokemons: pokemons, esActiveGenerarTeam: esActiveGenerarTeam);
}

class ActualizarEstadoActivarFinalizarTeamState extends TeamPokemonState {
  ActualizarEstadoActivarFinalizarTeamState(
      {required List<PokemonModel> pokemons})
      : super(pokemons: pokemons);
}

class InicializarEquiposPokemon extends TeamPokemonState {
  InicializarEquiposPokemon({required List<EquipoModel> equipos})
      : super(equipos: equipos);
}

class ActualizarEquiposPokemonState extends TeamPokemonState {
  ActualizarEquiposPokemonState(
      {required List<PokemonModel> miembroEquipo,
      required List<PokemonEntitie> pokemons,
      required String nombreEquipo})
      : super(
            pokemons: miembroEquipo,
            pokemonsTeam: pokemons,
            nombreEquipo: nombreEquipo);
}
