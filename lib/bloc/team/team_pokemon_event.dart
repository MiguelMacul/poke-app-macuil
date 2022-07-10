part of 'team_pokemon_bloc.dart';

@immutable
abstract class TeamPokemonEvent {}

class ComenzarProcesoCrearTeam extends TeamPokemonEvent {
  final bool esActiveGenerarTeam;
  ComenzarProcesoCrearTeam({
    required this.esActiveGenerarTeam,
  });
}

class AgregarMiembroTeamPokemonEvent extends TeamPokemonEvent {
  final List<PokemonModel> pokemon;
  final bool esActiveGenerarTeam;
  final List<EquipoModel> equipo;
  AgregarMiembroTeamPokemonEvent({
    required this.pokemon,
    required this.esActiveGenerarTeam,
    required this.equipo,
  });
}

class FinalizarProcesoCrearTeam extends TeamPokemonEvent {
  final String nombreEquipo;
  final bool esActivoFinalizarTeam;
  final List<PokemonModel> pokemon;
  FinalizarProcesoCrearTeam(
      {required this.esActivoFinalizarTeam,
      required this.pokemon,
      required this.nombreEquipo});
}

class InicializarEquiposPokemonEvent extends TeamPokemonEvent {}

class ActualizarEquiposPokemonEvent extends TeamPokemonEvent {
  final List<PokemonModel>? integrantesEquipo;
  final EquipoModel equipo;
  final List<EquipoModel> equipos;
  final List<PokemonModel> listadoGeneralPokemon;
  ActualizarEquiposPokemonEvent(
      {required this.integrantesEquipo,
      required this.equipo,
      required this.equipos,
      required this.listadoGeneralPokemon});
}
