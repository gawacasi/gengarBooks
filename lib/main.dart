import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gengarbook/pages/homePage.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GengarBook',
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        home: const HomePage(),
      ),
    ),
  );
}
