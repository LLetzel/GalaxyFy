import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galaxyfy_application/pages/selecaoperfil.dart';
import 'package:galaxyfy_application/shared/style.dart';

class PerfilPage extends StatefulWidget {
  final int selectedProfileIndex; // Recebe o índice selecionado

  PerfilPage({required this.selectedProfileIndex});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> profiles = [];

  @override
  void initState() {
    super.initState();
    _fetchProfilesFromFirestore();
  }

  // Função para buscar perfis no Firestore
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (profiles.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    // Usa o índice do perfil selecionado passado pela `ProfileSelectionPage`
    final profile = profiles[widget.selectedProfileIndex];
    final profileName = profile['name'];
    final profileImage = profile['image'];

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: MyColors.backgroundGradient(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),

                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(profileImage),
                ),
                SizedBox(height: 20),

                Text(
                  profileName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileSelectionPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[850],
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Alterar Perfil',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(height: 24),

                const Text(
                  'PLAYLISTS',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      _buildPlaylistItem(
                        'Funk Hits',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKtObVyBFoxQ56NH4-LcX8awFnU2Bccsysxw&s',
                        '0 SEGUIDORES',
                        screenWidth,
                      ),
                      _buildPlaylistItem(
                        'Trap',
                        'https://murbbrasil.com/wp-content/uploads/2022/03/artistas-mais-ouvidos-de-Trap-no-Brasil.png',
                        '0 SEGUIDORES',
                        screenWidth,
                      ),
                      _buildPlaylistItem(
                        'Hip Hop',
                        'https://upload.wikimedia.org/wikipedia/pt/0/06/50_Cent_-_In_da_Club.jpg',
                        '0 SEGUIDORES',
                        screenWidth,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaylistItem(
      String title, String imageUrl, String followers, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                followers,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
