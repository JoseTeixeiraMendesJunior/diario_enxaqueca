import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/utils/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../calendar/index.dart';

class ExaquecaFormView extends StatefulWidget {
  const ExaquecaFormView({Key? key}) : super(key: key);

  @override
  State<ExaquecaFormView> createState() => _ExaquecaFormViewState();
}

class _ExaquecaFormViewState extends State<ExaquecaFormView> {
  List<String> itens = ['minutos', 'horas'];
  String? selectItens;
  bool switchNausea = false;
  bool switchAura = false;
  int? groupValue = 0;
  TimeOfDay? _selectedTime;
  TextEditingController timeController = TextEditingController();

  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(
        title: const Text('Registro de Enxaqueca'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CalendarView();
                          },
                        ),
                      ),
                      child: Text(
                        'Dia: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: GlobalInfo.contrastColor),
                      ),
                    ),
                  ),

                  /// hor??rio inicio
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () async {
                          _selectedTime = await showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 10, minute: 47),
                            builder: (BuildContext context, Widget? child) =>
                                Theme(
                              data: ThemeData().copyWith(
                                  colorScheme: const ColorScheme.light(
                                      primary: GlobalInfo.primaryColor)),
                              child: child!,
                            ),
                          );

                          if (_selectedTime != null) {
                            setState(() {
                              timeController.text =
                                  '${_selectedTime!.hour}:${_selectedTime!.minute}';
                            });
                          }
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: timeController,
                            decoration: InputDecoration(
                                hintText: 'Hor??rio de in??cio *',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: GlobalInfo.tertiaryColor,
                                        width: 3))),
                          ),
                        ),
                      )),

                  ///dura????o
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 100) * 0.6,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Dura????o *',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: GlobalInfo.tertiaryColor,
                                        width: 3))),
                          ),
                        ),
                        SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 100) * 0.45,
                          height: 60,
                          child: DropdownButtonFormField(
                            iconEnabledColor: Colors.grey,
                            value: selectItens,
                            items: itens
                                .map((e) => DropdownMenuItem<String>(
                                    value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) =>
                                setState(() => selectItens = value.toString()),
                            decoration: InputDecoration(
                                hintText: 'Selecione*',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: GlobalInfo.tertiaryColor,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// medicamento usado
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Medicamento utilizado',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 3,
                              color: GlobalInfo.tertiaryColor,
                            ),
                          )),
                    ),
                  ),

                  /// local da dor
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Local da dor *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 3,
                              color: GlobalInfo.tertiaryColor,
                            ),
                          )),
                    ),
                  ),

                  /// nausea e vomito
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                        title: const Text(
                          'N??usea e v??mito',
                          style: TextStyle(color: GlobalInfo.contrastColor),
                        ),
                        activeColor: GlobalInfo.primaryColor,
                        value: switchNausea,
                        onChanged: ((value) =>
                            setState(() => switchNausea = value))),
                  ),

                  /// presen??a de aura
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                        title: const Text(
                          'Presen??a de aura',
                          style: TextStyle(color: GlobalInfo.contrastColor),
                        ),
                        activeColor: GlobalInfo.primaryColor,
                        value: switchAura,
                        onChanged: ((value) =>
                            setState(() => switchAura = value))),
                  ),

                  /// intensidade de dor
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 16),
                          child: Text(
                            'Intensidade de dor',
                            style: TextStyle(
                                color: GlobalInfo.contrastColor, fontSize: 16),
                          ),
                        ),
                        CupertinoSlidingSegmentedControl<int>(
                          thumbColor: GlobalInfo.tertiaryColor,
                          padding: const EdgeInsets.all(4),
                          groupValue: groupValue,
                          children: {
                            0: escalaItem('Fraca'),
                            1: escalaItem('Mediana'),
                            2: escalaItem('Forte'),
                            3: escalaItem('Muito Forte')
                          },
                          onValueChanged: (value) => setState(() {
                            groupValue = value;
                          }),
                        ),
                      ],
                    ),
                  ),

                  /// descri????o
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: 'Descri????o (opcional)',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                width: 3,
                                color: GlobalInfo.tertiaryColor,
                              ),
                            )),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          GlobalScaffold.instance.snackBarStatus(
                              'Registro salvo!', GlobalInfo.successColor);

                          Navigator.pop(context);
                        },
                        child: const Text('Salvar')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget escalaItem(String text) => Container(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      );
}
