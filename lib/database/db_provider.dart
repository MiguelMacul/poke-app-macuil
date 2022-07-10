import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokeappmacuil/utils/database_scripts.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database? _database;
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "pokemon.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute(DbScripts.ddlUsuario);
    await database.execute(DbScripts.ddlEquipo);
    await database.execute(DbScripts.ddlEquipoMiembros);
    await database.execute(DbScripts.ddlPokemon);
    await database.execute(DbScripts.ddlTipoPokemon);
    await database.execute(DbScripts.ddlHabilitiPokemon);
    await database.execute(DbScripts.ddlPeliculaPokemon);
    await database.execute(DbScripts.ddlEstadisticasPokemon);
  }
}
