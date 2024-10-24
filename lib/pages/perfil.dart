import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/selecaoperfil.dart';
import 'package:galaxyfy_application/shared/style.dart'; // Suponho que seja onde está o gradiente de fundo

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    // Utilizando MediaQuery para capturar as dimensões da tela
    final screenWidth = MediaQuery.of(context).size.width; // Largura da tela
    final screenHeight = MediaQuery.of(context).size.height; // Altura da tela

    return Scaffold(
      backgroundColor:
          Colors.transparent, // Deixa o fundo da Scaffold transparente
      body: Stack(
        clipBehavior:
            Clip.none, // Permite que itens possam sair do limite do widget pai
        children: [
          // Background com gradiente de fundo
          Positioned.fill(
            child: Container(
              decoration:
                  MyColors.backgroundGradient(), // Aplica o gradiente de fundo
            ),
          ),

          // Para garantir que o conteúdo não se sobreponha à barra de status
          SafeArea(
            child: SingleChildScrollView(
              // Permite que o conteúdo role se for maior que a tela
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth *
                      0.05, // 5% de margem horizontal com base na largura da tela
                  vertical: screenHeight *
                      0.05, // 5% de margem vertical com base na altura da tela
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Centraliza horizontalmente o conteúdo
                  children: [
                    // Botão "Voltar"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BackButton(
                          color: Colors.white, // Cor do botão de voltar
                        ),
                      ],
                    ),

                    // Foto do perfil circular - imagem local
                    CircleAvatar(
                      radius: screenWidth * 0.15, // 15% da largura da tela
                      backgroundImage: AssetImage(
                        'assets/perfis/letzel.png', // Caminho da imagem local
                      ),
                    ),

                    // const SizedBox(
                    //     height:
                    //         16), // Espaçamento fixo entre a imagem de perfil e o nome

                    // Nome do usuário
                    const Text(
                      'Lucas Letzel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                        height: 8), // Espaçamento fixo entre o nome e o botão

                    // Botão "Editar Perfil"
                    ElevatedButton(
                      onPressed: () {
                        // Navegação para outra página
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSelectionPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[850],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(24), // Cantos arredondados
                        ),
                      ),
                      child: const Text(
                        'Alterar Perfil',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                        height:
                            24), // Espaçamento entre o botão e o texto das playlists públicas

                    // Texto das playlists públicas
                    const Text(
                      'PLAYLISTS PÚBLICAS',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 1.5, // Espaçamento entre letras
                      ),
                    ),

                    const SizedBox(
                        height:
                            16), // Espaçamento entre o título e a lista de playlists

                    // Lista de playlists públicas
                    _buildPlaylistItem(
                      'Power Metal',
                      'https://cdn.pixabay.com/photo/2016/09/19/21/50/sun-flower-1681385_640.jpg',
                      '0 SEGUIDORES',
                      screenWidth,
                    ),
                    _buildPlaylistItem(
                      'Nirvana',
                      'https://cdn.pixabay.com/photo/2016/09/19/21/50/sun-flower-1681385_640.jpg',
                      '0 SEGUIDORES',
                      screenWidth,
                    ),
                    _buildPlaylistItem(
                      'Love Song',
                      'https://cdn.pixabay.com/photo/2016/09/19/21/50/sun-flower-1681385_640.jpg',
                      '0 SEGUIDORES',
                      screenWidth,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Função que gera os itens de playlist
  Widget _buildPlaylistItem(
      String title, String imageUrl, String followers, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Espaçamento entre as playlists
      child: Row(
        children: [
          // Imagem da playlist
          ClipRRect(
            borderRadius:
                BorderRadius.circular(8), // Bordas arredondadas para a imagem
            child: Image.network(
              imageUrl,
              width: screenWidth * 0.15, // 15% da largura da tela
              height: screenWidth * 0.15, // Mantém a altura proporcional
              fit: BoxFit
                  .cover, // Garante que a imagem ocupe completamente o espaço
            ),
          ),

          const SizedBox(width: 16), // Espaçamento entre a imagem e o texto

          // Informações da playlist
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                followers,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
