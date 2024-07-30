class Usuario {
  String nombre;
  int age;
  List<String> profesiones;

  Usuario({
    required this.nombre,
    required this.age,
    required this.profesiones,
  });

  copyWith({
    required String nombre,
    required int age,
    required List<String> profesiones,
  }) =>
      Usuario(
        nombre: this.nombre,
        age: this.age,
        profesiones: this.profesiones,
      );
}
