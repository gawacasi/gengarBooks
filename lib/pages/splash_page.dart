import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gengarfilm/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Navega para a tela de onboarding após 2 segundos
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Image.asset(
          'assets/gengar_splash.png',
          scale: 5,
        ),
      ),
    );
  }
}
