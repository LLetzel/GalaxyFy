import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/busca');
    }

    if (index == 4) {
      Navigator.pushNamed(context, '/individual');
    }

    if (index == 3) {
      Navigator.pushNamed(context, '/biblioteca');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900], // Cor de fundo (backup para o caso de a imagem não carregar)
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fundo.png'), // Caminho para a imagem de fundo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo sobre a imagem de fundo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Campo de pesquisa arredondado
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8), // Fundo branco com opacidade
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Encontre sua música aqui',
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Título "Popular artists" centralizado
                const Center(
                  child: Text(
                    'Popular artists',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                // Primeira fileira de imagens
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildImageCard('assets/artist1.png', isSelected: false),
                    _buildImageCard('assets/artist2.png', isSelected: true), // Imagem destacada
                    _buildImageCard('assets/artist3.png', isSelected: false),
                  ],
                ),
                const SizedBox(height: 20),
                // Título "Popular albums" centralizado
                const Center(
                  child: Text(
                    'Popular albums',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                // Segunda fileira de imagens
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildImageCard('assets/album1.png', isSelected: false),
                    _buildImageCard('assets/album2.png', isSelected: true), // Imagem destacada
                    _buildImageCard('assets/album3.png', isSelected: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 24,
              backgroundImage: AssetImage('assets/image17.png'), // Imagem do astronauta
            ),
            label: 'Astronauta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  // Função para criar cada card de imagem
  Widget _buildImageCard(String imagePath, {bool isSelected = false}) {
    return Container(
      width: isSelected ? 110 : 100, // Aumenta o tamanho se estiver selecionado
      height: isSelected ? 110 : 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.white.withOpacity(0.8), blurRadius: 10)] // Sombra para destacar
            : [],
      ),
    );
  }
}
