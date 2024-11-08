import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioManager with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration audioDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  AudioManager() {
    _audioPlayer.onDurationChanged.listen((duration) {
      audioDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((position) {
      currentPosition = position;
      notifyListeners();
    });
  }

  Future<void> playAudio(String path) async {
    await _audioPlayer.play(AssetSource(path));
    isPlaying = true;
    notifyListeners();
  }

  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void togglePlayPause(String path) {
    isPlaying ? pauseAudio() : playAudio(path);
  }

  void seekAudio(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}