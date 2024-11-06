import 'package:flutter/material.dart';

import '../shared/style.dart';

// import 'package:galaxyfy_application/pages/Inicio.dart';

class Perfil extends StatefulWidget {
  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<Perfil> {
  // Lista de perfis inicial
  List<Map<String, dynamic>> profiles = [
    {'name': 'L. Letzel', 'image': 'assets/img/letzel.png'},
    {'name': 'Felipe L.', 'image': 'assets/img/lipinho.png'},
    {'name': 'Pedro L.', 'image': 'assets/img/pedrao.png'},
    {'name': 'Gabriel', 'image': 'assets/img/pires.png'},
    {'name': 'Kauan', 'image': 'assets/img/kauan.png'},
  ];

  // Função para adicionar novo perfil
  void _addNewProfile(String name) {
    setState(() {
      profiles.add({
        'name': name,
        'image': 'assets/icons/icondefault.jpg', // Imagem padrão para novos perfis
      });
    });
  }

  // Mostra um diálogo para inserir o nome do novo perfil
  void _showAddProfileDialog(BuildContext context) {
    if (profiles.length >= 6) {
      // Se o número de perfis já for 6, exibe um aviso
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Limite de perfis atingido'),
            content: Text('Você só pode ter no máximo 6 perfis.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      String newName = '';

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Adicionar Perfil'),
            content: TextField(
              decoration: InputDecoration(hintText: 'Insira o nome do perfil'),
              onChanged: (value) {
                newName = value;
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo sem fazer nada
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  if (newName.isNotEmpty) {
                    _addNewProfile(newName); // Adiciona o perfil
                  }
                  Navigator.of(context).pop(); // Fecha o diálogo
                },
                child: Text('Adicionar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Obtenha a largura e altura da tela usando MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SizedBox.expand(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/fundo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 42),
                Text(
                  'Selecione seu perfil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: MyFonts.fontPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 40.0,
                    mainAxisSpacing: 40.0,
                    childAspectRatio: 1, // Mantém a proporção
                    children: [
                      ...profiles.map((profile) {
                        return ProfileCard(
                          name: profile['name'],
                          image: profile['image'],
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          width: screenWidth * 0.4, // 40% da largura da tela
                          height: screenHeight * 0.2, // 20% da altura da tela
                        );
                      }).toList(),
                      if (profiles.length < 6) // Exibe o botão de adicionar apenas se houver menos de 6 perfis
                        GestureDetector(
                          onTap: () {
                            _showAddProfileDialog(context); // Abre o diálogo de adicionar perfil
                          },
                          child: Container(
                            width: screenWidth * 0.4, // 40% da largura da tela
                            height: screenHeight * 0.2, // 20% da altura da tela
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: 40, color: Colors.white),
                                SizedBox(height: 8),
                                Text(
                                  'Novo Perfil',
                                  style: TextStyle(color: Colors.white),
                                ),
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
  final double width;
  final double height;

  const ProfileCard({
    required this.name,
    required this.image,
    required this.onTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width, // Largura definida em porcentagem
        height: height, // Altura definida em porcentagem
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
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
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}