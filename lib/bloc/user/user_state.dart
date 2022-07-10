part of 'user_bloc.dart';

@immutable
abstract class UserState {
  UserModel? user;
  bool existe;
  UserState({this.user, required this.existe});
}

class UserInitial extends UserState {
  UserModel? user;
  bool existe;
  UserInitial({this.user, this.existe = false})
      : super(user: user, existe: existe);
}

class UserCambiar extends UserState {
  UserModel newUser;
  bool existe;
  UserCambiar({required this.newUser, required this.existe})
      : super(user: newUser, existe: existe);
}
