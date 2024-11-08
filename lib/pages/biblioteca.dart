import 'package:flutter/material.dart';
import '../shared/style.dart';
import 'artistaig.dart';
import 'artistakevin.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<Biblioteca> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<Biblioteca> {
  int _selectedIndex = 2; // Inicialize o índice selecionado como "Biblioteca"

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Adicione a navegação entre páginas aqui se necessário
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/fundo.png"),
                 // Substitua pelo caminho da sua imagem de fundo
                fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o espaço do background
              ),
            ),
          ),

          // Conteúdo da Biblioteca
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título da página
                  const Text(
                    'Sua biblioteca',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Lista de opções da biblioteca
                  Expanded(
                    child: ListView(
                      children: [
                        _buildLibraryItem(
                          icon: Icons.add,
                          label: 'Criar Playlist',
                          color: Colors.white,
                        ),
                        _buildLibraryItem(
                          icon: Icons.person_add,
                          label: 'Adicionar Artista',
                          color: Colors.white,
                        ),
                        _buildLibraryItem(
                          imageUrl:
                              'https://p2.trrsf.com/image/fget/cf/1200/900/middle/images.terra.com/2023/12/27/2084283332-design-sem-nome-5-5.png',
                          label: 'MC IG',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ArtistIGPage(),
                              ),
                            );
                          },
                        ),
                        _buildLibraryItem(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png',
                          label: 'Made in Brasil',
                        ),
                        _buildLibraryItem(
                          imageUrl:
                              'https://midias.correiobraziliense.com.br/_midias/jpg/2021/05/17/675x450/1_mc_kevin-6660996.jpg?20211204215238?20211204215238',
                          label: 'MC Kevin',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ArtistPage(),
                              ),
                            );
                          },
                        ),
                        _buildLibraryItem(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs6ONq2oN32Skv2lQuR29UF5x5cwBvnt5XuQ&s',
                          label: 'MC Tuto',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), 
          ),
        ],
      ),

      // Barra de navegação inferior
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

  // Função auxiliar para criar um item da biblioteca
  Widget _buildLibraryItem({
    IconData? icon,
    String? imageUrl,
    required String label,
    Color color = Colors.white,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            // Ícone ou imagem do item
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: icon != null ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon != null
                  ? Icon(icon, color: color, size: 30)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            const SizedBox(width: 16),

            // Texto do item
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
