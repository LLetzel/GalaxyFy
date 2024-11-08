import 'package:flutter/material.dart';
import 'package:gabriel_str/pages/artistaig.dart';
import 'package:gabriel_str/pages/artistakevin.dart';
import 'package:gabriel_str/pages/biblioteca.dart';
import 'package:gabriel_str/pages/busca.dart';
import 'package:gabriel_str/pages/cadastro.dart';
import 'package:gabriel_str/pages/letzel.dart';
import 'package:gabriel_str/pages/login.dart';
import 'package:gabriel_str/pages/home.dart';
import 'package:gabriel_str/pages/selecaoperfil.dart';
import 'package:gabriel_str/pages/splash_screen.dart';
import 'package:gabriel_str/shared/style.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa o pacote para inicializar o Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que a ligação dos widgets do Flutter esteja inicializada antes de usar qualquer plugin
  await Firebase.initializeApp(); // Inicializa o Firebase na aplicação
  runApp(const MyApp()); // Executa a aplicação iniciando pela classe MyApp
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
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) =>  Login(),
        '/cadastro' : (context) => Cadastro(),
        '/selecaoperfil' : (context) => SelecaoPerfil(),
        '/perfil' : (context) => Perfil(),
        '/home' : (context) => Home(),
        '/artistkevin': (context) => ArtistPage(),
        '/artistig': (context) => ArtistIGPage(),
        '/busca' : (context) => Busca(),
        '/biblioteca' : (context) => Biblioteca(),
      },
    );
  }
}




