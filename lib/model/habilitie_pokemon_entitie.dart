class HabilitiePokemonEntitie {
  int idPokemon;
  int idHabiliti;
  String nombre;

  HabilitiePokemonEntitie({
    required this.idPokemon,
    required this.idHabiliti,
    required this.nombre,
  });

  factory HabilitiePokemonEntitie.fromJson(Map<String, dynamic> json) =>
      HabilitiePokemonEntitie(
        idPokemon: json["idPokemon"],
        idHabiliti: json["idHabiliti"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "idPokemon": idPokemon,
        "idHabiliti": idHabiliti,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'HabilitiePokemonEntities{idPokemon: $idPokemon, idHabiliti: $idHabiliti, nombre: $nombre}';
  }
}
