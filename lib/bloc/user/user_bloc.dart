import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokeappmacuil/model/user_model.dart';
import 'package:pokeappmacuil/repository/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _repositorio = Repository();
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AgregarUsuario>((event, emit) {
      _repositorio.createUser(userModel: event.user);
      emit(UserCambiar(newUser: event.user, existe: true));
    });
    on<ActualizarUsuario>((event, emit) async {
      var salida = await _repositorio.getUsuario();

      if (salida == null) {
        emit(UserInitial(user: null, existe: false));
      } else {
        emit(UserInitial(user: salida, existe: true));
      }
    });
  }
}
