import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectAccountScreen(),
    );
  }
}

class SelectAccountScreen extends StatelessWidget {
  const SelectAccountScreen({super.key});

  // criar cada card de usuário
  Widget _buildUserCard(String name, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

   //criar o botão de adicionar perfil
  Widget _buildAddProfileButton() {
    return GestureDetector(
      onTap: () {
        // adicionar novo perfil
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40),
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 2, 122),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Quem está ouvindo?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildUserCard("L. Letzel", "assets/image 18.png"),
                  _buildUserCard("Felipe L.", "assets/image 20.png"),
                  _buildUserCard("Pedro L.", "assets/image 32.png"),
                  _buildUserCard("Gabriel", "assets/image 33.png"),
                  _buildUserCard("Kauan", "assets/image 34.png"),
                  _buildAddProfileButton(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/image36.png', 
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
