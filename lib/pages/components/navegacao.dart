// navegacao.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Importante para permitir o posicionamento flutuante
      alignment: Alignment.center,
      children: [
        Container(
          height: 100, // Altura do menubar
          decoration: BoxDecoration(
            color: Color(0xFF131417), // Cor de fundo do menubar
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // Coloca o menubar na parte inferior
            children: [
              // Divider acima do menubar
              // Divider(
              //   color: Color(0xFF131417), // Cor solicitada
              //   height: 10, // Altura do Divider
              //   thickness: 1, // Espessura do Divider
              // ),
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Início',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Busca',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_books),
                    label: 'Biblioteca',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Perfil',
                  ),
                ],
                currentIndex: currentIndex,
                selectedItemColor: const Color(0xFFF4BDFF), // Cor dos ícones selecionados
                unselectedItemColor: const Color(0xFF676D75), // Cor dos ícones não selecionados
                onTap: onItemTapped,
                backgroundColor: Color(0xFF1E1E1E), // Transparente para sobrepor o fundo
                elevation: 0, // Remove sombra do menubar
                type: BottomNavigationBarType.fixed, // Remove animação de transição
                
                iconSize: 30, // Tamanho dos ícones
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 35, // Mantém o ícone central dentro do menubar
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF4BDFF), // Cor de fundo do ícone central
            ),
            padding: const EdgeInsets.all(8), // Espaçamento ao redor da imagem
            child: Image.asset(
              'assets/img/astronauta.png', // Caminho para a imagem do astronauta
              height: 60, // Ajuste do tamanho conforme necessário
            ),
          ),
        ),
      ],
    );
  }
}
