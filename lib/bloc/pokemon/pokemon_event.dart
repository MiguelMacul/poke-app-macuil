part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends PokemonState {}

class GetPokemons extends PokemonEvent {
  final List<PokemonModel> pokemons;
  GetPokemons({required this.pokemons});
}

class GetConsultarApis extends PokemonEvent {
  final int? limiteMaximo;
  GetConsultarApis({this.limiteMaximo});
}

class ActualizarEstadoItem extends PokemonEvent {
  final int index;
  final bool estado;
  ActualizarEstadoItem({required this.index, required this.estado});
}

class InicializarPokemonEvent extends PokemonEvent {}
