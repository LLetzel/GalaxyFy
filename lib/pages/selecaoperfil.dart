import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 42),
          Text(
            'Selecione seu perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'PrimaryFont',
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: profiles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 40.0,
                mainAxisSpacing: 40.0,
              ),
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, index); // Retorna o índice selecionado
                  },
                  child: ProfileCard(
                    name: profile['name'],
                    image: profile['image'],
                  ),
                );
              },
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

  const ProfileCard({
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
