import 'package:sqflite/sqlite_api.dart';
import 'package:pokeappmacuil/database/db_provider.dart';
import 'package:pokeappmacuil/model/equipo_model.dart';
import 'package:pokeappmacuil/model/equipos_miembros_model.dart';

class TeamPokemonDao {
  final _table = 'Equipos';
  final _table2 = 'EquiposMiembros';
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> crearEquipo({required EquipoModel equipoModel}) async {
    final db = await dbProvider.database;
    var result = db!.insert(_table, equipoModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> vincularEquipoIntegrantes(
      {required EquiposMiembrosModel equipoModel}) async {
    final db = await dbProvider.database;
    var result = db!.insert(_table2, equipoModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<EquipoModel>> getEquipos() async {
    final db = await dbProvider.database;
    final result = await db!.query(_table);
    List<EquipoModel> todos = result.isNotEmpty
        ? result.map((item) => EquipoModel.fromJson(item)).toList()
        : [];
    return todos;
  }

  Future<List<EquiposMiembrosModel>> getMiembroEquipo(
      {required int idEquipo}) async {
    final db = await dbProvider.database;
    List<EquiposMiembrosModel> todos;
    final result2 =
        await db!.query(_table2, where: 'idEquipo = ?', whereArgs: [idEquipo]);
    todos = result2.isNotEmpty
        ? result2.map((item) => EquiposMiembrosModel.fromJson(item)).toList()
        : [];
    return todos;
  }
}
