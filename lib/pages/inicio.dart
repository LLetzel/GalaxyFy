// ignore: file_names
import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/components/navegacao.dart'; // Importa o arquivo de navegação
import 'package:galaxyfy_application/pages/home.dart';
import 'package:galaxyfy_application/pages/library.dart';
import 'package:galaxyfy_application/pages/perfil.dart';
import 'package:galaxyfy_application/pages/search.dart';
import 'selecaoperfil.dart';

class InicioPage extends StatefulWidget {
  final int initialIndex;

  const InicioPage({super.key, this.initialIndex = 0});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          SearchPage(),
          LibraryPage(),
          PerfilPage(selectedProfileIndex: selectedProfileIndex), // Passa o índice atual
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: (p0) => _onItemTapped(p0),
      ),
    );
  }
}
