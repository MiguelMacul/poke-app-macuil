import 'dart:async';

import 'package:pokeappmacuil/database/db_provider.dart';
import 'package:pokeappmacuil/model/user_model.dart';

class UserDao {
  final _table = 'Usuarios';
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> crearUsuario(UserModel userModel) async {
    final db = await dbProvider.database;
    var result = db!.insert(_table, userModel.toJson());
    return result;
  }

  Future<UserModel?> getUsuario() async {
    final db = await dbProvider.database;
    final res = await db!.query(_table);
    return res.isNotEmpty ? UserModel.fromJson(res.first) : null;
  }
}
