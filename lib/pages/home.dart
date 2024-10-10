import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'components/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            MyColors.backgroundGradient(), // Aplica o gradiente de fundo
        child: Column(
          children: [
            SizedBox(height: 20), // Espaço no topo para a barra de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                height: 30), // Espaço entre a barra de pesquisa e o carrossel
            Text("Artistas mais populares",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: MyFonts.fontPrimary)),
            Expanded(
              child: CustomCarousel(), // Inserindo o componente do carrossel
            ),
            // SizedBox(height: 20), // Espaço entre os carrosséis
            Text("Artistas mais populares",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: MyFonts.fontPrimary)),
            Expanded(
              child: CustomCarousel(), // Inserindo o componente do carrossel
            ),
          ],
        ),
      ),
    );
  }
}
