import 'package:flutter/material.dart';

class AppStyle {
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
