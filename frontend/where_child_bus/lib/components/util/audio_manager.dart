import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  final AudioPlayer audioPlayer = AudioPlayer();
  final List<String> audioFiles; // 再生する音声ファイルのリスト
  int _currentAudioIndex = 0; // 現在再生中の音声ファイルのインデックス

  AudioManager({required this.audioFiles});

  // 音声を順番に再生するメソッド
  Future<void> playSequentially() async {
    if (audioFiles.isEmpty) return; // 再生する音声がない場合は何もしない

    _currentAudioIndex = 0; // 最初の音声から再生を開始
    await _playAudioFile(audioFiles[_currentAudioIndex]);
  }

  // 特定の音声ファイルを再生し、終了したら次の音声を再生するメソッド
  Future<void> _playAudioFile(String filePath) async {
    await audioPlayer.setVolume(1);
    await audioPlayer.play(AssetSource(filePath));

    // 音声再生が完了したら次の音声を再生
    audioPlayer.onPlayerComplete.listen((event) {
      _currentAudioIndex++;
      if (_currentAudioIndex < audioFiles.length) {
        _playAudioFile(audioFiles[_currentAudioIndex]);
      }
    });
  }

  void dispose() {
    audioPlayer.dispose();
  }
}
