import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Função para criar os cartões de artistas
  Widget _buildArtistCard(String imagePath) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Função para criar os cartões de álbuns
  Widget _buildAlbumCard(String imagePath) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Função para criar o campo de pesquisa
Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(top: 25), // Ajuste a altura conforme necessário
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 227, 240),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Encontre sua música aqui",
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
    ),
  );
}


  // Função para o conteúdo principal da página
  Widget _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildSearchBar(),
          const SizedBox(height: 16),
          const Text(
            "Popular artists",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildArtistCard("assets/image 29.png"),
                const SizedBox(width: 10),
                _buildArtistCard('assets/image 26.png'),
                const SizedBox(width: 10),
                _buildArtistCard('assets/image 41.png'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Popular albums",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildAlbumCard('assets/image 10.png'),
                const SizedBox(width: 10),
                _buildAlbumCard('assets/mcig.png'),
                const SizedBox(width: 10),
                _buildAlbumCard('assets/image 40.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Função para o BottomNavigationBar atualizado
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Busca',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 24,
            backgroundImage: AssetImage('assets/image36.png'), 
          ),
          label: 'Astronauta',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'Biblioteca',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 5, 29),
      body: _buildBodyContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
