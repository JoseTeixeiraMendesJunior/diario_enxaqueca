import 'dart:ui';

import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/layouts/widgets/globalwidget.dart';
import 'package:diario_enxaqueca/utils/global_dialogs.dart';
import 'package:diario_enxaqueca/utils/global_scafold.dart';
import 'package:diario_enxaqueca/views/home/index.dart';
import 'package:diario_enxaqueca/views/login/register.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgraoundImage(),
          GlassEfect(bodyWidget: BodyLoginWidget())
        ],
      ),
    );
  }
}

class BodyLoginWidget extends StatelessWidget {
  const BodyLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: LogoWidget(
            topPadding: 0,
          ),
        ),
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 64, bottom: 32, right: 32, left: 32),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32, right: 32, left: 32),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text('Entrar'),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterView()));
                          },
                          child: const Text(
                            'Cadastrar-se',
                            style: TextStyle(color: GlobalInfo.infoColor),
                          )),
                      TextButton(
                          onPressed: () {
                            animatedDialogPadrao(
                                context, const RememberPassword());
                          },
                          child: const Text(
                            'Recuperar Senha',
                            style: TextStyle(color: GlobalInfo.infoColor),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RememberPassword extends StatelessWidget {
  const RememberPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recuperção de Senha'),
      content: const TextField(
        decoration: InputDecoration(label: Text('Informe seu email')),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Fechar',
                  style: TextStyle(color: GlobalInfo.dangerColor),
                )),
            TextButton(
                onPressed: () {
                  GlobalScaffold.instance.snackBarStatus(
                      'Nova senha enviada ao seu email',
                      GlobalInfo.successColor);
                  Navigator.pop(context);
                },
                child: const Text('Enviar'))
          ],
        )
      ],
    );
  }
}
