import 'package:flutter/material.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  int _selectedIndex = 2; // Índice da aba selecionada

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    }

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
      backgroundColor: const Color(0xFF4C035A), // Cor de fundo
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título e ícone de busca
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sua biblioteca",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Ação do botão de busca
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Opções de "Criar Playlist" e "Adicionar Artista"
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
              title: const Text(
                "Criar Playlist",
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
              title: const Text(
                "Adicionar Artista",
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),

            const SizedBox(height: 20), // Espaçamento entre itens

            // Itens da biblioteca
            ListTile(
              leading: Image.asset(
                'assets/mc_ig.jpg', // Imagem da playlist
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: const Text(
                "MC IG",
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            ListTile(
              leading: Image.asset(
                'assets/made_in_brasil.jpg', // Imagem da playlist
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: const Text(
                "Made in Brasil",
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            ListTile(
              leading: Image.asset(
                'assets/funk_hits.jpg', // Imagem da playlist
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: const Text(
                "Funk Hits",
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/artista');
                },
                child: Image.asset(
                  'assets/joão_gomes.jpg', // Imagem do artista João Gomes
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text(
                "João Gomes",
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ],
        ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busca'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 24,
              backgroundImage: AssetImage('assets/image17.png'), // Imagem do astronauta
            ),
            label: 'Astronauta',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Biblioteca'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
