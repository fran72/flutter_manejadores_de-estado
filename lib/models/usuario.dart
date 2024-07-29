class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    required this.profesiones,
  });

  copyWith({
    required String nombre,
    required int edad,
    required List<String> profesiones,
  }) {
    return Usuario(nombre: nombre, edad: edad, profesiones: profesiones);
  }
}
