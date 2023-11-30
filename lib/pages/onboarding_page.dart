import 'package:flutter/material.dart';
import 'package:gengarfilm/common/style_colors.dart';
import 'package:gengarfilm/common/style_txt.dart';
import 'package:gengarfilm/widgets/custom_button.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Align(
        child: Column(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Image.asset(
                'assets/gengar_splash.png',
                scale: 3,
              ),
            ),
            const Text(
              "GengarFilm",
              style: AppStyle.charText,
            ),
            const Text(
              "Seu App de Filmes",
              style: AppStyle.charText,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.0, left: 40, right: 40),
              child: CustomButton(
                text: 'Entrar',
                onPressed: () => {
                  {Navigator.of(context).pushNamed('login')},
                },
              ),
            ),
            const SizedBox(
              height: 25.0,
            )
          ],
        ),
      ),
    );
  }
}
