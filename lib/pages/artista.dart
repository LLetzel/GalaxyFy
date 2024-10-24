import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';

class ArtistPage extends StatelessWidget {
  const ArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, String>> songs = [
      {
        'title': 'Deus, por favor',
        'artist': 'MC Kevin, MC IG e MC PH',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAmqZ1pCqBCMu4B58aJdC7NPiQYU1APN8CKg&s'
      },
      {
        'title': 'Doutora 2',
        'artist': 'MC Kevin',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKmxMgK8LvC05j2a6tjhTdV6pQvP46vFdFGg&s'
      },
      {
        'title': 'Cheguei no anonimato',
        'artist': 'MC Kevin, MC IG e MC PH',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXr9TZwEkZqgh_FBIH-UpbCkIgvfAWgeNOWw&s'
      },
      {
        'title': 'Terapia',
        'artist': 'MC Kevin',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIx6Apg3dYwna0etdhNWWYDo3uUV6KCKpeqw&s'
      },
      {
        'title': 'Nosso Lugar',
        'artist': 'MC Kevin',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUVSnV_Eg4HVIdGJGLBBr0673_S9-03z9rvA&s'
      },
      {
        'title': 'Cavalo de tróia',
        'artist': 'MC Kevin',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxvG0pyeXcHmbjxmYZp_z6nP6b1JvE5EKCaA&s'
      },
      {
        'title': 'Cartel do 900',
        'artist':
            'MC Kevin, MC Rick, MC IG, Menor da VG, Mc Hariel, MC Don Juan',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH0UQZ3nvIIfHkiMVxoliDlg2ZA_bUyrRONw&s'
      },
      {
        'title': 'Mistério',
        'artist': 'MC Kevin',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbpvYU86M1iP9wdPXz1imxxYkkkK0P_nM7oA&s'
      },
      {
        'title': 'Deixou pra lá',
        'artist': 'MC Kevin',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUYgla6dAHpif0zdaTxpCs7cWp1yauaAyfYw&s'
      },
      {
        'title': 'Pula Catraca',
        'artist': 'MC Kevin',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtB9U1X4sqihQ4jRBeLaxul4AcITw3czlWrg&s'
      },
    ];

    return Scaffold(
      body: Container(
        decoration: MyColors.backgroundGradient(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Container que contém a imagem grande do artista
                  Stack(
                    children: [
                      // Exibe a imagem do artista em uma altura maior
                      Container(
                        width: screenWidth,
                        height:
                            screenHeight * 0.4, // Aumenta a altura da imagem
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://midias.correiobraziliense.com.br/_midias/jpg/2021/05/17/675x450/1_mc_kevin-6660996.jpg?20211204215238?20211204215238',
                            ),
                            fit: BoxFit
                                .cover, // Ajusta a imagem de forma que ela cubra a área
                          ),
                        ),
                      ),

                      // Sobrepõe o nome e a descrição do artista sobre a imagem
                      Positioned(
                        bottom: 20, // Posiciona o texto no final da imagem
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nome do artista
                            Text(
                              'MC Kevin',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.bold,
                                fontFamily: MyFonts.fontPrimary,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),

                            // Descrição do artista
                            Text(
                              '211.422 salvamentos • Eterno',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Espaço entre a imagem e a lista de músicas
                  SizedBox(height: screenHeight * 0.02),

                  // Título "Top Músicas do artista"
                  Text(
                    'Top Músicas do artista',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.03,
                      fontFamily: MyFonts.fontPrimary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001),

                  // Lista de músicas
                  ListView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), // Impede que a lista seja rolável
                    shrinkWrap:
                        true, // Faz a lista se ajustar ao tamanho dos itens
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                item: songs[index]['title']!,
                                artist: songs[index]['artist']!,
                                imageUrl: songs[index]['image']!,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.025,
                                  fontFamily: MyFonts.fontPrimary,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              Image.network(
                                songs[index]['image']!,
                                width: screenWidth * 0.12,
                                height: screenWidth * 0.12,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      songs[index]['title']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenHeight * 0.022,
                                      ),
                                    ),
                                    Text(
                                      songs[index]['artist']!,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Ícone de voltar
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Volta para a SearchPage
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de reprodução de música
class DetailPage extends StatefulWidget {
  final String item;
  final String artist;
  final String imageUrl;

  const DetailPage(
      {super.key,
      required this.item,
      required this.artist,
      required this.imageUrl});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyColors.backgroundGradient(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.item,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.artist,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Slider(
                value: _sliderValue,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                min: 0.0,
                max: 1.0,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.play_circle_fill),
                    color: Colors.white,
                    iconSize: 70,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.pinkAccent,
                iconSize: 40,
                onPressed: () {},
              ),
            ],
          ),

          // Ícone de voltar
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Volta para a ArtistPage
              },
            ),
          ),
        ],
      ),
    );
  }
}
