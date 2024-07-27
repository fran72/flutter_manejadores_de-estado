import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            stream: usuarioService.usuarioStream,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
              return snapshot.hasData
                  ? Text(usuarioService.usuario.nombre)
                  : const Text('No existe usuario');
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final user = Usuario(
                    nombre: 'Fran', edad: 42, profesiones: ['developer']);
                usuarioService.setUser(user);
              },
              color: Colors.blue,
              child: const Text('Establecer usuario',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                usuarioService.setEdad(32);
              },
              color: Colors.blue,
              child: const Text('Cambiar edad',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {},
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
