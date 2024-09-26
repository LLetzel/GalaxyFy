import 'package:flutter/material.dart';

class CarrosselWidget extends StatefulWidget {
  @override
  _CarrosselWidgetState createState() => _CarrosselWidgetState();
}

class _CarrosselWidgetState extends State<CarrosselWidget> {
  int _currentIndex = 0;
  List<String> _imagens = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/301',
    'https://picsum.photos/200/302',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _imagens.map((imagem) {
              return Image.network(imagem);
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _imagens.map((imagem) {
            return Container(
              margin: EdgeInsets.all(4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == _imagens.indexOf(imagem)
                    ? Colors.blue
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}