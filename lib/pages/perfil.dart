import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  int _selectedIndex = 3; // Perfil está selecionado inicialmente

  // Lista de rotas para navegação
  final List<String> _routes = [
    '/home',
    '/busca',      // Adicione essa rota ao seu main.dart se ainda não existir
    '/biblioteca', // Adicione essa rota ao seu main.dart se ainda não existir
    '/perfil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navegar para a rota específica ao selecionar o item
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busca'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Biblioteca'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: ProfileGrid(), // Mostrando a página inicial da grade de perfis
      backgroundColor: Colors.purple[900],
    );
  }
}

class ProfileGrid extends StatelessWidget {
  final List<Map<String, String>> profiles = [
    {'name': 'L. Letzel', 'image': 'assets/img/letzel.png'},
    {'name': 'Felipe L.', 'image': 'assets/img/lipinho.png'},
    {'name': 'Pedro L.', 'image': 'assets/img/pedrao.png'},
    {'name': 'Gabriel', 'image': 'assets/img/pires.png'},
    {'name': 'Kauan', 'image': 'assets/img/kauan.png'},
    {'name': '', 'image': 'assets/img/mais.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Quem está ouvindo?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: GridView.builder(
          itemCount: profiles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    profiles[index]['image']!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  profiles[index]['name']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Outras páginas separadas
class BuscaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Busca')),
      body: Center(child: Text('Página de Busca', style: TextStyle(fontSize: 24))),
    );
  }
}

class BibliotecaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biblioteca')),
      body: Center(child: Text('Página de Biblioteca', style: TextStyle(fontSize: 24))),
    );
  }
}

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(child: Text('Página de Perfil', style: TextStyle(fontSize: 24))),
    );
  }
}
