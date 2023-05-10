import 'package:get/get.dart';
import 'package:musicapp/features/genre_list/presentation/controllers/genre_list_controller.dart';

class GenreListBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put(GenreListController());
  }
}
