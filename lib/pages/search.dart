import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/components/navegacao.dart'; // Importa o arquivo de navegação
import 'package:galaxyfy_application/shared/style.dart';
import 'package:palette_generator/palette_generator.dart';

class ArtistItem {
  final String name;
  final String imageUrl;

  ArtistItem({required this.name, required this.imageUrl});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<ArtistItem> _items = [
    ArtistItem(
        name: 'Mc Kevin',
        imageUrl: 'https://pbs.twimg.com/media/GTc1t35XUAAN2qS.jpg'),
    ArtistItem(
        name: 'Mc IG',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhNi46C_Q3CFLWrqS2sQlUc4jVeGvo5ueijg&s'),
    ArtistItem(
        name: 'Jorge e Mateus',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOo0ZYCn8vOrovnLMpatYnpf7PftG8aYy3yw&s'),
    ArtistItem(
        name: 'Mc Tuto',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs6ONq2oN32Skv2lQuR29UF5x5cwBvnt5XuQ&s'),
    ArtistItem(
        name: 'Medley the box',
        imageUrl:
            'https://cdns-images.dzcdn.net/images/cover/4533a95a5ffa6a7d42d6d720530b814d/0x1900-000000-80-0-0.jpg'),
    ArtistItem(
        name: 'Poesia Acústica',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxjJgn7UJr-JqQQrFw6c-qzuKmNMvt9AWbQg&s'),
    ArtistItem(
        name: 'Sem topete',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiuWxcC4vEMjLOAI2OzsB86fhBBV1Bhp31og&s'),
    ArtistItem(
        name: 'Modo Esquece',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5L62pchTDb_ylbuwe6fJpElZ7fevTppWOIw&s'),
  ];

  List<ArtistItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items; // Inicializa com todos os itens
    _searchController.addListener(_filterItems); // Adiciona o listener
  }

  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _items
          .where((item) => item.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Libera o controller ao sair da tela
    super.dispose();
  }

  void _navigateToDetail(ArtistItem item) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailPage(
        item: item.name, 
        imageUrl: item.imageUrl, // Certifique-se de passar ambos os parâmetros
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: MyColors.backgroundGradient(),
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            top:
                100, // Ajuste a posição para evitar sobreposição com a barra de pesquisa
            left: 16,
            right: 16,
            bottom: 0, // Adiciona um limite inferior
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => _navigateToDetail(
                      _filteredItems[index]), // Navega ao clicar
                  title: Row(
                    children: [
                      // Imagem do artista
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipOval(
                          // Faz a imagem ficar redonda
                          child: Image.network(
                            _filteredItems[index]
                                .imageUrl, // Usa a imagem correspondente
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover, // Cobre o espaço da imagem
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error,
                                  color: Colors
                                      .red); // Ícone de erro se a imagem não carregar
                            },
                          ),
                        ),
                      ),
                      // Nome do artista
                      Expanded(
                        // Faz o texto expandir para ocupar o espaço restante
                        child: Text(
                          _filteredItems[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Exemplo de uma página de detalhes
class DetailPage extends StatefulWidget {
  final String item;
  final String imageUrl;

  const DetailPage({super.key, required this.item, required this.imageUrl});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _sliderValue = 0.0; // Controla a posição do slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tocando Música'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Aplica o fundo com o gradiente padrão
          Container(
            decoration: MyColors.backgroundGradient(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagem do álbum
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.imageUrl), // URL da imagem do item
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Nome da música/artista
              Text(
                widget.item, // Nome da música/artistas
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Barra de progresso do Slider
              Slider(
                value: _sliderValue, // Valor do slider
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue; // Atualiza o valor conforme o usuário ajusta
                  });
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                min: 0.0,
                max: 1.0, // Simulação de 0 a 1
              ),
              const SizedBox(height: 20),
              // Controles de reprodução
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.play_circle_fill),
                    color: Colors.white,
                    iconSize: 70,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Botão de "favoritar"
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
