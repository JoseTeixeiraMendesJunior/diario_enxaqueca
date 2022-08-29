import 'package:diario_enxaqueca/controllers/forms/humor_controller.dart';
import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/utils/global_scafold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../calendar/index.dart';

class HumorFormWidget extends StatefulWidget {
  const HumorFormWidget({Key? key}) : super(key: key);

  @override
  State<HumorFormWidget> createState() => _HumorFormWidgetState();
}

class _HumorFormWidgetState extends State<HumorFormWidget> {
  DateTime date = DateTime.now();
  final humorController = Get.put(HumorController());

  @override
  void initState() {
    super.initState();
    humorController.setHumor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(title: const Text('Humor do dia')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CalendarView();
                          },
                        ),
                      ),
                      child: Text(
                        'Selecione como você se sente no dia ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16,
                            color: GlobalInfo.contrastColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  SizedBox(
                    height: humorController.humorList.length * 92,
                    child: Obx(
                      () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: humorController.humorList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => humorController.setHumor(index: index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: humorController
                                                .humorList[index].status ==
                                            false
                                        ? GlobalInfo.tertiaryColor
                                        : GlobalInfo.contrastColor,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            humorController
                                                .humorList[index].image!,
                                          ),
                                          fit: BoxFit.contain,
                                          colorFilter: ColorFilter.mode(
                                              Colors.white.withOpacity(
                                                  humorController
                                                              .humorList[index]
                                                              .status ==
                                                          false
                                                      ? 0.6
                                                      : 0),
                                              BlendMode.lighten),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                          humorController
                                              .humorList[index].name!,
                                          style: TextStyle(
                                              color: humorController
                                                          .humorList[index]
                                                          .status ==
                                                      false
                                                  ? Colors.grey
                                                  : GlobalInfo.contrastColor,
                                              fontWeight: humorController
                                                          .humorList[index]
                                                          .status ==
                                                      false
                                                  ? FontWeight.normal
                                                  : FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
                              'Humor registrado!', GlobalInfo.successColor);
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
}
