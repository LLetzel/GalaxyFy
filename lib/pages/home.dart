import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/components/navegacao.dart'; // Importa o arquivo de navegação
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/components/carrossel.dart';

class HomePage extends StatefulWidget {
  final int
      initialIndex; // Novo parâmetro para saber qual aba está sendo exibida

  const HomePage({Key? key, this.initialIndex = 0})
      : super(key: key); // Define a aba padrão

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex; // Variável que vai armazenar o índice da aba

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Inicia a tela com o índice passado
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice da aba selecionada
    });

    // Lógica para navegar entre telas ao clicar nos ícones da barra
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home',
            arguments: 0); // Navega para Início sem substituir a tela atual
        break;
      case 1:
        Navigator.pushNamed(context, '/search',
            arguments: 1); // Navega para Busca sem substituir a tela atual
        break;
      case 2:
        Navigator.pushNamed(context, '/library',
            arguments: 2); // Navega para Biblioteca sem substituir a tela atual
        break;
      case 3:
        Navigator.pushNamed(context, '/perfil',
            arguments: 3); // Navega para Perfil sem substituir a tela atual
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Permite que itens extrapolem os limites
        children: [
          // Fundo gradiente
          Positioned.fill(
            child: Container(
              decoration: MyColors.backgroundGradient(), // Gradiente de fundo
            ),
          ),
          // Barra de pesquisa
          Positioned(
            top: 50,
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
          // Menu de navegação na parte inferior
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              currentIndex: _selectedIndex, // Passa o índice atual
              onItemTapped:
                  _onItemTapped, // Chama a função de navegação ao tocar
            ),
          ),
        ],
      ),
    );
  }
}
