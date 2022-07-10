class PokemonEntitie {
  int? idPokemon;
  String nombre;
  String imagen;
  String color;
  String especie;
  int height;
  int weight;

  PokemonEntitie({
    required this.nombre,
    required this.imagen,
    required this.color,
    this.idPokemon,
    required this.especie,
    required this.height,
    required this.weight,
  });

  factory PokemonEntitie.fromJson(Map<String, dynamic> json) => PokemonEntitie(
        idPokemon: json["idPokemon"],
        nombre: json["nombre"],
        imagen: json["imagen"],
        color: json["color"],
        especie: json["especie"],
        height: json["height"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "idPokemon": idPokemon,
        "nombre": nombre,
        "imagen": imagen,
        "color": color,
        "especie": especie,
        "height": height,
        "weight": weight,
      };

  @override
  String toString() {
    return 'PokemonEntities{idPokemon: $idPokemon, nombre: $nombre, imagen: $imagen, color: $color, especie: $especie, height: $height, weight: $weight}';
  }
}
