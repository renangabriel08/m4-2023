import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:m4/controllers/api_controller.dart';
import 'package:m4/controllers/inputs_controller.dart';
import 'package:m4/styles/cores.dart';
import 'package:m4/styles/fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String senha = '';
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;
    List availableBiometrics = [];
    int erros = 0;

    Future.wait([
      auth.canCheckBiometrics,
    ]).then((value) async {
      availableBiometrics = await auth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty) {
        try {
          final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to show account balance',
            options: const AuthenticationOptions(biometricOnly: true),
          );
          if (didAuthenticate) {
            Navigator.pushNamed(context, '/app');
          } else {
            erros++;
            if (erros == 3) {
              await auth.stopAuthentication();
            }
          }
        } catch (e) {
          print(e);
        }
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: widthTela,
          height: heightTela,
          child: Column(
            children: [
              Container(
                height: heightTela * .3,
                width: widthTela,
                decoration: BoxDecoration(
                  color: Cores.azulEscuro,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Logo.png', height: 50),
                    SizedBox(
                      width: widthTela * .7,
                      child: Text(
                        'Realize login e transforme suas jornadas em aventuras emocionantes!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: Fonts.font,
                          fontSize: Fonts.fontSizeNormal,
                          color: Cores.verdeEscuro,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightTela * .7,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              validator: (value) =>
                                  InputsController.validarDados(value),
                              onChanged: (value) => email = value,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: const Icon(Icons.email_outlined),
                                label: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontFamily: Fonts.font,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              validator: (value) =>
                                  InputsController.validarDados(value),
                              onChanged: (value) => senha = value,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: const Icon(Icons.password_outlined),
                                label: Text(
                                  'Senha',
                                  style: TextStyle(
                                    fontFamily: Fonts.font,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(widthTela, 50),
                            backgroundColor: Cores.azulEscuro,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ApiController.logar(email, senha, context);
                            }
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              fontFamily: Fonts.font,
                              fontSize: Fonts.fontSizeNormal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
