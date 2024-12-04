import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/details.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArtistIGPage extends StatelessWidget {
  const ArtistIGPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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

                  Text(
                    'Top Músicas do artista',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.03,
                      fontFamily: MyFonts.fontPrimary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001),

                  // StreamBuilder para conectar com o Firestore
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('musicasig')
                        .snapshots(),
                    builder: (context, snapshot) {
                      // Verifica se há erro na consulta
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Erro ao carregar as músicas",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      // Verifica se ainda está carregando os dados
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      // Verifica se o snapshot contém dados
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Text(
                            "Nenhuma música encontrada",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      // Extrai os documentos dos dados recebidos
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;

                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          // Extrai os dados de cada documento
                          Map<String, dynamic> songData =
                              documents[index].data() as Map<String, dynamic>;

                          // Garante que todos os campos estão presentes
                          String title =
                              songData['title'] ?? 'Título desconhecido';
                          String artist =
                              songData['artist'] ?? 'Artista desconhecido';
                          String imageUrl = songData['image'] ?? '';
                          String song =
                              songData['song'] ?? 'Música não encontrada';

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    item: title,
                                    artist: artist,
                                    imageUrl: imageUrl,
                                    song: song,
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
                                    imageUrl,
                                    width: screenWidth * 0.12,
                                    height: screenWidth * 0.12,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.music_note,
                                          color: Colors.white);
                                    },
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenHeight * 0.022,
                                          ),
                                        ),
                                        Text(
                                          artist,
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
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
