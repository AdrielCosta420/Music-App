import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/core/app/utils/colors/music_app_colors.dart';

import '../../features/genre_details/presentation/screens/genre_details_screen.dart';
import '../../features/genre_list/presentation/bindings/genre_list_binding.dart';
import '../../features/genre_list/presentation/screens/genre_list_screen.dart';

class MusicAppMaterial {
  MusicAppMaterial._();

  static String get getTitle => "Music App";

  static List<GetPage> get getPage => [
        GetPage(
          name: GenreListScreen.routeName,
          page: () => const GenreListScreen(),
          binding: GenreListBinding(),
          children: [
            GetPage(
              name: GenreDetailsScreen.routeName,
              page: () => const GenreDetailsScreen(),
            ),
          ],
        )
      ];

  static ThemeData get getTheme => ThemeData(
        primaryColor: MusicAppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MusicAppColors.secondaryColor,
          titleTextStyle: TextStyle(
            color: MusicAppColors.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: 'Nunito',
      );
}
