import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'selecaoperfil.dart';

class PerfilPage extends StatefulWidget {
  final int initialSelectedProfileIndex; // Recebe o índice como argumento

  PerfilPage({required this.initialSelectedProfileIndex});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> profiles = [];
  late int selectedProfileIndex;

  @override
  void initState() {
    super.initState();
    selectedProfileIndex = widget.initialSelectedProfileIndex; // Define o índice inicial
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

  @override
  Widget build(BuildContext context) {
    if (profiles.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    final profile = profiles[selectedProfileIndex];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () async {
                // Espera o retorno da página de seleção de perfil
                final newIndex = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSelectionPage(),
                  ),
                );

                // Atualiza o índice caso tenha retornado um novo
                if (newIndex != null) {
                  setState(() {
                    selectedProfileIndex = newIndex;
                  });
                }
              },
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(profile['image']),
            ),
            Text(
              profile['name'],
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
