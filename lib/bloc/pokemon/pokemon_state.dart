part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {
  List<PokemonModel>? pokemons;
  List<bool>? selected;
  PokemonState({
    this.pokemons,
    this.selected,
  });
}

class HomeInitial extends PokemonState {
  HomeInitial({
    List<PokemonModel>? pokemons,
  }) : super(pokemons: pokemons) {
    if (pokemons != null) {
      selected = List.generate(pokemons.length, (index) => false);
    }
  }
}

class ActualizarEstadoItems extends PokemonState {
  ActualizarEstadoItems({List<PokemonModel>? pokemons, List<bool>? selected})
      : super(pokemons: pokemons, selected: selected);
}
