import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca de Música',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Biblioteca(),
    );
  }
}

class Biblioteca extends StatelessWidget {
  const Biblioteca({Key? key}) : super(key: key);

  // Lista simulada de itens da biblioteca
  final List<Map<String, String>> libraryItems = const [
    {"title": "Criar Playlist", "image": "assets/playlist_icon.png"},
    {"title": "Adicionar Artista", "image": "assets/artist_icon.png"},
    {"title": "MC IG", "image": "assets/mc_ig.png"},
    {"title": "Made in Brasil", "image": "assets/made_in_brasil.png"},
    {"title": "Funk Hits", "image": "assets/funk_hits.png"},
    {"title": "João Gomes", "image": "assets/joao_gomes.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sua biblioteca",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Ação ao clicar no ícone de pesquisa
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: libraryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.black, // Exemplo de cor para ícones
              child: Image.asset(
                libraryItems[index]["image"]!,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              libraryItems[index]["title"]!,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Ação ao clicar no item da lista
            },
          );
        },
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
}
