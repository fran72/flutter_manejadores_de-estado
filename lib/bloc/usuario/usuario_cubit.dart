import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(
        nombre: currentState.usuario.nombre,
        edad: edad,
        profesiones: currentState.usuario.profesiones,
      );
      currentState.usuario.edad = edad;
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final List<String> newProfesiones = [
        ...currentState.usuario.profesiones,
        'value'
      ];
      debugPrint('$newProfesiones');
      final newUser = currentState.usuario.copyWith(
        nombre: currentState.usuario.nombre,
        edad: currentState.usuario.edad,
        profesiones: newProfesiones,
      );
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
