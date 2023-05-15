import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:musicapp/core/app/services/audio_service/audio_player_service.dart';
import 'package:musicapp/core/errors/exceptions.dart';

class AudioPlayerServiceImpl extends GetxService implements AudioPlayerService {
  final AudioPlayer audioPlayer;

  AudioPlayerServiceImpl(this.audioPlayer);

  @override
  Future<int> getCurrentPosition() async {
    try {
      final position = await audioPlayer.getCurrentPosition();

      return position?.inSeconds ?? 0;
    } catch (e, stackTrace) {
      const errorMessange = 'Erro ao pegar posição da música';
      log(errorMessange, error: e, stackTrace: stackTrace);
      throw AudioPlayerExceptions(message: errorMessange);
    }
  }

  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  @override
  Future<void> pauseMusic() async {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.pause(), 'Erro ao pausar posição da música');
  }

  @override
  Future<void> playMusic(String audioAsset) async {
    callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.play(AssetSource(audioAsset)),
        'Erro ao dar play posição da música');
  }

  Future<void> callAudioPlayerServiceTryAndCatchFunction(
      Future<void> Function() tryFunction,
      String audioPlayerExceptionMessage) async {
    try {
      await tryFunction();
    } catch (error, stackTrace) {
      final errorMessange = audioPlayerExceptionMessage;
      log(errorMessange, error: error, stackTrace: stackTrace);
      throw AudioPlayerExceptions(message: errorMessange);
    }
  }

  @override
  Future<void> resumeMusic() {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.resume(), 'Erro ao continuar música');
  }

  @override
  Future<void> seek(int seconds) async {
    return callAudioPlayerServiceTryAndCatchFunction(() {
      final seekTo = Duration(seconds: seconds);
      return audioPlayer.seek(seekTo);
    }, 'Erro ao trocar duração da música');
  }

  @override
  Future<void> stopMusic() async {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.stop(), 'Erro ao encerrar música');
  }

  @override
  void onClose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.onClose();
  }
}
