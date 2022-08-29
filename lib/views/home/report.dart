import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReportView extends StatelessWidget {
  const ReportView({
    required this.dataInicio,
    required this.dataFim,
    Key? key,
  }) : super(key: key);

  final String dataInicio;
  final String dataFim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Relatório')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Relatório de crises de enxaqueca',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dataInicio,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dataFim,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Os dados informados nesse relatório levam em consideração os dados informados pelo paciente no período e somente nos dias em que foram registradas crises de enxaquecas.'),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Número de crises : 5'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Nível de dor predominante: Forte'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Humor predominante: cansado'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                'Alimentos:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('- carne vermelha'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                'Rotina:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('- Trabalho'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('- Faculdade'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                'Atividade Física:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Não tiveram registros.'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                'Eventualidades:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Não tiveram registros.'),
            ),
          ],
        ),
      ),
    );
  }
}
