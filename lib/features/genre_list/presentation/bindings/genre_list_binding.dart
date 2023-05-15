import 'package:get/get.dart';
import 'package:musicapp/core/app/services/api/api_service.dart';
import 'package:musicapp/features/genre_list/presentation/controllers/genre_list_controller.dart';

import '../../data/repositories/genre_list_repository.dart';

class GenreListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GenreListController(
        GenreListRepository(
          apiService: Get.find<ApiService>(),
        ),
      ),
     );
  }
}
