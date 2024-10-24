import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 65,
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
                currentIndex: widget.currentIndex,
                selectedItemColor: MyColors.rosaClaro,
                unselectedItemColor: MyColors.cinzaEscuro,
                onTap: widget
                    .onItemTapped, // Muda o índice com base na aba clicada
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
          bottom: 30,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF4BDFF),
            ),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              'assets/img/astronauta.png',
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
