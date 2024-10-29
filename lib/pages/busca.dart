import 'package:flutter/material.dart';

class Busca extends StatefulWidget {
  const Busca({super.key});

  @override
  State<Busca> createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  int _selectedIndex = 1; // Índice da aba "Busca" selecionada

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

     if (index == 0) { // Índice do ícone de "Busca"
      Navigator.pushNamed(context, '/home'); // Navega para a rota /busca
    }

     if (index == 1) { // Índice do ícone de "Busca"
      Navigator.pushNamed(context, '/busca'); // Navega para a rota /busca
    }

    if (index == 4) { // Índice do ícone de "Perfil"
      Navigator.pushNamed(context, '/individual'); // Navega para a rota /perfils
    }

    if (index == 3) { // Índice do ícone de "Biblioteca"
      Navigator.pushNamed(context, '/biblioteca'); // Navega para a rota /biblioteca
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 2, 63), // Cor de fundo da tela
      body: Column(
        children: [
          // Barra de pesquisa no topo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Encontre sua música aqui",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.search, color: Colors.black),
                ],
              ),
            ),
          ),
          
          // Texto "O que você quer ouvir?" abaixo da barra de pesquisa
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "O que você quer ouvir?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Conteúdo da tela
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: Icon(Icons.playlist_play, color: Colors.white),
                  title: Text("Playlist Anime", style: TextStyle(color: Colors.white)),
                ),
                const ListTile(
                  leading: Icon(Icons.playlist_play, color: Colors.white),
                  title: Text("Playlist Funk", style: TextStyle(color: Colors.white)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Recentes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                // Lista de músicas recentes
                ListTile(
                  leading: Image.asset(
                    'assets/meca_cereja1.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text("Meca Cereja", style: TextStyle(color: Colors.white)),
                  subtitle: const Text("Vulgo FK, Mc Cebezinho", style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/modo_esquece.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text("Modo Esquece", style: TextStyle(color: Colors.white)),
                  subtitle: const Text("TrapLaudo, Menor da VG, Tuto...", style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/banco_carona.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text("Banco do carona", style: TextStyle(color: Colors.white)),
                  subtitle: const Text("Mc Kako, Mc Don Juan, DJ BOY...", style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/terapia.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text("Terapia", style: TextStyle(color: Colors.white)),
                  subtitle: const Text("Mc Kevin", style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/pandemia.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text("Pandemia", style: TextStyle(color: Colors.white)),
                  subtitle: const Text("Mc Kevin", style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/cartel_900.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text("Cartel do 900", style: TextStyle(color: Colors.white)),
                  subtitle: const Text("Mc Kevin, IG, Rick, Menor da VG...", style: TextStyle(color: Colors.white70)),
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
