import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeappmacuil/model/equipo_model.dart';
import 'package:pokeappmacuil/model/equipos_miembros_model.dart';
import 'package:pokeappmacuil/model/pokemon_entitie.dart';

import 'package:pokeappmacuil/model/pokemon_model.dart';
import 'package:pokeappmacuil/repository/repository.dart';

part 'team_pokemon_event.dart';
part 'team_pokemon_state.dart';

class TeamPokemonBloc extends Bloc<TeamPokemonEvent, TeamPokemonState> {
  final _repositorio = Repository();
  TeamPokemonBloc() : super(TeamPokemonInitial()) {
    on<ComenzarProcesoCrearTeam>((event, emit) {
      emit(ActualizarEstadoActivarTeam(
        esActiveGenerarTeam: event.esActiveGenerarTeam,
      ));
    });
    on<AgregarMiembroTeamPokemonEvent>((event, emit) {
      emit(ActualizarEquipoState(
        pokemons: event.pokemon,
        esActiveGenerarTeam: event.esActiveGenerarTeam,
      ));
    });
    on<FinalizarProcesoCrearTeam>((event, emit) async {
      var idTeam = await _repositorio.createTeam(
        equipoModel: EquipoModel(
          nombreEquipo: event.nombreEquipo,
        ),
      );
      var bandera = true;
      int i = 0;
      do {
        await _repositorio.vincularMiembroEquipo(
          EquiposMiembrosModel(
            idEquipo: idTeam,
            idPokemon: event.pokemon[i].id!,
          ),
        );
        if ((event.pokemon.length - 1) > i) {
          bandera = true;
        } else {
          bandera = false;
        }
        i = i + 1;
      } while (bandera);
      emit(ActualizarEstadoActivarFinalizarTeamState(
        pokemons: event.pokemon,
      ));
    });
    on<InicializarEquiposPokemonEvent>((event, emit) async {
      var equipos = await _repositorio.getEquipos();
      emit(InicializarEquiposPokemon(equipos: equipos));
    });
    on<ActualizarEquiposPokemonEvent>((event, emit) async {
      var listMiembro =
          await _repositorio.getMiembroEquipo(idEquipo: event.equipo.idEquipo!);
      int i = 0;
      bool bandera = true;
      List<PokemonEntitie> pokemons = [];
      do {
        var pokemon = await _repositorio.obtenerPokemonPorId(
          idPokemon: listMiembro[i].idPokemon,
        );
        if ((listMiembro.length - 1) > i) {
          pokemons.add(pokemon!);
        } else {
          bandera = false;
        }
        i = i + 1;
      } while (bandera);
      emit(ActualizarEquiposPokemonState(
        miembroEquipo: event.integrantesEquipo ?? [],
        pokemons: pokemons,
        nombreEquipo: event.equipo.nombreEquipo,
      ));
    });
  }
}
