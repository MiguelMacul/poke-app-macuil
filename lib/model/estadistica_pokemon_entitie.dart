class EstadisticaPokemonEntitie {
  int idPokemon;
  int idEstadisticas;
  String nombre;
  int valor;

  EstadisticaPokemonEntitie({
    required this.idPokemon,
    required this.idEstadisticas,
    required this.nombre,
    required this.valor,
  });
  Map<String, dynamic> toJson() => {
        'idPokemon': idPokemon,
        'idEstadisticas': idEstadisticas,
        'nombre': nombre,
        'valor': valor,
      };

  factory EstadisticaPokemonEntitie.fromJson(Map<String, dynamic> json) =>
      EstadisticaPokemonEntitie(
          idPokemon: json["idPokemon"],
          idEstadisticas: json["idEstadisticas"],
          nombre: json["nombre"],
          valor: json["valor"]);

  @override
  String toString() {
    return 'EstadisticaPokemonEntitie { idPokemon: $idPokemon, idEstadisticas: $idEstadisticas, nombre: $nombre, valor: $valor }';
  }
}
