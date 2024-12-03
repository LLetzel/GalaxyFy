// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Musica extends StatefulWidget {
  const Musica({super.key});

  @override
  State<Musica> createState() => _MusicaState();
}

class _MusicaState extends State<Musica> {
  int _selectedIndex = 2;

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
    if (index == 3) {
      Navigator.pushNamed(context, '/biblioteca');
    }
    if (index == 4) {
      Navigator.pushNamed(context, '/perfil');
    }
  }

  // Função que abre o link da música no YouTube
  Future<void> _playMusic() async {
    const url = 'https://www.youtube.com/watch?v=OZL1VYzPBcY';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'tocando playlist',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'Sertanejo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/Me_ama2.png', // Substitua pelo caminho da sua imagem
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Me Ama Sem Pausa - João gomes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 24,
                  ),
                  Slider(
                    value: 0.3,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 36,
                      ),
                      const SizedBox(width: 16),
                      // Ícone de play que toca a música no YouTube ao ser clicado
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_filled,
                          color: Colors.white,
                          size: 60,
                        ),
                        onPressed: _playMusic,
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 36,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
}