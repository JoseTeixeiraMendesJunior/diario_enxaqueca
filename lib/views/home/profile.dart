import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/layouts/widgets/globalwidget.dart';
import 'package:diario_enxaqueca/utils/global_dialogs.dart';
import 'package:diario_enxaqueca/views/home/change_data.dart';
import 'package:diario_enxaqueca/views/home/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(title: const Text('Informações')),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.height - 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  ProfileImage(),
                  ProfileInfo(),
                  // LoadWidget(),
                  ProfileReport(),
                ],
              ),
            )),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Nome do Usuário',
          style: TextStyle(fontSize: 20, color: GlobalInfo.contrastColor),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'email@email.com',
            style: TextStyle(fontSize: 14, color: GlobalInfo.contrastColor),
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AlterarDados(),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Alterar dados',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.settings_rounded,
                  color: Colors.grey,
                  size: 14,
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class ProfileReport extends StatefulWidget {
  const ProfileReport({Key? key}) : super(key: key);

  @override
  State<ProfileReport> createState() => _ProfileReportState();
}

class _ProfileReportState extends State<ProfileReport> {
  String labelChart = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Uso nos últimos 30 dias:',
                      style: TextStyle(
                        color: GlobalInfo.contrastColor,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '21',
                        style: TextStyle(
                            color: GlobalInfo.contrastColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 110,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 5,
                                centerSpaceRadius: 0,
                                sections: daysWithoutPain(),
                                // pieTouchData: PieTouchData(
                                //   touchCallback: (touch) =>
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: GlobalInfo.tertiaryColor, width: 3)),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Dias sem crise:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: GlobalInfo.contrastColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '9',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: GlobalInfo.contrastColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: GlobalInfo.tertiaryColor, width: 3)),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Quantidade de registros no últimos 30 dias:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: GlobalInfo.contrastColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '140',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: GlobalInfo.contrastColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReportView(
                                dataInicio: '01/08/2022',
                                dataFim: '31/08/2022'),
                          ));
                      // animatedDialogPadrao(context, const FiltroRelatorio());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Gerar Relatório'),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.download_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }

  daysWithoutPain() {
    return List.generate(2, (index) {
      final color = index == 0 ? Colors.grey[300] : GlobalInfo.tertiaryColor;
      final days = index == 0 ? 9 : 21;

      var porcentagem = (days / 30) * 100;

      return PieChartSectionData(
          color: color,
          value: porcentagem,
          title: '${porcentagem.toStringAsFixed(0)}%',
          radius: 50.0);
    });
  }
}

// class FiltroRelatorio extends StatefulWidget {
//   const FiltroRelatorio({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<FiltroRelatorio> createState() => _FiltroRelatorioState();
// }

// class _FiltroRelatorioState extends State<FiltroRelatorio> {
//   TimeOfDay? selectedTime;

//   TextEditingController initTimeController = TextEditingController();
//   TextEditingController endTimeController = TextEditingController();

//   @override
//   void dispose() {
//     initTimeController.dispose();
//     endTimeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text(
//         'Registro',
//         style: TextStyle(
//             color: GlobalInfo.contrastColor, fontWeight: FontWeight.bold),
//       ),
//       content: SizedBox(
//         child: IntrinsicHeight(
//           child: Column(
//             children: [
//               Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: GestureDetector(
//                     onTap: () async {
//                       selectedTime = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                         builder: (BuildContext context, Widget? child) => Theme(
//                           data: ThemeData().copyWith(
//                               colorScheme: const ColorScheme.light(
//                                   primary: GlobalInfo.primaryColor)),
//                           child: child!,
//                         ),
//                       );

//                       if (selectedTime != null) {
//                         setState(() {
//                           timeController.text =
//                               '${selectedTime!.hour}:${selectedTime!.minute}';
//                         });
//                       }
//                     },
//                     child: AbsorbPointer(
//                       child: TextFormField(
//                         controller: timeController,
//                         decoration: InputDecoration(
//                             hintText: 'Horário de início *',
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     color: GlobalInfo.tertiaryColor,
//                                     width: 3))),
//                       ),
//                     ),
//                   )),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: itemController,
//                   decoration: InputDecoration(
//                       hintText: 'Informe o item',
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                           width: 3,
//                           color: GlobalInfo.tertiaryColor,
//                         ),
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text(
//                   'Fechar',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   controller.addItens(itemController.text, timeController.text);
//                   Navigator.pop(context);
//                 },
//                 child: const Text(
//                   'Salvar',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 75,
        width: 75,
        decoration: BoxDecoration(
            color: GlobalInfo.tertiaryColor,
            borderRadius: BorderRadius.circular(50)),
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
      ),
    );
  }
}
