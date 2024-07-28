import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario = Usuario(nombre: '', edad: 0, profesiones: []);

  // ignore: unnecessary_getters_setters
  Usuario get usuario => _usuario;
  bool get existeUsuario => (_usuario.nombre != '') ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  set cambiarEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void borrarUser() {
    _usuario = Usuario(nombre: '', edad: 0, profesiones: []);
    notifyListeners();
  }

  void addProfesion() {
    _usuario.profesiones.add('Profesion: ${_usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
