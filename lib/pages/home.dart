import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Lista de rotas para navegação
  final List<String> _routes = [
    '/home',
    '/busca',
    '/biblioteca',
    '/perfil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, _routes[index]);
  }

  // Listas de exemplo para "Popular artists" e "Popular albums"
  final List<String> popularArtists = [
    'assets/img/artista1.jpg',
    'assets/img/artista2.jpg',
    'assets/img/artista3.jpg',
    'assets/img/artista4.jpg',
  ];

  final List<String> popularArtistsNames = [
    'Mc Tuto',
    'Jorge e Mateus',
    'Mc IG',
    'Mc Kevin',
  ];

  final List<String> popularAlbums = [
    'assets/img/albums1.jpg',
    'assets/img/albums2.jpg',
  ];

  final List<String> popularAlbumsTitles = [
    'Sem topete',
    'Medley the box',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Música Popular'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/fundo.png"), // Caminho da imagem de fundo
            fit: BoxFit.cover, // Cobrir toda a tela com a imagem
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Carousel para Popular Artists
                Text(
                  'Popular Artists',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                CarouselSlider.builder(
                  itemCount: popularArtists.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    disableCenter: true,
                  ),
                  itemBuilder: (context, index, _) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            popularArtists[index],
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          popularArtistsNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),

                // Carousel para Popular Albums
                Text(
                  'Popular Albums',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                CarouselSlider.builder(
                  itemCount: popularAlbums.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    disableCenter: true,
                  ),
                  itemBuilder: (context, index, _) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            popularAlbums[index],
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          popularAlbumsTitles[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
}
