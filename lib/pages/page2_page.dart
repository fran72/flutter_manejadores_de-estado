import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario.nombre)
            : const Text('page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                final usuario = Usuario(
                    nombre: 'felipe',
                    edad: 44,
                    profesiones: ['VideoGammer', 'Developer']);
                usuarioService.usuario = usuario;
                Navigator.pushReplacementNamed(context, 'page1');
              },
              color: Colors.blue,
              child: const Text('Establecer usuario',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                usuarioService.cambiarEdad = 23;
                Navigator.pushReplacementNamed(context, 'page1');
              },
              color: Colors.blue,
              child: const Text('Cambiar edad',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                usuarioService.addProfesion();
                Navigator.pushReplacementNamed(context, 'page1');
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
