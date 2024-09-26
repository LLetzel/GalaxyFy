import 'package:flutter/material.dart';
import 'dart:async';

import 'package:galaxyfy_application/pages/login.dart'; // Para o Future.delayed

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Controlador para a animação
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Duração da animação
    );

    // Iniciar a animação depois de um frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isExpanded = true;
      });
    });

    // Timer para redirecionar após 3 segundos
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login_GalaxyFy()), // Redireciona para a próxima página
      );
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
          SizedBox.expand(
            child: Image.asset(
              'assets/fundo.png', // Caminho da imagem de fundo
              fit: BoxFit.cover,
            ),
          ),
          // Animação de crescimento da imagem centralizada
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 10), // Duração da animação
              curve: Curves.easeInOut, // Curva de animação
              width: _isExpanded ? 200 : 100, // Aumenta o tamanho da imagem
              height: _isExpanded ? 200 : 100, // Aumenta o tamanho da imagem
              child: Image.asset(
                'assets/image36.png', // Caminho da imagem centralizada
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Próxima página
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Próxima Página")),
      body: const Center(child: Text("Bem-vindo à próxima página!")),
    );
  }
}
