class EquiposMiembrosModel {
  int idEquipo;
  int idPokemon;

  EquiposMiembrosModel({required this.idEquipo, required this.idPokemon});

  Map<String, dynamic> toJson() => {
        'idEquipo': idEquipo,
        'idPokemon': idPokemon,
      };

  factory EquiposMiembrosModel.fromJson(Map<String, dynamic> json) {
    return EquiposMiembrosModel(
      idEquipo: json['idEquipo'],
      idPokemon: json['idPokemon'],
    );
  }

  @override
  String toString() {
    return 'EquiposMiembrosModel{idEquipo: $idEquipo, idPokemon: $idPokemon}';
  }
}
