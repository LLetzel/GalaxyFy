import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late GifController _gifController; // Inicializa o controlador como non-nullable

  @override
  void initState() {
    super.initState();
    
    // Inicializa o controlador do GIF
    _gifController = GifController(vsync: this);
    
    // Iniciar a animação diretamente no initState
    _gifController.repeat(min: 0, max: 1, period: Duration(seconds: 5));
    
    // Navegar para outra tela após o tempo definido
    _navegarParaHome();
  }

  @override
  void dispose() {
    _gifController.dispose(); // Descartar o controlador ao sair da tela
    super.dispose();
  }

  _navegarParaHome() async {
    await Future.delayed(Duration(seconds: 5)); // Duração da splash screen
    Navigator.pushReplacementNamed(context, '/login'); // Navegar para o Login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Usa Stack para sobrepor widgets
        children: [
          // Imagem de fundo
          SizedBox.expand(
            child: Image.asset(
              "img/fundo.png", // Verifique o caminho da imagem
              fit: BoxFit.cover, // Faz a imagem cobrir toda a tela
            ),
          ),
          // Centro do GIF
          Center(
            child: Gif(
              image: const AssetImage("assets/gif/gif_splash.gif"), // Verifique o caminho do GIF
              controller: _gifController,
              placeholder: (context) => const Text('Loading...'),
            ),
          ),
        ],
      ),
    );
  }
}
