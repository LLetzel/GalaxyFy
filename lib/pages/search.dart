import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/components/navegacao.dart'; // Importa o arquivo de navegação
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/artistakevin.dart'; // Importa a página do artista

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
    _searchController
        .addListener(_filterItems); // Adiciona o listener para filtragem
  }

  void _filterItems() {
    String query =
        _searchController.text.toLowerCase(); // Obtém o texto da busca
    setState(() {
      _filteredItems = _items
          .where((item) => item.name.toLowerCase().contains(query))
          .toList(); // Filtra os itens conforme a busca
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Libera o controller ao sair da tela
    super.dispose();
  }

  void _navigateToArtistPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ArtistPage()), // Navega para a ArtistPage
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
            top: 100,
            left: 16,
            right: 16,
            bottom: 0,
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Verifica se o item clicado é "MC Kevin"
                    if (_filteredItems[index].name == 'Mc Kevin') {
                      _navigateToArtistPage(); // Navega para a ArtistPage
                    } else {
                      // Para outros artistas, você pode implementar outra lógica ou navegação
                    }
                  },
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipOval(
                          child: Image.network(
                            _filteredItems[index].imageUrl,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, color: Colors.red);
                            },
                          ),
                        ),
                      ),
                      Expanded(
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
