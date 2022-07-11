import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokeappmacuil/model/estadistica_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/habilitie_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/pelicula_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/pokemon_entitie.dart';
import 'package:pokeappmacuil/model/pokemon_color_model.dart';
import 'package:pokeappmacuil/model/pokemon_model.dart';
import 'package:pokeappmacuil/model/tipo_pokemon_entitie.dart';
import 'package:pokeappmacuil/repository/repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _repositorio = Repository();
  PokemonBloc() : super(HomeInitial()) {
    on<GetConsultarApis>(((event, emit) async {
      emit(HomeInitial(
          pokemons:
              await getPokemons(limiteMaximo: event.limiteMaximo ?? 150)));
    }));
    on<ActualizarEstadoItem>(((event, emit) {
      state.selected![event.index] = event.estado;
      emit(ActualizarEstadoItems(
          pokemons: state.pokemons, selected: state.selected));
    }));

    on<InicializarPokemonEvent>((event, emit) async {
      emit(HomeInitial(pokemons: state.pokemons));
    });
  }

  Future<List<PokemonModel>> getPokemons({int? limiteMaximo}) async {
    var rutasPokemon =
        await _repositorio.getPagePokemon(maximoLimite: limiteMaximo);
    List<PokemonModel> pokemons = [];
    List<bool> selected = [];

    var pokemonEnDatabase = await _repositorio.obtenerPokemon();

    if (pokemonEnDatabase.length == limiteMaximo) {
      var j = 0;
      var bandera2 = true;
      do {
        var tipoPokemon = await _repositorio.obtenerSubtipoPokemon(
            idPokemon: pokemonEnDatabase[j].idPokemon!);
        var habilidadesPokemon = await _repositorio.obtenerHabilidadesPokemon(
            idPokemon: pokemonEnDatabase[j].idPokemon!);

        var estadisticasPokemon = await _repositorio.obtenerEstadisticasPokemon(
            idPokemon: pokemonEnDatabase[j].idPokemon!);

        var peliculasPokemon = await _repositorio.obtenerPeliculasPokemon(
            idPokemon: pokemonEnDatabase[j].idPokemon!);

        pokemons.add(
          PokemonModel(
            id: pokemonEnDatabase[j].idPokemon,
            name: pokemonEnDatabase[j].nombre,
            sprites: Sprites(
              other:
                  Other(home: Home(frontDefault: pokemonEnDatabase[j].imagen)),
            ),
            abilities: abitityToAbilityPokemonEntitie(habilidadesPokemon),
            stats: statToStatPokemonEntitie(estadisticasPokemon),
            species: Species(name: pokemonEnDatabase[j].especie),
            weight: pokemonEnDatabase[j].weight,
            height: pokemonEnDatabase[j].height,
            types: typeToTipePokemonEntitie(tipoPokemon),
            color: Color(name: pokemonEnDatabase[j].color),
            moves: moveToMovePokemonEntitie(peliculasPokemon),
          ),
        );

        if ((pokemonEnDatabase.length - 1) > j) {
          j++;
        } else {
          bandera2 = false;
        }
      } while (bandera2);
    } else {
      var i = 0;
      var bandera = true;
      try {
        do {
          var pokemon =
              await _repositorio.getPokemon(url: rutasPokemon.results[i].url);
          var pokemoncolores =
              await _repositorio.getColoresPokemon(id: pokemon.id!);
          if (pokemoncolores != null) {
            pokemon.color = pokemoncolores.color;
          }
          var eggpokemon =
              await _repositorio.getEggPokemon(idPokemon: pokemon.id!);
          if (eggpokemon != null) {
            pokemon.eggPokemonModel = eggpokemon;
          }
          _repositorio.crearPokemon(
              pokemonEntitie: PokemonEntitie(
            idPokemon: pokemon.id!,
            nombre: pokemon.name!,
            imagen: pokemon.sprites!.other!.home!.frontDefault.toString(),
            color: pokemoncolores.color.name,
            weight: pokemon.weight!,
            height: pokemon.height!,
            especie: pokemon.species!.name!,
          ));
          int j = 0;
          pokemon.stats!.forEach((element) {
            _repositorio.crearNuevaEstadisticaPokemon(
                estadisticaPokemonEntitie: EstadisticaPokemonEntitie(
              idPokemon: pokemon.id!,
              idEstadisticas: j,
              nombre: element.stat!.name!,
              valor: element.baseStat!,
            ));
          });
          pokemon.moves!.forEach((element) {
            _repositorio.crearNuevaPeliculaPokemon(
              pelicularPokemonEntitie: PelicularPokemonEntitie(
                idPokemon: pokemon.id!,
                nombre: element.move!.name!,
              ),
            );
          });
          pokemon.abilities!.forEach((element) {
            _repositorio.crearNuevaHabilidadPokemon(
              habilitiePokemonEntitie: HabilitiePokemonEntitie(
                  idHabiliti: element.slot!,
                  idPokemon: pokemon.id!,
                  nombre: element.ability!.name!),
            );
          });
          pokemon.types!.forEach((element) {
            _repositorio.crearSubTipoPokemon(
                tipoPokemonEntitie: TipoPokemonEntitie(
              idPokemon: pokemon.id!,
              idTipo: element.slot!,
              nombre: element.type!.name!,
            ));
          });
          pokemons.add(pokemon);
          if (i == rutasPokemon.results.length - 1) bandera = false;
          i += 1;
        } while (bandera);
      } catch (e) {
        print(e);
      }
    }

    return pokemons;
  }

  List<Type> typeToTipePokemonEntitie(List<TipoPokemonEntitie> tiposPokemon) {
    List<Type> tipos = [];
    tiposPokemon.forEach((element) {
      tipos.add(Type(
        slot: element.idPokemon,
        type: Species(name: element.nombre),
      ));
    });
    return tipos;
  }

  List<Ability> abitityToAbilityPokemonEntitie(
      List<HabilitiePokemonEntitie> habilidadesPokemon) {
    List<Ability> abilityes = [];
    habilidadesPokemon.forEach((element) {
      abilityes.add(Ability(
        slot: element.idHabiliti,
        ability: Species(name: element.nombre),
      ));
    });
    return abilityes;
  }

  List<Stat> statToStatPokemonEntitie(
      List<EstadisticaPokemonEntitie> estadisticasPokemon) {
    List<Stat> stats = [];
    estadisticasPokemon.forEach((element) {
      stats.add(Stat(
        baseStat: element.valor,
        stat: Species(name: element.nombre),
      ));
    });
    return stats;
  }

  List<Move> moveToMovePokemonEntitie(
      List<PelicularPokemonEntitie> peliculasPokemon) {
    List<Move> moves = [];
    peliculasPokemon.forEach((element) {
      moves.add(Move(
        move: Species(name: element.nombre),
      ));
    });
    return moves;
  }
}
