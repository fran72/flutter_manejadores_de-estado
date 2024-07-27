import 'package:flutter/material.dart';

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
              onPressed: () {},
              color: Colors.blue,
              child: const Text('Establecer usuario',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {},
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
