import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gengarfilm/common/style_txt.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

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
            GestureDetector(
              onTap: () => {Navigator.of(context).pushReplacementNamed('home')},
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            ),
            const Gap(10),
            InkWell(
              onTap: () => {},
              child: const Center(
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
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
