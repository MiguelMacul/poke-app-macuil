part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class AgregarUsuario extends UserEvent {
  final UserModel user;

  AgregarUsuario({required this.user});
}

class ActualizarUsuario extends UserEvent {}
