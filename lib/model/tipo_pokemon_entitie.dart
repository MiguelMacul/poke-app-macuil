class TipoPokemonEntitie {
  int idPokemon;
  int idTipo;
  String nombre;

  TipoPokemonEntitie(
      {required this.idPokemon, required this.idTipo, required this.nombre});

  factory TipoPokemonEntitie.fromJson(Map<String, dynamic> json) =>
      TipoPokemonEntitie(
        idPokemon: json["idPokemon"],
        idTipo: json["idTipo"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "idPokemon": idPokemon,
        "idTipo": idTipo,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'TipoPokemonEntitie{idPokemon: $idPokemon, idTipo: $idTipo, nombre: $nombre}';
  }
}
