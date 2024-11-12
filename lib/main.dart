// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro2.dart';
import 'package:galaxyfy_application/pages/home.dart';
import 'package:galaxyfy_application/pages/login.dart';
import 'package:galaxyfy_application/pages/perfil.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/splash.dart';
import 'package:galaxyfy_application/pages/catalago.dart'; 
import 'package:galaxyfy_application/pages/selecaodeconta.dart'; 
import 'package:galaxyfy_application/pages/biblioteca.dart';
import 'package:galaxyfy_application/pages/mcig.dart';
import 'package:galaxyfy_application/pages/artista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulEscuro),
        useMaterial3: true,
      ),
      initialRoute: "/perfil",
      routes: {
        '/': (context) => const ArtistPage(), // use const se o construtor for constante
        '/login': (context) => const Login_GalaxyFy(),
        '/cadastro2': (context) => const Cadastro2_GalaxyFy(),
        '/home': (context) => const HomePage(), // Certifique-se que isso existe
        '/selecaodeconta': (context) => const SelectAccountScreen(),
        '/biblioteca': (context) => const LibraryPage(),
        '/mcig': (context) => const DetailPage(),
        '/perfil': (context) => const PerfilPage(),
      },
    );
  }
}
