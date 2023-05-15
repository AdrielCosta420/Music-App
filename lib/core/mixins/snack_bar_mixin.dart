import 'package:get/get.dart';
import 'package:musicapp/core/app/utils/colors/music_app_colors.dart';

mixin SnackBarMixin {
  void showErrorSnackBar(String description) {
    Get.snackbar('Erro', description,
        colorText: MusicAppColors.errorColor,
        backgroundColor: MusicAppColors.errorColor, );
  }
}
