import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'
    as custom_carousel; // Importa o pacote carousel_slider e usa um alias para evitar conflitos de nomes

class CustomCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return custom_carousel.CarouselSlider(
      // Cria um Slider de Carrossel usando o alias definido anteriormente
      options: custom_carousel.CarouselOptions(
        // Define as opções do carrossel
        height: 150.0, // Define a altura do carrossel
        autoPlay: true, // Faz o carrossel rolar automaticamente
        enlargeCenterPage: true, // Aumenta a página central
      ),
      items: [
        // Lista de URLs de imagens que você quer mostrar no carrossel
        'https://pbs.twimg.com/media/GTc1t35XUAAN2qS.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhNi46C_Q3CFLWrqS2sQlUc4jVeGvo5ueijg&s',
        'https://monkeybuzz.com.br/wp-content/uploads/2020/04/pedro-darua-c2a2462-1920x1206.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQdThaihddss10arJ_81tUTZIkxjT7HWuGzw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIcLScHHn6qprfXu2R_yEAw69habtSVJgvLg&s'
      ].map((imageUrl) {
        // Mapeia cada URL de imagem para um widget de Container
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width *
                  0.5, // Define a largura do container como 70% da largura da tela
              margin: const EdgeInsets.symmetric(
                  horizontal: 0.4), // Adiciona margem horizontal ao container
              decoration: BoxDecoration(
                color: Colors.amber, // Cor de fundo do container
                borderRadius: BorderRadius.circular(
                    10), // Arredonda os cantos do container
              ),
              child: ClipRRect(
                // Usado para arredondar as bordas da imagem
                borderRadius:
                    BorderRadius.circular(10), // Arredonda as bordas da imagem
                child: Image.network(
                  imageUrl, // Carrega a imagem a partir da URL
                  fit: BoxFit
                      .cover, // Ajusta a imagem para cobrir todo o container
                ),
              ),
            );
          },
        );
      }).toList(), // Converte a lista de widgets para uma lista que o CarouselSlider pode usar
    );
  }
}
