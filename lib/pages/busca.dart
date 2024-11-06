import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca de Música',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Busca(),
    );
  }
}

class Busca extends StatefulWidget {
  const Busca({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Busca> {
  // Lista simulada de músicas recentes
  final List<Map<String, String>> recentSongs = [
    {"title": "Meca Cereja", "subtitle": "Vulgo FK, Mc Cebezinho", "image": "assets/img/mecacereja.png"},
    {"title": "Modo Esquece", "subtitle": "TrapLaudo, Menor da VG, Tuto...", "image": "assets/img/modo.png"},
    {"title": "Banco do Carona", "subtitle": "Mc Kako, Mc Don Juan, DJ BOY...", "image": "assets/img/banco.png"},
    {"title": "Terapia", "subtitle": "Mc Kevin", "image": "assets/img/terapia.png"},
    {"title": "Pandemia", "subtitle": "Mc Kevin", "image": "assets/img/pandemia.png"},
    {"title": "Cartel do 900", "subtitle": "Mc Kevin, IG, Rick, Menor da VG...", "image": "assets/img/cartel.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: "O que você quer ouvir?",
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.purple[900],
      ),
      body: Column(
        children: [
          // Playlists personalizadas
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _buildPlaylistButton(Icons.headset, "Playlist Anime"),
                const SizedBox(width: 16),
                _buildPlaylistButton(Icons.music_note, "Playlist Funk"),
              ],
            ),
          ),
          // Lista de músicas recentes
          Expanded(
            child: ListView.builder(
              itemCount: recentSongs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    recentSongs[index]["image"]!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    recentSongs[index]["title"]!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    recentSongs[index]["subtitle"]!,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    // Ação ao clicar na música
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.library_music),
            label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.purple[800],
    );
  }

  // Função para construir botões de playlist
  Widget _buildPlaylistButton(IconData icon, String label) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
          // Ação ao clicar na playlist
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple[700],
        ),
      ),
    );
  }
}
