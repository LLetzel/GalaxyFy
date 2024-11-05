import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/artistakevin.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:galaxyfy_application/pages/components/audio_manager.dart';
import 'package:galaxyfy_application/pages/detailskevin.dart';
import 'package:provider/provider.dart';
import 'package:galaxyfy_application/pages/artistaig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AudioManager()), // Configuração do Provider
      ],
      child: const MyApp(),
    ),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.cinzaEscuro),
        useMaterial3: true,
      ),
      title: 'Galaxyfy',
      initialRoute: '/',
      routes: {
        // '/': (context) => ArtistIGPage(),
        // '/': (context) => SplashScreen(),
        // '/': (context) => ArtistPage(),
        '/': (context) => InicioPage(),
        '/artistkevin': (context) => ArtistPage(),
        '/selection': (context) => ProfileSelectionPage(),
        '/inicio': (context) => InicioPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => Login_GalaxyFy(),
        '/cadastro': (context) => Cadastro_GalaxyFy(),
        '/search': (context) => SearchPage(),
        '/library': (context) => LibraryPage(),
        '/perfil': (context) => PerfilPage(),
        '/artistig': (context) => ArtistIGPage(),
      },
    );
  }
}
