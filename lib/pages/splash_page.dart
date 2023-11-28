import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Image.asset(
        'assets/gengar_splash.png',
        scale: 5,
      )),
    );
  }
}
