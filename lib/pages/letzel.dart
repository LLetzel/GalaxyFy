import 'package:flutter/material.dart';
import 'package:gabriel_str/pages/selecaoperfil.dart';
import '../shared/style.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<Perfil> {
  int _selectedIndex = 3; // Inicialize o índice selecionado como "Perfil"

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Adicione a navegação entre páginas aqui se necessário
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/fundo.png"), // Caminho da sua imagem
            fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o background
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Botão "Voltar"
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                  ],
                ),

                // Foto do perfil circular
                CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: AssetImage('assets/img/letzel.png'),
                ),

                const SizedBox(height: 16),

                // Nome do usuário
                const Text(
                  'Lucas Letzel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Botão "Editar Perfil"
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelecaoPerfil(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[850],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Alterar Perfil',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),

                const SizedBox(height: 24),

                // Texto das playlists públicas
                const Text(
                  'PLAYLISTS',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 16),

                // Lista de playlists públicas
                _buildPlaylistItem(
                  'Funk Hits',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKtObVyBFoxQ56NH4-LcX8awFnU2Bccsysxw&s',
                  '0 SEGUIDORES',
                  screenWidth,
                ),
                _buildPlaylistItem(
                  'Trap',
                  'https://murbbrasil.com/wp-content/uploads/2022/03/artistas-mais-ouvidos-de-Trap-no-Brasil.png',
                  '0 SEGUIDORES',
                  screenWidth,
                ),
                _buildPlaylistItem(
                  'Hip Hop',
                  'https://upload.wikimedia.org/wikipedia/pt/0/06/50_Cent_-_In_da_Club.jpg',
                  '0 SEGUIDORES',
                  screenWidth,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busca'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Biblioteca'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  // Função que gera os itens de playlist
  Widget _buildPlaylistItem(
      String title, String imageUrl, String followers, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Imagem da playlist
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16), // Espaçamento entre imagem e texto

          // Informações da playlist
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                followers,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
