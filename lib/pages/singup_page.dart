import 'package:flutter/material.dart';
import 'package:gengarfilm/widgets/custom_button.dart';
import 'package:gengarfilm/widgets/custom_form_field.dart';
import 'package:gengarfilm/widgets/custom_text_button.dart';
import 'package:gengarfilm/widgets/password_form_field.dart';
import 'package:gengarfilm/widgets/uppercase_text.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    return null;
                  },
                  inputFormatter: [
                    UpperCaseTextInput(),
                  ],
                  hintTxt: "Escreva seu nome aqui",
                  labelTxt: "NOME",
                ),
                CustomFormField(
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Esse campo não pode ser vazio";
                    }
                    return null;
                  },
                  hintTxt: "user@email.com",
                  labelTxt: "EMAIL",
                ),
                PasswordFormField(
                  helperTxt:
                      "A senha deve conter:\n *Letra maiuscula\n *Numero\n *Caractere especial",
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Esse campo não pode ser vazio";
                    }
                    return null;
                  },
                  hintTxt: "*********",
                  labelTxt: "SENHA",
                ),
                PasswordFormField(
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Esse campo não pode ser vazio";
                    }
                    return null;
                  },
                  hintTxt: "*********",
                  labelTxt: "CONFIRME SUA SENHA",
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                text: 'Finalizar',
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    Navigator.of(context).pushReplacementNamed('home');
                  } else {
                    print("erro");
                  }
                },
              ),
            ),
          ),
          CustomTextButton(
            onPressed: () =>
                {Navigator.of(context).pushReplacementNamed('login')},
            text: 'Já possui conta? ',
            customTxt: 'Login',
          ),
        ],
      ),
    );
  }
}

class UpperCaseTxtInput {}
