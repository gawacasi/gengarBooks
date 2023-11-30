import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gengarfilm/pages/home_page.dart';
import 'package:gengarfilm/pages/onboarding_page.dart';
import 'package:gengarfilm/pages/login_page.dart';
import 'package:gengarfilm/pages/splash_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GengarFilm',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          fontFamily: "Poppins",
        ),
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const SplashPage(),
          'initial': (context) => const OnboardPage(),
          'login': (context) => const LoginPage(),
          'home': (context) => const HomePage(),
        },
      ),
    ),
  );
}
