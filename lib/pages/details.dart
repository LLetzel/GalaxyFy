import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailPage extends StatefulWidget {
  final String item;
  final String artist;
  final String imageUrl;

  const DetailPage({
    super.key,
    required this.item,
    required this.artist,
    required this.imageUrl,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _sliderValue = 0.0;
  Duration _audioDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;
  bool isPlaying = false;
  Color _dominantColor = Colors.blue.shade200;

  @override
  void initState() {
    super.initState();
    _updatePaletteColor();

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _audioDuration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
        _sliderValue = _currentPosition.inSeconds / _audioDuration.inSeconds;
      });
    });
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

  void _playPauseAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('songs/deusporfavor.mp3')); // Defina o caminho do áudio
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _dominantColor.withOpacity(0.7), // Mais claro
                  _dominantColor.withOpacity(0.9), // Intermediário
                  _dominantColor,                  // Cor dominante pura
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
              Slider(
                value: _sliderValue,
                onChanged: (newValue) {
                  final newPosition = Duration(seconds: (_audioDuration.inSeconds * newValue).toInt());
                  _audioPlayer.seek(newPosition);
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                min: 0.0,
                max: 1.0,
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
                    icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill),
                    color: Colors.white,
                    iconSize: 70,
                    onPressed: _playPauseAudio,
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
