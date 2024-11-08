import 'package:flutter/material.dart';
import 'package:gabriel_str/pages/detailsig.dart';
import '../shared/style.dart';


class ArtistIGPage extends StatelessWidget {
  const ArtistIGPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, String>> songs = [
      {
        'title': 'Só mais um copo',
        'artist': 'MC IG (Dj Murillo & LT no Beat)',
        'image':
            'https://musicopolis.com.br/wp-content/uploads/2024/03/MC-IG-So-Mais-Um-Copo.webp'
      },
      {
        'title': 'Sorriso no rosto',
        'artist': 'MC IG (GR6 Explode) DJ Murillo e LT no Beat, DJ Glenner',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSKe-mr_9rWLlKzkYr44RZHCH4yo4ODOFEIQ&s'
      },
      {
        'title': 'Cola no ap',
        'artist': 'MC IG (DJ Glenner e Fepache)',
        'image':
            'https://i1.sndcdn.com/artworks-lVjbZ4Bifm5yZcar-oLlmpA-t500x500.jpg'
      },
      {
        'title': 'Sem gin, sem ela 2',
        'artist':
            'MC IG, MC Ryan SP, MC PH e TrapLaudo(DJ Murillo e LT No Beat)',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6QAu1wJlJQfaAon5TgqiHFFk0B0UJnkIfaA&s'
      },
      {
        'title': 'Medley 2023',
        'artist': 'MC IG (DJ Glenner e Fepache)',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrUY0qCU80_NYsU1VAuXyz-diOVMvuQBRnNw&s'
      },
      {
        'title': '3 dias virado',
        'artist': 'MC IG (Jorgin Deejhay)',
        'image':
            'https://i1.sndcdn.com/artworks-000334892457-orfvqu-t500x500.jpg'
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
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMDHtX0DWeGGd5qidBLnrsWNM-eZWI9DpLz3MFOn695BeUxRGE',
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
                              'MC IG',
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
                              'Pequeno Igor • Ele mesmo',
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
                              builder: (context) => DetailPageIG(
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
                icon: Icon(Icons.arrow_back, color: Colors.black),
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