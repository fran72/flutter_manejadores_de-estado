import 'package:estados_app/bloc/user/user_bloc.dart';
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
              BlocProvider.of<UserBloc>(context).add(DeleteUser());
            },
            icon: const Icon(Icons.abc),
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
              ? InformacionUsuario(user: state.user)
              : const Text('No hay usuarios');
        },
      ),
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
  final Usuario user;
  const InformacionUsuario({
    super.key,
    required this.user,
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
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.age}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: user.profesiones.length,
            itemBuilder: (context, index) =>
                ListTile(title: Text(user.profesiones[index])),
          ))
        ],
      ),
    );
  }
}
