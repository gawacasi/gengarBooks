import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gengarfilm/pages/home_page.dart';

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
        home: const HomePage(),
      ),
    ),
  );
}
