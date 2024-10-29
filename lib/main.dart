import 'package:flutter/material.dart';
import 'package:galaxy_fy/pages/cadastro.dart';
import 'package:galaxy_fy/pages/login.dart';
import 'package:galaxy_fy/pages/home.dart';
import 'package:galaxy_fy/shared/style.dart';
import 'package:galaxy_fy/pages/splash.dart';
import 'package:galaxy_fy/pages/perfils.dart';
import 'package:galaxy_fy/pages/busca.dart';
import 'package:galaxy_fy/pages/biblioteca.dart';
import 'package:galaxy_fy/pages/artista.dart';
import 'package:galaxy_fy/pages/individual.dart';

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
      
      initialRoute: "/",
      routes: {
        '/' : (context) => const Splash(),
        '/login' : (context) => const Login(),
        '/cadastro' : (context) => const Cadastro(),
        '/perfils' : (context) => const Perfils(),
        '/home' : (context) => const Home(),     
        '/busca' : (context) => const Busca(),
        '/biblioteca' : (context) => const Biblioteca(),
        '/artista' : (context) => const Artista(),
        '/individual' : (context) => const Individual(),
        

      }
    );
  }
}