import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'components/audio_manager.dart';

class DetailPage extends StatefulWidget {
  final String item;
  final String artist;
  final String imageUrl;
  final String song;

  const DetailPage({
    super.key,
    required this.item,
    required this.artist,
    required this.imageUrl,
    required this.song,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _sliderValue = 0.0;
  Color _dominantColor = Colors.blue.shade200;

  @override
  void initState() {
    super.initState();
    _updatePaletteColor();
  }

  Future<void> _updatePaletteColor() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl),
    );

    setState(() {
      _dominantColor = paletteGenerator.dominantColor?.color ?? Colors.blue.shade200;
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    // Tente acessar o Provider
    final audioManager = Provider.of<AudioManager>(context, listen: true);
    if (audioManager == null) {
      return Scaffold(
        body: Center(child: Text('Erro ao carregar o AudioManager')),
      );
    }

    _sliderValue = audioManager.currentPosition.inSeconds /
        (audioManager.audioDuration.inSeconds > 0
            ? audioManager.audioDuration.inSeconds
            : 1);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _dominantColor.withOpacity(0.7),
                  _dominantColor.withOpacity(0.9),
                  _dominantColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
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
              Text(
                widget.item,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.artist,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      _formatDuration(audioManager.currentPosition),
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Slider(
                        value: _sliderValue,
                        onChanged: (newValue) {
                          final newPosition = Duration(
                              seconds:
                                  (audioManager.audioDuration.inSeconds *
                                          newValue)
                                      .toInt());
                          audioManager.seekAudio(newPosition);
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.white30,
                        min: 0.0,
                        max: 1.0,
                      ),
                    ),
                    Text(
                      _formatDuration(audioManager.audioDuration),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
                    icon: Icon(
                      audioManager.isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill,
                    ),
                    color: Colors.white,
                    iconSize: 70,
                    onPressed: () {
                      audioManager.togglePlayPause(widget.song);
                    },
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
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.pinkAccent,
                iconSize: 40,
                onPressed: () {},
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
