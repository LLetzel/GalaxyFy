// home_page.dart

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/components/navegacao.dart'; // Importa o arquivo de navegação

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice da aba selecionada

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice da aba selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Permite que itens extrapolem os limites
        children: [
          // Conteúdo principal da página
          Positioned.fill(
            child: Image.asset(
              'assets/img/fundo.png', // Caminho para a imagem de fundo
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text(
              'Tela do Início', // Mude este texto conforme necessário
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Certificando-se de que o menu navegação fique na frente
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              currentIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}