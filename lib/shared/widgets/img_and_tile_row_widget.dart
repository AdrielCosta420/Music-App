import 'package:flutter/material.dart';
import 'package:musicapp/core/app/utils/colors/music_app_colors.dart';
import 'package:musicapp/core/app/utils/fonts/music_app_text_style.dart';
import 'package:musicapp/shared/widgets/text_widget.dart';

import 'image_widget.dart';

class ImgAndTileRowWidget extends StatelessWidget {
  final String? heroTag;
  final String? img;
  final String title;
  final Color? titleColor;

  const ImgAndTileRowWidget(
      {Key? key, this.heroTag, this.img, required this.title, this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: heroTag ?? "",
          child: ImageWidget(
            img: img,
            height: 80,
            width: 80,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: TextWidget.normal(
          title,
          textStyle: MusicAppTextStyle.getNormalStyle
              .copyWith(color: titleColor ?? MusicAppColors.secondaryColor),
        ))
      ],
    );
  }
}
