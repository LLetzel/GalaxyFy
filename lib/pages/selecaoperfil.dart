import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';

class ProfileSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> profiles = [
    {'name': 'Lucas Letzel', 'image': 'assets/perfis/letzel.png'},
    {'name': 'Pedro Lima', 'image': 'assets/perfis/pedro.png'},
    {'name': 'Gabriel Pires', 'image': 'assets/perfis/pires.png'},
    {'name': 'Kauan', 'image': 'assets/perfis/kauan.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Expande o fundo para ocupar a tela toda
          Positioned.fill(
            child: SizedBox.expand(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/fundo.png'), // Caminho para a imagem de fundo
                    fit: BoxFit.cover, // A imagem vai cobrir toda a tela
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                SizedBox(height: 36),
                Text(
                  'Selecione seu perfil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: MyFonts.fontPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 20.0,
                    children: [
                      ...profiles.map((profile) {
                        return ProfileCard(
                          name: profile['name'],
                          image: profile['image'],
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        );
                      }).toList(),
                      GestureDetector(
                        onTap: () {
                          print("Adicionar novo perfil");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 40, color: Colors.white),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  const ProfileCard({
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.black54,
              padding: EdgeInsets.all(10),
              child: Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
