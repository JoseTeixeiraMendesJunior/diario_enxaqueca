import 'package:diario_enxaqueca/controllers/forms/activities_controller.dart';
import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/models/activites_model.dart';
import 'package:diario_enxaqueca/utils/global_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({
    required this.name,
    required this.activities,
    Key? key,
  }) : super(key: key);

  final String name;
  final String activities;

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  final activetiesController = Get.put(ActivitiesController());

  @override
  void initState() {
    activetiesController.newForm(widget.activities);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Obx(
        () => activetiesController.listActivites.isEmpty
            ? const EmptyWidget()
            : ListView.builder(
                itemCount: activetiesController.listActivites.length,
                itemBuilder: (context, index) {
                  ActivitedModel item =
                      activetiesController.listActivites[index];
                  return CardActivities(
                    item: item,
                    func: () => activetiesController.removeItem(index),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animatedDialogPadrao(context, const FormNewActivitie());
        },
        backgroundColor: GlobalInfo.secondaryColor,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

class CardActivities extends StatelessWidget {
  const CardActivities({
    required this.item,
    required this.func,
    Key? key,
  }) : super(key: key);

  final ActivitedModel item;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                item.hour!,
                style: const TextStyle(
                    color: GlobalInfo.contrastColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        item.activitie!,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: GlobalInfo.contrastColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: func,
                      icon: const Icon(Icons.delete_rounded,
                          color: GlobalInfo.dangerColor))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormNewActivitie extends StatefulWidget {
  const FormNewActivitie({
    Key? key,
  }) : super(key: key);

  @override
  State<FormNewActivitie> createState() => _FormNewActivitieState();
}

class _FormNewActivitieState extends State<FormNewActivitie> {
  TimeOfDay? selectedTime;

  final controller = Get.put(ActivitiesController());
  TextEditingController timeController = TextEditingController();
  TextEditingController itemController = TextEditingController();

  @override
  void dispose() {
    timeController.dispose();
    itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Registro',
        style: TextStyle(
            color: GlobalInfo.contrastColor, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () async {
                      selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (BuildContext context, Widget? child) => Theme(
                          data: ThemeData().copyWith(
                              colorScheme: const ColorScheme.light(
                                  primary: GlobalInfo.primaryColor)),
                          child: child!,
                        ),
                      );

                      if (selectedTime != null) {
                        setState(() {
                          timeController.text =
                              '${selectedTime!.hour}:${selectedTime!.minute}';
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: timeController,
                        decoration: InputDecoration(
                            hintText: 'Horário de início *',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: GlobalInfo.tertiaryColor,
                                    width: 3))),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: itemController,
                  decoration: InputDecoration(
                      hintText: 'Informe o item',
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
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Fechar',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.addItens(itemController.text, timeController.text);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Lista Vazia',
                  style: TextStyle(
                      color: GlobalInfo.contrastColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  animatedDialogPadrao(context, const FormNewActivitie());
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Adicione novos itens',
                    style: TextStyle(
                        color: GlobalInfo.contrastColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
