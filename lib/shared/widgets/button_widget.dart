import 'package:flutter/material.dart';
import 'package:musicapp/core/app/utils/colors/music_app_colors.dart';
import 'package:musicapp/shared/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const ButtonWidget({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: MusicAppColors.tertiaryColor),
      child: TextWidget.bold(title),
    );
  }
}
