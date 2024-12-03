import 'package:flutter/material.dart';
import 'dart:async';

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
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Animação de escala (vai de 0.8 a 1.2)
    _animation = Tween<double>(begin: 0.8, end: 2.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Inicia a animação e aguarda
    _controller.repeat(reverse: true);

    // Redireciona para a tela de login após 4 segundos
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
                image: AssetImage("assets/fundo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo centralizado
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset("assets/image17.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
