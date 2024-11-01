import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/mcig.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Map<String, String>> songs = [
    {
      'title': 'Só mais um copo',
      'artist': 'MC IG (Dj Murillo & LT no Beat)',
      'image': 'assets/image 98.png'
    },
    {
      'title': 'Sorriso no rosto',
      'artist': 'MC IG (GR6 Explode) DJ Murillo e LT no Beat, DJ Glenner',
      'image': 'assets/image 101.png'
    },
    {
      'title': 'Cola no ap',
      'artist': 'MC IG (DJ Glenner e Fepache)',
      'image': 'assets/image 102.png'
    },
    {
      'title': 'Sem gin, sem ela 2',
      'artist': 'MC IG, MC Ryan SP, MC PH e TrapLaudo(DJ Murillo e LT No Beat)',
      'image': 'assets/image 103.png'
    },
    {
      'title': 'Medley 2023',
      'artist': 'MC IG (DJ Glenner e Fepache)',
      'image': 'assets/image 104.png'
    },
    {
      'title': '3 dias virado',
      'artist': 'MC IG (Jorgin Deejhay)',
      'image': 'assets/image 105.png'
    },
  ];

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Busca',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 24,
            backgroundImage: AssetImage('assets/image36.png'), 
          ),
          label: 'Astronauta',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'Biblioteca',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                          image: AssetImage('assets/mcig.png'),
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
                                  builder: (context) => const DetailPage(),
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
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
