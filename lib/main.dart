// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro.dart';
import 'package:galaxyfy_application/pages/home.dart';
import 'package:galaxyfy_application/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galaxyfy',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        // '/': (context) => const Login_GalaxyFy(),
        '/cadastro': (context) => const Cadastro_GalaxyFy(),
        // '/home': (context) => const Home(),
      },
    );
  }
}
