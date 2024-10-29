import 'package:flutter/material.dart';
import 'dart:async'; // Para o Future.delayed

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Controlador da animação
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duração de cada ciclo de animação
      vsync: this,
    )..repeat(reverse: true); // Repete a animação ao contrário

    // Animação de escala (vai de 0.8 a 1.2)
    _animation = Tween<double>(begin: 0.8, end: 2.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Curva suave para a animação
    ));

    // Redireciona para a tela de login após 4 segundos
    Future.delayed(const Duration(seconds: 4), () {
      _controller.stop(); // Para a animação
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose do controller ao finalizar a animação
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fundo.png"), // Imagem de fundo
                fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o espaço
              ),
            ),
          ),
          // Conteúdo centralizado
          Center(
            child: ScaleTransition(
              scale: _animation, // Aplica a animação de escala à imagem
              child: SizedBox(
                width: 300, // Ajuste a largura conforme necessário
                height: 300, // Ajuste a altura conforme necessário
                child: Image.asset("assets/image17.png"), // Imagem que vai animar
              ),
            ),
          ),
        ],
      ),
    );
  }
}
