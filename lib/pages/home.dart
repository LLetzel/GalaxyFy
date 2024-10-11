import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'components/carousel.dart'; // Importando o carrossel personalizado

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Definindo listas diferentes de imagens para cada carrossel
  final List<String> popularArtistsImages = [
    'https://pbs.twimg.com/media/GTc1t35XUAAN2qS.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhNi46C_Q3CFLWrqS2sQlUc4jVeGvo5ueijg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOo0ZYCn8vOrovnLMpatYnpf7PftG8aYy3yw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs6ONq2oN32Skv2lQuR29UF5x5cwBvnt5XuQ&s'
  ];

  final List<String> newReleasesImages = [
    'https://cdns-images.dzcdn.net/images/cover/4533a95a5ffa6a7d42d6d720530b814d/0x1900-000000-80-0-0.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxjJgn7UJr-JqQQrFw6c-qzuKmNMvt9AWbQg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiuWxcC4vEMjLOAI2OzsB86fhBBV1Bhp31og&s'
  ];

  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela usando MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration:
            MyColors.backgroundGradient(), // Aplica o gradiente de fundo
        child: SingleChildScrollView(
          // Adicionado para permitir rolagem
          child: Column(
            children: [
              SizedBox(
                  height: screenHeight *
                      0.05), // Espaço no topo para a barra de pesquisa
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                  height: screenHeight *
                      0.03), // Espaço entre a barra de pesquisa e o carrossel
              Text("Artistas mais populares",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight *
                          0.03, // Ajustando o tamanho da fonte dinamicamente
                      fontFamily: MyFonts.fontPrimary)),
              SizedBox(
                  height: screenHeight * 0.02), // Espaço antes do carrossel
              // Carrossel 1: passando a lista de imagens dos artistas mais populares
              SizedBox(
                height: screenHeight *
                    0.2, // Definindo altura fixa para o carrossel
                child: CustomCarousel(imageUrls: popularArtistsImages),
              ),
              SizedBox(
                  height: screenHeight * 0.02), // Espaço entre os carrosséis
              Text("Novos lançamentos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight *
                          0.03, // Ajustando o tamanho da fonte dinamicamente
                      fontFamily: MyFonts.fontPrimary)),
              SizedBox(
                  height:
                      screenHeight * 0.02), // Espaço antes do segundo carrossel
              // Carrossel 2: passando a lista de imagens dos novos lançamentos
              SizedBox(
                height: screenHeight *
                    0.2, // Definindo altura fixa para o segundo carrossel
                child: CustomCarousel(imageUrls: newReleasesImages),
              ),
              SizedBox(height: screenHeight * 0.02), // Espaço final

              // ListView horizontal para exibir as imagens como uma lista de reprodução
              SizedBox(
                height: screenHeight *
                    0.25, // Altura total para a lista de reprodução
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Definindo a rolagem horizontal
                  itemCount: popularArtistsImages.length +
                      newReleasesImages.length, // Quantidade total de itens
                  itemBuilder: (context, index) {
                    // Checa se o index está dentro da lista popularArtistsImages
                    String imageUrl;
                    String title;
                    if (index < popularArtistsImages.length) {
                      imageUrl = popularArtistsImages[index];
                      title =
                          "Artista Popular $index"; // Substitua pelo nome real do artista se necessário
                    } else {
                      // Ajusta o índice para os itens da lista newReleasesImages
                      imageUrl = newReleasesImages[
                          index - popularArtistsImages.length];
                      title =
                          "Lançamento $index"; // Substitua pelo nome real do lançamento se necessário
                    }

                    return Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth *
                                0.3, // Ajustando largura dos itens dinamicamente
                            height: screenWidth * 0.3, // Proporção quadrada
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight *
                                  0.02, // Ajuste de tamanho de fonte
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
