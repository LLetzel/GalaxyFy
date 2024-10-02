// import 'package:flutter/material.dart';

// class CarrosselWidget extends StatefulWidget {
//   @override
//   _CarrosselWidgetState createState() => _CarrosselWidgetState();
// }

// class _CarrosselWidgetState extends State<CarrosselWidget> {
//   int _currentIndex = 0;
//   List<String> _imagens = [
//     'assets/perfis/letzel.png',
//     'assets/perfis/pires.png',
//     'assets/perfis/pedro.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: PageView(
//             onPageChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             children: _imagens.map((imagem) {
//               return Image.network(imagem);
//             }).toList(),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: _imagens.map((imagem) {
//             return Container(
//               margin: EdgeInsets.all(4),
//               width: 10,
//               height: 10,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _currentIndex == _imagens.indexOf(imagem)
//                     ? Colors.blue
//                     : Colors.grey,
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CarouselExample extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  final List<String> imageList = [
    'assets/perfil/letzel.png',
    'assets/perfil/kauan.png',
    'assets/perfil/pires.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        // Cria um carrossel que pode ser rolado horizontalmente
        itemCount:
            imageList.length, // Define o número total de páginas no carrossel
        itemBuilder: (context, index) {
          return GestureDetector(
            // Permite adicionar interações ao item, como gestos de toque
            onTap: () {
              // Ação a ser executada quando o item é tocado (ex: abrir detalhes da imagem)
              print('Você tocou na imagem $index');
            },
            child: Container(
              child: Image.asset(imageList[index],
                  fit: BoxFit.cover), // Exibe a imagem na página atual
            ),
          );
        },
      ),
    );
  }
}
