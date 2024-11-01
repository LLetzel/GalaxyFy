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
        'title': 'Só mais um copo',
        'artist': 'MC IG (Dj Murillo & LT no Beat)',
        'image': 'assets/image_98.png'
      },
      {
        'title': 'Sorriso no rosto',
        'artist': 'MC IG (GR6 Explode) DJ Murillo e LT no Beat, DJ Glenner',
        'image': 'assets/image_101.png'
      },
      {
        'title': 'Cola no ap',
        'artist': 'MC IG (DJ Glenner e Fepache)',
        'image': 'assets/image_102.png'
      },
      {
        'title': 'Sem gin, sem ela 2',
        'artist': 'MC IG, MC Ryan SP, MC PH e TrapLaudo(DJ Murillo e LT No Beat)',
        'image': 'assets/image_103.png'
      },
      {
        'title': 'Medley 2023',
        'artist': 'MC IG (DJ Glenner e Fepache)',
        'image': 'assets/image_104.png'
      },
      {
        'title': '3 dias virado',
        'artist': 'MC IG (Jorgin Deejhay)',
        'image': 'assets/image_105.png'
      },
    ];

    return Scaffold(
      body: Container(
        decoration: MyColors.backgroundGradient,
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
                        height: screenHeight * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://link_da_imagem_do_artista',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Sobrepõe o nome e a descrição do artista sobre a imagem
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Igor Guilherme',
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
                            Text(
                              '12 milhões de ouvintes mensais',
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
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Top Músicas do artista',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.03,
                      fontFamily: MyFonts.fontPrimary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                              Image.asset(
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
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
