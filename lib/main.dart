import 'package:estados_app/pages/page1_page.dart';
import 'package:estados_app/pages/page2_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => const Page1Page(),
        'page2': (_) => const Page2Page(),
      },
    );
  }
}
