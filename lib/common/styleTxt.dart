import 'package:flutter/material.dart';
import 'package:gengarbook/common/appCollors.dart';

class AppStyle {
  static const TextStyle logoTxt = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle charText = TextStyle(
    fontSize: 35.0,
    fontWeight: FontWeight.w900,
    color: AppColors.purpleBase,
  );

  static const TextStyle smallTextDark = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextStyle smallTextWhite = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle mediumTextWhite = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const headingText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const loginHeadingPurpleText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.deepPurple,
    decoration: TextDecoration.underline,
    decorationThickness: 2,
  );

  static const titleText = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: Colors.deepPurple,
    shadows: [
      Shadow(
        offset: Offset(1.5, 1.5),
        color: Colors.black,
        blurRadius: 1,
      )
    ],
  );
  
}
