import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:gengarmovies/pages/onboarding_page.dart';
import 'package:gengarmovies/pages/splash_page.dart';
import 'package:gengarmovies/pages/signup_page.dart';
import 'package:gengarmovies/pages/login_page.dart';
import 'package:gengarmovies/pages/home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GengarMovie',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          fontFamily: "Poppins",
        ),
        initialRoute: 'login',
        routes: {
          '/': (context) => const SplashPage(),
          'initial': (context) => const OnboardPage(),
          'login': (context) => const LoginPage(),
          'singup': (context) => const SignupPage(),
          'home': (context) => const HomePage(),
        },
      ),
    ),
  );
}
