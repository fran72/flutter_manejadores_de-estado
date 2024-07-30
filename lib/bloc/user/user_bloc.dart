import 'package:bloc/bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

part 'user_events.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
    on<DeleteUser>((event, emit) => emit(UserInitialState()));
    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      debugPrint('${event.age}');

      final newUser = state.user.copyWith(
          nombre: state.user.nombre,
          age: event.age,
          profesiones: state.user.profesiones);

      debugPrint('${newUser.age}');

      emit(UserSetState(newUser));
    });
    on<AddProfession>((event, emit) {
      if (!state.existUser) return;

      final List<String> newProfesiones = [
        ...state.user.profesiones,
        event.profesion
      ];

      final newUser = state.user.copyWith(
          nombre: state.user.nombre,
          age: state.user.age,
          profesiones: newProfesiones);

      emit(UserSetState(newUser));
    });
  }
}
