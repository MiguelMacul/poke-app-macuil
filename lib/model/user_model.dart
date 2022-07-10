class UserModel {
  late int? id;
  String usuario;

  UserModel({required this.usuario, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      usuario: json['usuario'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['usuario'] = usuario;
    return data;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, usuario: $usuario}';
  }
}
