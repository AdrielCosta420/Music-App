import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/core/app/bindings/music_app_initial_bindings.dart';
import 'package:musicapp/core/app/music_app_material.dart';

import '../../features/genre_list/presentation/screens/genre_list_screen.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MusicAppMaterial.getTitle,
      theme: MusicAppMaterial.getTheme,
      getPages: MusicAppMaterial.getPage,
      initialRoute: GenreListScreen.routeName,
      initialBinding: MusicAppInitialBindings(),
    );
  }
}
