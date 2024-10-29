import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/artista.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'components/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> popularArtistsImages = [
    'https://pbs.twimg.com/media/GTc1t35XUAAN2qS.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhNi46C_Q3CFLWrqS2sQlUc4jVeGvo5ueijg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOo0ZYCn8vOrovnLMpatYnpf7PftG8aYy3yw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs6ONq2oN32Skv2lQuR29UF5x5cwBvnt5XuQ&s'
  ];

  final List<String> popularArtistsNames = [
    'Mc Kevin',
    'Mc IG',
    'Jorge e Mateus',
    'Mc Tuto',
  ];

  final List<String> newReleasesImages = [
    'https://cdns-images.dzcdn.net/images/cover/4533a95a5ffa6a7d42d6d720530b814d/0x1900-000000-80-0-0.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxjJgn7UJr-JqQQrFw6c-qzuKmNMvt9AWbQg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiuWxcC4vEMjLOAI2OzsB86fhBBV1Bhp31og&s'
  ];

  final List<String> newReleasesTitles = [
    'Medley the box',
    'Poesia Acústica',
    'Sem topete',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: MyColors.backgroundGradient(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
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
              SizedBox(height: screenHeight * 0.03),
              Text("Artistas mais populares",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.03,
                      fontFamily: MyFonts.fontPrimary)),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.2,
                child: CustomCarousel(imageUrls: popularArtistsImages),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text("Novos lançamentos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.03,
                      fontFamily: MyFonts.fontPrimary)),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.2,
                child: CustomCarousel(imageUrls: newReleasesImages),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      popularArtistsImages.length + newReleasesImages.length,
                  itemBuilder: (context, index) {
                    String imageUrl;
                    String title;

                    if (index < popularArtistsImages.length) {
                      imageUrl = popularArtistsImages[index];
                      title = popularArtistsNames[index];
                    } else {
                      imageUrl = newReleasesImages[
                          index - popularArtistsImages.length];
                      title = newReleasesTitles[
                          index - popularArtistsImages.length];
                    }

                    return Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: GestureDetector(
                        onTap: () {
                          if (title == 'Mc Kevin') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArtistPage()),
                            );
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.3,
                              height: screenWidth * 0.3,
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ],
                        ),
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
