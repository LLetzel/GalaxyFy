import 'package:flutter/material.dart';
// import 'package:galaxyfy_application/pages/components/navegacao.dart'; // Importa o arquivo de navegação
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/components/carrossel.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Permite que itens extrapolem os limites
        children: [
          // Substitua a imagem de fundo pelo gradiente
          Positioned.fill(
            child: Container(
              decoration:
                  MyColors.backgroundGradient(), // Aplica o gradiente de fundo
            ),
          ),
          // Barra de pesquisa
          Positioned(
            top: 50, // Ajusta a posição vertical da barra de pesquisa
            left: 16,
            right: 16,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),

          // Adiciona o componente de carrossel duas vezes
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: CarouselExample(),
          ),
          Positioned(
            top: 250,
            left: 16,
            right: 16,
            child: CarouselExample(),
          ),
          // Certificando-se de que o menu de navegação fique na frente
        ],
      ),
    );
  }
}