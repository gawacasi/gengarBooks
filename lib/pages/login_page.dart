import 'package:flutter/material.dart';
import 'package:gengarmovies/api/movie_api.dart';
import 'package:gengarmovies/common/style_colors.dart';
import 'package:gengarmovies/common/style_text.dart';
import 'package:gengarmovies/controllers/user_controller.dart';
import 'package:gengarmovies/widgets/custom_form_field.dart';
import 'package:gengarmovies/widgets/password_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '', senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            Image.asset(
              'assets/gengar.png',
              scale: 8,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      username = value.toString();
                      return null;
                    },
                    hintTxt: "Username",
                    labelTxt: "USERNAME",
                  ),
                  PasswordFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      senha = value.toString();
                      return null;
                    },
                    hintTxt: "*********",
                    labelTxt: "SENHA",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 60)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.purpleBase),
                  overlayColor: MaterialStateProperty.all<Color>(
                      AppColors.strongPurpleBase),
                ),
                onPressed: () async {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    final userStorage = UserController();
                    await userStorage.saveUsername(username);
                    await login(username, senha);
                    await Navigator.of(context).pushReplacementNamed('home');
                  } else {}
                },
                child: const Text(
                  'Entrar',
                  style: AppStyle.mediumTextWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
