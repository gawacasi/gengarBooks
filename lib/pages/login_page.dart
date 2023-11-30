import 'package:flutter/material.dart';
import 'package:gengarfilm/api/movie_api.dart';
import 'package:gengarfilm/widgets/custom_button.dart';
import 'package:gengarfilm/widgets/custom_form_field.dart';
import 'package:gengarfilm/widgets/custom_text_button.dart';
import 'package:gengarfilm/widgets/password_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '', senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            Image.asset(
              'assets/gengar_splash.png',
              height: 110,
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
                      email = value.toString();
                      return null;
                    },
                    hintTxt: "user@email.com",
                    labelTxt: "EMAIL",
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
              child: CustomButton(
                text: 'Entrar',
                onPressed: () async {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    await login(email, senha);
                    Navigator.of(context).pushReplacementNamed('home');
                  } else {}
                },
              ),
            ),
            CustomTextButton(
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed('signup')},
              text: 'Não possui uma conta? ',
              customTxt: 'Cadastre-se',
            ),
          ],
        ),
      ),
    );
  }
}
