import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF131417), // Cor de fundo do menubar
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Início',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Busca',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_books),
                    label: 'Biblioteca',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Perfil',
                  ),
                ],
                currentIndex: currentIndex,
                selectedItemColor: MyColors.rosaClaro,
                unselectedItemColor: MyColors.cinzaEscuro,
                onTap: onItemTapped, // Muda o índice com base na aba clicada
                backgroundColor: MyColors.escuro,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                enableFeedback: false,
                selectedIconTheme: const IconThemeData(size: 30),
                unselectedIconTheme: const IconThemeData(size: 30),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 35,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF4BDFF),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/img/astronauta.png',
              height: 60,
            ),
          ),
        ),
      ],
    );
  }
}
