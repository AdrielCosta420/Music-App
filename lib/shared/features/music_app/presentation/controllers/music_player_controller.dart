import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/core/app/services/audio_service/audio_player_service.dart';
import 'package:musicapp/core/errors/exceptions.dart';
import 'package:musicapp/shared/models/music_model.dart';

import '../../../../../core/mixins/snack_bar_mixin.dart';

class MusicPlayerController with SnackBarMixin {
  final AudioPlayerService _audioPlayerService;

  MusicPlayerController(AudioPlayerService audioPlayer)
      : _audioPlayerService = audioPlayer {
    //Ouve quando a musica acabar para entao pular para a prox musica
    _audioCompleteStreamSubscription =
        _audioPlayerService.onAudioComplete().listen((_) {
      skipTrack();
    });
  }

  StreamSubscription? _audioCompleteStreamSubscription;

  final RxBool isPlaying = false.obs;

  final RxInt currentMusicDuration = 0.obs;

  final RxnInt currentMusicIndexPlaying = RxnInt();

  int? get getCurrentMusicIndexPlaying => currentMusicIndexPlaying.value;

  final RxList<MusicModel> _playlistPlaying = <MusicModel>[].obs;

  List<MusicModel> get playlistPlaying => _playlistPlaying;

  final List<MusicModel> selectedPlaylist = [];

  Stream<Duration> get getCurrentPositionStream =>
      _audioPlayerService.getPositionStream();

  Future<void> seek(int seekToDurationInSeconds) =>
      _audioPlayerService.seek(seekToDurationInSeconds);

  void loadPlaylist(
      List<MusicModel> newPlaylist, List<MusicModel> playlistToChange) {
    playlistToChange
      ..clear()
      ..addAll(newPlaylist);

  }

  Future<void> onCallMusicPlayerTryAndCatch(
        Future<void> Function() tryFunction) async {
      try {
        tryFunction;
      } on AudioPlayerExceptions catch (error) {
        showErrorSnackBar(error.message);
      }
    }

    Future<void> playMusic(String url) async {
      onCallMusicPlayerTryAndCatch(() async {
        isPlaying.value = true;
        await _audioPlayerService.playMusic(url);
      });
    }

    Future<void> stopMusic() async {
      onCallMusicPlayerTryAndCatch(() async {
        isPlaying.value = false;
        await _audioPlayerService.stopMusic();
      });
    }

    Future<void> loadMusic() async {
      return onCallMusicPlayerTryAndCatch(
        () async {
          //Carregar a lista (carregar sempre que o usuario tenha mudado de genero musical)
          loadPlaylist(selectedPlaylist, _playlistPlaying);

          //Parar a musica que estiver tocando
          await stopMusic();

          //Da o play na musica
          await playMusic(
              _playlistPlaying[getCurrentMusicIndexPlaying ?? 0].url);
        },
      );
    }

    Future<void> pauseMusic() async {
      return onCallMusicPlayerTryAndCatch(() async {
        isPlaying.value = false;
        await _audioPlayerService.pauseMusic();
      });
    }

    //prox music
    Future<void> skipTrack() async {
      if (getCurrentMusicIndexPlaying != null) {
        if (getCurrentMusicIndexPlaying! < _playlistPlaying.length - 1) {
          currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! + 1;
        } else {
          //voltar para a primeira musica se estiver na última
          currentMusicIndexPlaying.value = 0;
        }
        await loadMusic();
      }
    }

  MusicModel? get getCurrentPlayingMusic {
    if (getCurrentMusicIndexPlaying != null) {
      return _playlistPlaying[getCurrentMusicIndexPlaying!];
    }
    return null;
  }

  //Voltar música
  Future<void> backTrack() async {
    if (getCurrentMusicIndexPlaying != null &&
        getCurrentMusicIndexPlaying! > 0) {
      currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! - 1;
    } else {
      //Voltar para a ultima musica, se o index estiver na primeira[0]
      currentMusicIndexPlaying.value = _playlistPlaying.length - 1;
    }
    await loadMusic();
  }

  //Quando abrir o Player se estiver com a musica pausada, devemos mostrar onde ela parou
  Future<void> loadCurrentMusicDuration() async {
    if (isPlaying.value) {
      currentMusicDuration.value =
          await _audioPlayerService.getCurrentPosition();
    }
  }

  void playSelectedMusic(BuildContext context, int musicIndex) async {
    //Atualiza qual o index da música que será ouvida da playlist
    currentMusicIndexPlaying.value = musicIndex;

    //carregar e tocar a música
    loadMusic();

    showMusicPlayer(context);
  }

  Future<void> showMusicPlayer(BuildContext context) async {}
}
