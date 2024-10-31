// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/artista.dart';
import 'package:galaxyfy_application/pages/cadastro.dart';
import 'package:galaxyfy_application/pages/Inicio.dart';
import 'package:galaxyfy_application/pages/login.dart';
import 'package:galaxyfy_application/pages/selecaoperfil.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/splashscreen.dart';
import 'package:galaxyfy_application/pages/search.dart';
import 'package:galaxyfy_application/pages/library.dart';
import 'package:galaxyfy_application/pages/perfil.dart';
import 'package:galaxyfy_application/pages/home.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa o pacote para inicializar o Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.cinzaEscuro),
        useMaterial3: true,
      ),
      title: 'Galaxyfy',
      initialRoute: '/',
      routes: {
        // '/': (context) => ProfileSelectionPage(),
        // '/': (context) => InicioPage(),
        // '/': (context) => SplashScreen(),
        '/': (context) => const ArtistPage(),
        '/artist': (context) => const ArtistPage(),
        '/selection': (context) => ProfileSelectionPage(),
        '/inicio': (context) => const InicioPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login_GalaxyFy(),
        '/cadastro': (context) => const Cadastro_GalaxyFy(),
        '/search': (context) => const SearchPage(),
        '/library': (context) => const LibraryPage(),
        '/perfil': (context) => const PerfilPage(),
      },
    );
  }
}
