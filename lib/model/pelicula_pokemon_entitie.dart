class PelicularPokemonEntitie {
  int idPokemon;
  String nombre;

  PelicularPokemonEntitie({
    required this.idPokemon,
    required this.nombre,
  });

  factory PelicularPokemonEntitie.fromJson(Map<String, dynamic> json) =>
      PelicularPokemonEntitie(
          idPokemon: json["idPokemon"], nombre: json["nombre"]);

  Map<String, dynamic> toJson() => {
        "idPokemon": idPokemon,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'PelicularPokemonEntitie { idPokemon: $idPokemon, nombre: $nombre }';
  }
}
