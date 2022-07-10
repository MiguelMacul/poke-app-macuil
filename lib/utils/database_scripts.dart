/*
 * DDL Scripts para creación de la estructura de la base de datos sqlite
 */
class DbScripts {
  static const String ddlUsuario = 'CREATE TABLE Usuarios ('
      'id	INTEGER PRIMARY KEY AUTOINCREMENT,'
      'usuario VARCHAR(250)'
      ')';

  static const String ddlEquipo = 'CREATE TABLE Equipos ('
      'idEquipo	INTEGER PRIMARY KEY AUTOINCREMENT,'
      'nombreEquipo VARCHAR(250)'
      ')';

  static const String ddlEquipoMiembros = 'CREATE TABLE EquiposMiembros ('
      'idEquipo	INTEGER,'
      'idPokemon INTEGER'
      ')';
  static const String ddlPokemon = 'CREATE TABLE Pokemon ('
      'idPokemon	INTEGER PRIMARY KEY,'
      'nombre VARCHAR(250),'
      'color VARCHAR(250),'
      'imagen VARCHAR(250),'
      'especie VARCHAR(250),'
      'height INTEGER,'
      'weight INTEGER'
      ')';
  static const String ddlTipoPokemon = 'CREATE TABLE TipoPokemon ('
      'idPokemon	INTEGER  ,'
      'idTipo	INTEGER,'
      'nombre VARCHAR(250)'
      ')';

  static const String ddlHabilitiPokemon = 'CREATE TABLE HabilitiPokemon ('
      'idPokemon	INTEGER  ,'
      'idHabiliti	INTEGER,'
      'nombre VARCHAR(250)'
      ')';

  static const String ddlEstadisticasPokemon =
      'CREATE TABLE EstadisticasPokemon ('
      'idPokemon	INTEGER  ,'
      'idEstadisticas	INTEGER,'
      'nombre VARCHAR(250),'
      'valor INTEGER '
      ')';

  static const String ddlPeliculaPokemon = 'CREATE TABLE PeliculaPokemon ('
      'idPokemon	INTEGER  ,'
      'nombre VARCHAR(250)'
      ')';
}
