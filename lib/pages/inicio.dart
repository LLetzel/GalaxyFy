// ignore: file_names
import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/components/navegacao.dart'; // Importa o arquivo de navegação
import 'package:galaxyfy_application/pages/home.dart';
import 'package:galaxyfy_application/pages/library.dart';
import 'package:galaxyfy_application/pages/perfil.dart';
import 'package:galaxyfy_application/pages/search.dart';

class InicioPage extends StatefulWidget {
  final int
      initialIndex; // Novo parâmetro para saber qual aba está sendo exibida

  const InicioPage({super.key, this.initialIndex = 0}); // Define a aba padrão

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  late int _selectedIndex; // Variável que vai armazenar o índice da aba

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Inicia a tela com o índice passado
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice da aba selecionada
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
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: (p0) => _onItemTapped(p0),
      ),
    );
  }
}
