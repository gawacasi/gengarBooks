import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/gengar_splash.png',
                scale: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
