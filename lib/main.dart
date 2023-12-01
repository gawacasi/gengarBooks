import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gengarbook/pages/homePage.dart';
import 'package:gengarbook/pages/loginPage.dart';
import 'package:gengarbook/pages/onBoardingPage.dart';
import 'package:gengarbook/pages/signUpPage.dart';
import 'package:gengarbook/pages/splashPage.dart';

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
        initialRoute: 'login',
        routes: {
          'initial': (context) => const OnboardPage(),
          '/': (context) => const SplashPage(),
          'login': (context) => const LoginPage(),
          'singup': (context) => const SignupPage(),
          'home': (context) => const HomePage(),
        },
      ),
    ),
  );
}
