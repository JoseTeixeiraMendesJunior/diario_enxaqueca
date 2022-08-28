import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../layouts/globalinfo.dart';
import '../../utils/global_scafold.dart';

class AlterarDados extends StatefulWidget {
  const AlterarDados({Key? key}) : super(key: key);

  @override
  State<AlterarDados> createState() => _AlterarDadosState();
}

class _AlterarDadosState extends State<AlterarDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(
        title: const Text('Alterar Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 64, bottom: 32, right: 32, left: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Nome'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 32, right: 32, left: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 32, right: 32, left: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Senha'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 32, right: 32, left: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Confirmação de senha'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(24),
                      child: ElevatedButton(
                        onPressed: () {
                          GlobalScaffold.instance.snackBarStatus(
                              'Dados alterados com sucesso',
                              GlobalInfo.successColor);
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar'),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
