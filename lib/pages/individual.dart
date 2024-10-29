import 'package:flutter/material.dart';

class Individual extends StatefulWidget {
  const Individual({super.key});

  @override
  State<Individual> createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  int _selectedIndex = 0; // Índice inicial da BottomNavigationBar

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
      backgroundColor: Colors.purple.shade900, // Cor de fundo roxa
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50), // Espaçamento do topo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/letzel2.png'), // Substitua pela sua imagem
          ),
          const SizedBox(height: 10),
          const Text(
            "Lucas Letzel",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey, // Usando 'backgroundColor' em vez de 'primary'
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Borda arredondada
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            ),
            child: const Text("Editar Perfil"),
          ),
          const SizedBox(height: 20),
          const Text(
            "PLAYLISTS PÚBLICAS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Image(
                    image: AssetImage('assets/playlist1.png'), // Substitua pelas imagens das playlists
                  ),
                  title: Text(
                    "Power Metal",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10), // Espaçamento entre as ListTiles
                ListTile(
                  leading: Image(
                    image: AssetImage('assets/playlist2.png'),
                  ),
                  title: Text(
                    "Nirvana",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10), // Espaçamento entre as ListTiles
                ListTile(
                  leading: Image(
                    image: AssetImage('assets/playlist3.png'),
                  ),
                  title: Text(
                    "Love Song",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
