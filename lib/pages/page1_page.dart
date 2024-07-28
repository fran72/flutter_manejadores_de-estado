import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario.nombre)
            : const Text('page1'),
        actions: [
          IconButton(
            onPressed: () {
              usuarioService.borrarUser();
            },
            icon: const Icon(Icons.abc),
          )
        ],
      ),
      body: usuarioService.existeUsuario
          ? const InformacionUsuario()
          : const Text('No existe usuario'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, 'page2'),
        },
        child: const Icon(Icons.abc),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuarioService.usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuarioService.usuario.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: usuarioService.usuario.profesiones.length,
              itemBuilder: (context, index) => ListTile(
                  title: Text(usuarioService.usuario.profesiones[index])),
            ),
          )
        ],
      ),
    );
  }
}
