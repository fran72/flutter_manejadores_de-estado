import 'package:estados_app/bloc/user/user_bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
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
                final newUser = Usuario(
                    nombre: 'Fran', age: 32, profesiones: ['Developer']);
                BlocProvider.of<UserBloc>(context)
                    .add(ActivateUser(user: newUser));
              },
              color: Colors.blue,
              child: const Text('Establecer usuario',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(ChangeUserAge(age: 44));
              },
              color: Colors.blue,
              child: const Text('Cambiar edad',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context)
                    .add(AddProfession(profesion: 'new-one'));
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
