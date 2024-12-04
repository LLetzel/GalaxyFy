import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';

import 'package:galaxyfy_application/pages/inicio.dart';
import 'package:galaxyfy_application/shared/style.dart';

// Variável global para armazenar o índice do perfil selecionado
int selectedProfileIndex = 0;

// // Configurações do Google Drive
// const _scopes = [drive.DriveApi.driveFileScope];
// const _clientId =
//     "SEU_CLIENT_ID.apps.googleusercontent.com"; // Substitua pelo seu
// const _clientSecret = "SEU_CLIENT_SECRET"; // Substitua pelo seu

class ProfileSelectionPage extends StatefulWidget {
  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _imagePicker = ImagePicker();

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

  Future<void> _addNewProfile(String name, String imageUrl) async {
    await _firestore.collection('perfis').add({
      'name': name,
      'imgprofile': imageUrl,
    });
    _fetchProfilesFromFirestore();
  }

  // Future<String?> _uploadToGoogleDrive(File image) async {
  //   try {
  //     // Autenticação
  //     final authClient = await clientViaUserConsent(
  //       ClientId(_clientId, _clientSecret),
  //       _scopes,
  //       (url) {
  //         print("Acesse este URL para autenticar: $url");
  //       },
  //     );

  //     final driveApi = drive.DriveApi(authClient);

  //     // Criando o arquivo no Google Drive
  //     final driveFile = drive.File();
  //     driveFile.name = "perfil_${DateTime.now().millisecondsSinceEpoch}.jpg";
  //     driveFile.parents = ["1r_Fl5dPXxU6PcAEDgvSLGe7eE2AYOSVM"]; // Substitua pelo ID da sua pasta

  //     final media = drive.Media(image.openRead(), image.lengthSync());
  //     final uploadedFile =
  //         await driveApi.files.create(driveFile, uploadMedia: media);

  //     // Tornar o arquivo público
  //     await driveApi.permissions.create(
  //       drive.Permission(type: "anyone", role: "reader"),
  //       uploadedFile.id!,
  //     );

  //     // Retorna o link público
  //     return "https://drive.google.com/uc?id=${uploadedFile.id}";
  //   } catch (e) {
  //     print("Erro ao fazer upload para o Google Drive: $e");
  //     return null;
  //   }
  // }

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
      File? selectedImage;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Adicionar Perfil'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Insira o nome do perfil'),
                  onChanged: (value) {
                    newName = value;
                  },
                ),
                // SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () async {
                //     final pickedFile = await _imagePicker.pickImage(
                //       source: ImageSource.gallery,
                //     );
                //     if (pickedFile != null) {
                //       selectedImage = File(pickedFile.path);
                //       setState(() {});
                //     }
                //   },
                //   child: Text('Selecionar Imagem'),
                // ),
                // SizedBox(height: 8),
                // Text(
                //   'Se nenhuma imagem for selecionada, a padrão será usada.',
                //   style: TextStyle(fontSize: 12, color: Colors.grey),
                // ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  if (newName.isNotEmpty) {
                    String imageUrl = 'assets/icons/icondefault.jpg';

                    // if (selectedImage != null) {
                    //   final uploadedUrl =
                    //       await _uploadToGoogleDrive(selectedImage!);
                    //   if (uploadedUrl != null) {
                    //     imageUrl = uploadedUrl;
                    //   }
                    // }

                    _addNewProfile(newName, imageUrl);
                    Navigator.of(context).pop();
                  }
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
                            selectedProfileIndex = index;
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
    ImageProvider _getImage(String image) {
      if (image.startsWith('http')) {
        return NetworkImage(image);
      } else {
        return AssetImage(image);
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _getImage(image),
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
