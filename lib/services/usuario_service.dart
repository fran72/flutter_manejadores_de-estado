import 'dart:async';

import 'package:estados_app/models/usuario.dart';

class _UsuarioService {
  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Usuario _usuario = Usuario(nombre: '', edad: 0, profesiones: []);

  Usuario get usuario => _usuario;

  bool get existeUsuario => (_usuario.nombre != '') ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void setUser(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  void setEdad(int edad) {
    _usuario.edad = edad;
    _usuarioStreamController.add(_usuario);
  }

  void setProfesiones(List<String> profesiones) {
    _usuario.profesiones = profesiones;
    _usuarioStreamController.add(_usuario);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
