import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Modoesquece(),
    );
  }
}

class Modoesquece extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A1C5C), // Cor de fundo roxa
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'tocando playlist',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Funk Hits',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          // Imagem do álbum
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(
                  'assets/img/modoesquece.png',
                ), // Substitua pela URL real da imagem
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Título da música
          Text(
            'MODO ESQUECE - MC IG, GP,\nTrapLaudo, Menor Da VG, Tuto...',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          // Barra de progresso
          Slider(
            value: 0.5,
            onChanged: (value) {},
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
          // Controles de reprodução
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {},
                color: Colors.white,
                iconSize: 40,
              ),
              IconButton(
                icon: Icon(Icons.play_circle_fill),
                onPressed: () {},
                color: Colors.white,
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {},
                color: Colors.white,
                iconSize: 40,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3A1C5C),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        items: [
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
      ),
    );
  }
}
