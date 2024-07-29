import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page1'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            },
            icon: const Icon(Icons.abc),
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, 'page2'),
        },
        child: const Icon(Icons.abc),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        if (state is UsuarioInitial) {
          return const Text('No hay información del usuario');
        } else if (state is UsuarioActivo) {
          return InformacionUsuario(usuarioActivo: state.usuario);
        } else {
          return const Text('data');
        }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuarioActivo;
  const InformacionUsuario({
    super.key,
    required this.usuarioActivo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuarioActivo.nombre}')),
          ListTile(title: Text('Edad: ${usuarioActivo.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: usuarioActivo.profesiones.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(usuarioActivo.profesiones[index])),
            ),
          )
        ],
      ),
    );
  }
}
