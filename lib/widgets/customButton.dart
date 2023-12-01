import 'package:flutter/material.dart';
import 'package:gengarbook/common/appCollors.dart';
import 'package:gengarbook/common/styleTxt.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Ink(
        height: 53.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null
                ? AppColors.darkPurple
                : AppColors.defaultButton,
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          onTap: onPressed,
          child: Align(
            child: Text(
              text,
              style: AppStyle.mediumTextWhite,
            ),
          ),
        ),
      ),
    );
  }
}
