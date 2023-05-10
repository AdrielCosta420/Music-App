import 'package:get/get.dart';
import 'package:musicapp/features/genre_details/presentation/controllers/genre_details_controller.dart';

class GenreDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GenreDetailsController());
  }
}
