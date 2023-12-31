import 'package:flutter/material.dart';
import 'package:gengarmovies/common/style_colors.dart';
import 'package:gengarmovies/common/style_text.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String customTxt;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.customTxt,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyle.smallTextDark,
          ),
          Text(
            customTxt,
            style: AppStyle.smallTextDark
                .copyWith(color: AppColors.strongPurpleBase),
          ),
        ],
      ),
    );
  }
}
