import 'package:pokeappmacuil/api/pokemon_api.dart';
import 'package:pokeappmacuil/dao/pokemon_dao.dart';
import 'package:pokeappmacuil/dao/team_pokemon_dao.dart';
import 'package:pokeappmacuil/dao/user_dao.dart';
import 'package:pokeappmacuil/model/egg_pokemon_model.dart';
import 'package:pokeappmacuil/model/equipo_model.dart';
import 'package:pokeappmacuil/model/equipos_miembros_model.dart';
import 'package:pokeappmacuil/model/estadistica_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/habilitie_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/paginated_pokemon_model.dart';
import 'package:pokeappmacuil/model/pelicula_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/pokemon_color_model.dart';
import 'package:pokeappmacuil/model/pokemon_entitie.dart';
import 'package:pokeappmacuil/model/pokemon_model.dart';
import 'package:pokeappmacuil/model/tipo_pokemon_entitie.dart';
import 'package:pokeappmacuil/model/user_model.dart';

class Repository {
  final userDao = UserDao();
  final teamPokemonDao = TeamPokemonDao();
  final pokemonApi = PokemonApi();
  final pokemonDao = PokemonDao();
  Future getAllTodos({required UserModel newUserModel}) =>
      userDao.crearUsuario(newUserModel);

  Future<PaginatedPokemonModel> getPagePokemon(
          {int? maximoLimite, int? minimoLimite}) =>
      pokemonApi.getPagePokemon(
          maximoLimite: maximoLimite, minimoLimite: minimoLimite);

  Future<PokemonModel> getPokemon({required String url}) =>
      pokemonApi.getPokemon(url);

  Future<PokemonColorModel> getColoresPokemon({required int id}) =>
      pokemonApi.getColoresPokemon(id);

  Future createUser({required UserModel userModel}) =>
      userDao.crearUsuario(userModel);

  Future getUsuario() => userDao.getUsuario();

  Future<EggPokemonModel?> getEggPokemon({required int idPokemon}) =>
      pokemonApi.getEggPokemon(idpokemon: idPokemon);

  Future createTeam({required EquipoModel equipoModel}) =>
      teamPokemonDao.crearEquipo(equipoModel: equipoModel);

  Future vincularMiembroEquipo(EquiposMiembrosModel equiposMiembrosModel) =>
      teamPokemonDao.vincularEquipoIntegrantes(
          equipoModel: equiposMiembrosModel);

  Future<List<EquipoModel>> getEquipos() => teamPokemonDao.getEquipos();

  Future<List<EquiposMiembrosModel>> getMiembroEquipo(
          {required int idEquipo}) =>
      teamPokemonDao.getMiembroEquipo(idEquipo: idEquipo);

  Future crearPokemon({required PokemonEntitie pokemonEntitie}) =>
      pokemonDao.crearPokemon(pokemonEntitie: pokemonEntitie);

  Future<PokemonEntitie?> obtenerPokemonPorId({required int idPokemon}) =>
      pokemonDao.getPokemonById(idPokemon: idPokemon);

  Future crearSubTipoPokemon(
          {required TipoPokemonEntitie tipoPokemonEntitie}) =>
      pokemonDao.crearSubtipoPokemon(tipoPokemonEntitie: tipoPokemonEntitie);

  Future<List<PokemonEntitie>> obtenerPokemon() => pokemonDao.getPokemons();

  Future<List<TipoPokemonEntitie>> obtenerSubtipoPokemon(
          {required int idPokemon}) =>
      pokemonDao.getSubtipoPokemons(idPokemon: idPokemon);

  Future<List<HabilitiePokemonEntitie>> obtenerHabilidadesPokemon(
          {required int idPokemon}) =>
      pokemonDao.getHabilitiePokemons(idPokemon: idPokemon);

  Future<int> crearNuevaHabilidadPokemon(
          {required HabilitiePokemonEntitie habilitiePokemonEntitie}) =>
      pokemonDao.crearHabilitiePokemon(
          habilitiePokemonEntitie: habilitiePokemonEntitie);

  Future<int> crearNuevaEstadisticaPokemon(
          {required EstadisticaPokemonEntitie estadisticaPokemonEntitie}) =>
      pokemonDao.crearEstadisticaPokemon(
          estadisticaPokemonEntitie: estadisticaPokemonEntitie);

  Future<List<EstadisticaPokemonEntitie>> obtenerEstadisticasPokemon(
          {required int idPokemon}) =>
      pokemonDao.getEstadisticaPokemons(idPokemon: idPokemon);

  Future<int> crearNuevaPeliculaPokemon(
          {required PelicularPokemonEntitie pelicularPokemonEntitie}) =>
      pokemonDao.crearMoviePokemon(
          pelicularPokemonEntitie: pelicularPokemonEntitie);

  Future<List<PelicularPokemonEntitie>> obtenerPeliculasPokemon(
          {required int idPokemon}) =>
      pokemonDao.getPeliculasPokemons(idPokemon: idPokemon);
}
