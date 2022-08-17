import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/layouts/globalwidget.dart';
import 'package:diario_enxaqueca/utils/global_scafold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgraoundImage(),
          GlassEfect(bodyWidget: BodyRegisterWidget())
        ],
      ),
    );
  }
}

class BodyRegisterWidget extends StatelessWidget {
  const BodyRegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          // height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'Cadastro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: GlobalInfo.tertiaryColor,
                    fontSize: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 64, bottom: 32, right: 32, left: 32),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32, right: 32, left: 32),
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
                padding: const EdgeInsets.only(bottom: 32, right: 32, left: 32),
                child: TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Confirmação de senha'),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(24),
                  child: ElevatedButton(
                    onPressed: () {
                      GlobalScaffold.instance.snackBarStatus(
                          'Cadastro efetuado com sucesso',
                          GlobalInfo.successColor);
                      Navigator.pop(context);
                    },
                    child: const Text('Salvar'),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
