import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gengarfilm/common/style_txt.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/gengar_splash.png',
                scale: 3,
              ),
            ),
            const Text(
              'Gengar Films',
              style: AppStyle.titleText,
            ),
            const Gap(10),
            Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                border: Border.all(color: Colors.deepPurple),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                // gradient: Gradient(
                //   Alignment.topCenter,
                //   Alignment.bottomCenter,
                //   [Colors.deepPurple, Colors.purple],
                // ),
              ),
              child: const Center(
                child: Text(
                  "Iniciar sessão",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Gap(10),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não tem conta?',
                    style: AppStyle.headingText,
                  ),
                  Gap(5),
                  Text(
                    'Cadastre-se!',
                    style: AppStyle.loginHeadingPurpleText,
                  )
                ],
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
