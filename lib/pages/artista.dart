import 'package:flutter/material.dart';

class Artista extends StatefulWidget {
  const Artista({super.key});

  @override
  State<Artista> createState() => _ArtistaState();
}

class _ArtistaState extends State<Artista> {
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
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/fundo.png', // Caminho da imagem de fundo
              fit: BoxFit.cover,
            ),
          ),
          // Conteúdo da tela sobreposto
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/joao_gomes.png', // Sua imagem de fundo para a seção superior
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'João Gomes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '211.422 salvamentos · 50 músicas, cerca de 2h 15min',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Galaxy Fy',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    songTile('assets/me_ama.png', 'Me Ama Sem Pausa - Aquelas Paradas', 'João Gomes'),
                    songTile('assets/nao_sou.png', 'Não Sou De Falar De Amor', 'Juliette, João Gomes'),
                    songTile('assets/coracao.png', 'Coração de Vaqueiro', 'João Gomes, Iguinho e Lulinha, Tarcísio do Acordeon'),
                    songTile('assets/meu_bem.png', 'Meu Bem', 'João Gomes'),
                    songTile('assets/5_da.png', '5 Da Manhã - Ao Vivo', 'Rai Saia Rodada, João Gomes'),
                    songTile('assets/meu_pedaco.png', 'Meu Pedaço de Pecado', 'João Gomes'),
                    songTile('assets/eu_nao.png', 'Eu Não Dou Conta - Ao Vivo', 'Israel & Rodolffo, Mc Don Juan, João Gomes'),
                  ],
                ),
              ),
            ],
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

  Widget songTile(String imagePath, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (imagePath == 'assets/me_ama.png') {
                Navigator.pushNamed(context, '/musica');
              }
            },
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }
}
