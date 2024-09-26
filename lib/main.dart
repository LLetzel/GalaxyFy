// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro2.dart';
import 'package:galaxyfy_application/pages/home.dart';
import 'package:galaxyfy_application/pages/login.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/splash.dart';
//import 'package:galaxyfy_application/pages/login.dart';

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
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulEscuro),
      useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        '/' : (context) => const Splash(),
        '/login' : (context) => const Login_GalaxyFy(),
        '/cadastro2': (context) => const Cadastro2_GalaxyFy(),
        '/home': (context) => const HomePage(),
      },
      // theme: ThemeData(colorScheme:
      // data, child: children),
    );
  }
}


