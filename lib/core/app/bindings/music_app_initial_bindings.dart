import 'package:get/get.dart';
import 'package:musicapp/core/app/services/audio_service/audio_player_service_impl.dart';
import 'package:musicapp/shared/features/music_app/presentation/controllers/music_player_controller.dart';

import '../services/api/api_service.dart';

class MusicAppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());

    Get.put(AudioPlayerServiceImpl());

    Get.lazyPut(() => MusicPlayerController());
  }
}
