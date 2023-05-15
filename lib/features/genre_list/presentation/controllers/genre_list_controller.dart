import 'package:get/get.dart';
import 'package:musicapp/core/errors/failures.dart';
import 'package:musicapp/features/genre_list/data/repositories/genre_list_repository.dart';
import 'package:musicapp/shared/models/genre_model.dart';

import '../../../../core/mixins/screen_loading_and_error_mixin.dart';

class GenreListController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreListRepository _genreListRepository;

  GenreListController(GenreListRepository genreListRepository)
      : _genreListRepository = genreListRepository;

  final RxList<GenreModel> genres = RxList([]);

  @override
  void onInit() {
    getGenreList();
    super.onInit();
  }

  Future<void> getGenreList() async {
    setLoadingToTrue();
    setError(null);

    final getGenresResponse = await _genreListRepository.getGenreList();

    getGenresResponse.fold((Failures failuresResponse) {
      if (failuresResponse is GetGenreListFailure) {
        setError(failuresResponse.message);
      }
    }, (List<GenreModel> genreResponse) {
      genres.value = genreResponse;
    });
  }
}
