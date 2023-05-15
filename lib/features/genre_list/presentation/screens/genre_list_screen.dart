import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/features/genre_details/presentation/screens/genre_details_screen.dart';
import 'package:musicapp/features/genre_list/data/repositories/genre_list_repository.dart';
import 'package:musicapp/features/genre_list/presentation/controllers/genre_list_controller.dart';

import '../../../../shared/features/music_app/presentation/widgets/mini_music_player_widget.dart';
import '../../../../shared/widgets/img_and_tile_row_widget.dart';
import '../../../../shared/widgets/screen_widget.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = '/genre-list';
  const GenreListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genreListController = Get.find<GenreListController>();

    return Obx(
      () => ScreenWidget(
        isLoading: false,
        title: 'Lista de Genêros',
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                    itemBuilder: (_, int index) {
                      final genre = genreListController.genres[index];

                      return InkWell(
                        onTap: () => Get.toNamed(
                            '${GenreListScreen.routeName}${GenreDetailsScreen.routeName}',
                            arguments: genre),
                        child: ImgAndTileRowWidget(
                          title: genre.title,
                          heroTag: genre.title,
                          img: genre.img,
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                    itemCount: genreListController.genres.length),
              ),
            ),
           const MiniMusicPlayerWidget(),
          ],
        ),
      ),
    );
  }
}
