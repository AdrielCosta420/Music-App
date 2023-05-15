import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/core/app/utils/colors/music_app_colors.dart';
import 'package:musicapp/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:musicapp/shared/widgets/image_widget.dart';
import 'package:musicapp/shared/widgets/text_widget.dart';

class MiniMusicPlayerWidget extends StatelessWidget {
  const MiniMusicPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();

    return GestureDetector(
      onTap: () => musicPlayerController.showMusicPlayer(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MusicAppColors.primaryColor,
              MusicAppColors.secondaryColor.withOpacity(0.5),
            ],
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ImageWidget(
                        width: 50,
                        height: 50,
                        img: musicPlayerController.getCurrentPlayingMusic?.img,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextWidget.normal(musicPlayerController
                                .getCurrentPlayingMusic?.title ??
                            'Música 1'),
                      ),
                    ],
                  ),
                  PlayPauseButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
