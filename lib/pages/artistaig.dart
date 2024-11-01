import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/detailsig.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'detailsig.dart';

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
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFVmeAUzhiDvzM65_zsB6R_h1L15ulV-h1sg&s'
      },
      {
        'title': 'Sorriso no rosto',
        'artist': 'MC IG (GR6 Explode) DJ Murillo e LT no Beat, DJ Glenner',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSKe-mr_9rWLlKzkYr44RZHCH4yo4ODOFEIQ&s'
      },
      {
        'title': 'Cola no ap',
        'artist': 'MC IG (DJ Glenner e Fepache)',
        'image': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Fintl-pt%2Ftrack%2F4tr1iblR7CglyVmsKhuhvL&psig=AOvVaw2TGex3lvuFhWewpM0XzZSj&ust=1730559933224000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCOiHhKK0u4kDFQAAAAAdAAAAABAE'
      },
      {
        'title': 'Sem gin, sem ela 2',
        'artist': 'MC IG, MC Ryan SP, MC PH e TrapLaudo(DJ Murillo e LT No Beat)',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6QAu1wJlJQfaAon5TgqiHFFk0B0UJnkIfaA&s'
      },
      {
        'title': 'Medley 2023',
        'artist': 'MC IG (DJ Glenner e Fepache)',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrUY0qCU80_NYsU1VAuXyz-diOVMvuQBRnNw&s'
      },
      {
        'title': '3 dias virado',
        'artist': 'MC IG (Jorgin Deejhay)',
        'image': 'https://i1.sndcdn.com/artworks-000334892457-orfvqu-t500x500.jpg'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.35,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/mcig.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                              fontSize: screenHeight * 0.035,
                              fontWeight: FontWeight.bold,
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
                              color: Colors.white70,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: songs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailIGPage(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
                              child: Row(
                                children: [
                                  Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: screenHeight * 0.022,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      songs[index]['image']!,
                                      width: screenWidth * 0.12,
                                      height: screenWidth * 0.12,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
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
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}