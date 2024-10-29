import 'package:flutter/material.dart';

class Perfils extends StatefulWidget {
  const Perfils({super.key});

  @override
  State<Perfils> createState() => _PerfilsState();
}

class _PerfilsState extends State<Perfils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove a AppBar aqui
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5A00B0), // Cor de gradiente superior
              Color(0xFF180029), // Cor de gradiente inferior
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60), // Espaço do topo
            const Text(
              "Quem está ouvindo?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Grid de perfis
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2, // 2 colunas
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/home'); // Navegar para a rota '/home'
                      },
                      child: buildProfile("assets/letzel.png", "L. Letzel"),
                    ),
                    buildProfile("assets/felipe.png", "Felipe L."),
                    buildProfile("assets/pedro.png", "Pedro L."),
                    buildProfile("assets/gabriel.png", "Gabriel"),
                    buildProfile("assets/kauan.png", "Kauan"),
                    buildAddProfile(), // Adicionar novo perfil
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Imagem que substituirá o astronauta
            SizedBox(
              height: 60, // Tamanho do ícone de "image17"
              child: Image.asset('assets/image17.png'), // Substitui pelo image17
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Método para criar um perfil
  Widget buildProfile(String imagePath, String name) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Método para adicionar o ícone de adicionar perfil
  Widget buildAddProfile() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
