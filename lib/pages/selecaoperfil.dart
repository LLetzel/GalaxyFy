import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galaxyfy_application/pages/home.dart';
import 'package:galaxyfy_application/pages/inicio.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'perfil.dart';

// Variável global para armazenar o índice do perfil selecionado
int selectedProfileIndex = 0;

class ProfileSelectionPage extends StatefulWidget {
  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> profiles = [];

  @override
  void initState() {
    super.initState();
    _fetchProfilesFromFirestore();
  }

  void _fetchProfilesFromFirestore() async {
    final snapshot = await _firestore.collection('perfis').get();
    setState(() {
      profiles = snapshot.docs
          .map((doc) => {
                'name': doc['name'],
                'image': doc['imgprofile'] ?? 'assets/icons/icondefault.jpg',
              })
          .toList();
    });
  }

  void _addNewProfile(String name) async {
    await _firestore.collection('perfis').add({
      'name': name,
      'imgprofile': 'assets/icons/icondefault.jpg',
    });
    _fetchProfilesFromFirestore();
  }

  void _showAddProfileDialog(BuildContext context) {
    if (profiles.length >= 6) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Limite de perfis atingido'),
            content: Text('Você só pode ter no máximo 6 perfis.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  if (newName.isNotEmpty) {
                    _addNewProfile(newName);
                  }
                  Navigator.of(context).pop();
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
                    childAspectRatio: 1,
                    children: [
                      ...profiles.map((profile) {
                        int index = profiles.indexOf(profile);
                        return ProfileCard(
                          name: profile['name'],
                          image: profile['image'],
                          onTap: () {
                            selectedProfileIndex =
                                index; // Define o índice global
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InicioPage(),
                              ),
                            );
                          },
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                        );
                      }).toList(),
                      if (profiles.length < 6)
                        GestureDetector(
                          onTap: () {
                            _showAddProfileDialog(context);
                          },
                          child: Container(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.2,
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
        width: width,
        height: height,
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
