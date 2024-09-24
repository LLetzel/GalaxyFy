// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro.dart';
import 'package:galaxyfy_application/pages/home.dart';
import 'package:galaxyfy_application/pages/login.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/splashscreen.dart';

void main() {
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
      initialRoute: "/",
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login_GalaxyFy(),
        '/cadastro': (context) => const Cadastro_GalaxyFy(),

      },
    );
  }
}
