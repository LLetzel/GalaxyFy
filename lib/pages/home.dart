import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listas de exemplo para "Popular artists" e "Popular albums"
    List<String> popularArtists = [
      'assets/img/artista1.png'
      'assets/img/artista2.png'
      'assets/img/artista3.png'
      'assets/img/artista4.jpg'
    ];

    final List<String> popularArtistsNames = [
      'Mc Kevin',
      'Mc IG',
      'Jorge e Mateus',
      'Mc Tuto',
    ];

    List<String> popularAlbums = [
      'assets/img/albums1.png'
      'assets/img/albums2.png'
    ];

    final List<String> newReleasesTitles = [
      'Medley the box',
      'Poesia Acústica',
      'Sem topete',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic demo'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel para Popular Artists
            Text(
              'Popular artists',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                disableCenter: true,
              ),
              items: popularArtists
                  .map((item) => AspectRatio(
                        aspectRatio: 1, // Define uma proporção 1:1 (quadrada)
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover, // Preencher o contêiner sem bordas
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),

            // Carousel para Popular Albums
            Text(
              'Popular albums',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                disableCenter: true,
              ),
              items: popularAlbums
                  .map((item) => AspectRatio(
                        aspectRatio: 1, // Define uma proporção 1:1 (quadrada)
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover, // Preencher o contêiner sem bordas
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
