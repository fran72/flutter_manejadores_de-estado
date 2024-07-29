import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final userNew = Usuario(
                    nombre: 'Fran',
                    edad: 40,
                    profesiones: ['developer', 'amante', 'esposo']);
                usuarioCubit.seleccionarUsuario(userNew);
              },
              color: Colors.blue,
              child: const Text('Establecer usuario',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                usuarioCubit.cambiarEdad(20);
              },
              color: Colors.blue,
              child: const Text('Cambiar edad',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
              color: Colors.blue,
              child: const Text('Añadir profesion',
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushReplacementNamed(context, 'page1'),
        },
        child: const Icon(Icons.abc),
      ),
    );
  }
}
