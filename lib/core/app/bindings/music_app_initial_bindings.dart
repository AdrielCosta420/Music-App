import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:musicapp/core/app/services/api/dot_env_service.dart';
import 'package:musicapp/core/app/services/audio_service/audio_player_service_impl.dart';
import 'package:musicapp/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:dio/dio.dart';
import '../services/api/api_service.dart';

class MusicAppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ApiService(BaseOptions(
        baseUrl: DotEnvService.getApiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      )),
    );

    Get.put(
      AudioPlayerServiceImpl(
        AudioPlayer(),
      ),
    );

    Get.lazyPut(
      () => MusicPlayerController(
        AudioPlayerServiceImpl(
          AudioPlayer(),
        ),
      ),
    );
  }
}
