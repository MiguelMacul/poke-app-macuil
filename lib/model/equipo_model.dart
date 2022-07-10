class EquipoModel {
  int? idEquipo;
  String nombreEquipo;

  EquipoModel({
    this.idEquipo,
    required this.nombreEquipo,
  });

  factory EquipoModel.fromJson(Map<String, dynamic> json) => EquipoModel(
        idEquipo: json["idEquipo"],
        nombreEquipo: json["nombreEquipo"],
      );

  Map<String, dynamic> toJson() => {
        "idEquipo": idEquipo,
        "nombreEquipo": nombreEquipo,
      };

  @override
  String toString() {
    return 'EquipoModel { idEquipo: $idEquipo, nombreEquipo: $nombreEquipo }';
  }
}
