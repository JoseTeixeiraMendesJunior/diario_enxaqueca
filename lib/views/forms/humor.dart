import 'package:diario_enxaqueca/controllers/forms/humorController.dart';
import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HumorFormWidget extends StatefulWidget {
  const HumorFormWidget({Key? key}) : super(key: key);

  @override
  State<HumorFormWidget> createState() => _HumorFormWidgetState();
}

class _HumorFormWidgetState extends State<HumorFormWidget> {
  DateTime date = DateTime.now();
  final humorController = Get.put(HumorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(title: const Text('Humor do dia')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Selecione como você se sente no dia $date',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: GlobalInfo.contrastColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  SizedBox(
                    height: double.maxFinite,
                    child: GetX<HumorController>(
                      init: HumorController(),
                      builder: (controller) => ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.humorList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => controller.setHumor(index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.humorList[index].status ==
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
                                        // color: Colors.red,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            controller.humorList[index].image!,
                                          ),
                                          fit: BoxFit.contain,
                                          colorFilter: ColorFilter.mode(
                                              Colors.white.withOpacity(
                                                  controller.humorList[index]
                                                              .status ==
                                                          false
                                                      ? 0.6
                                                      : 0),
                                              BlendMode.lighten),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
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
                                      ),
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
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         padding:
                  //             EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: GlobalInfo.tertiaryColor,
                  //               width: 3,
                  //             ),
                  //             borderRadius: BorderRadius.circular(10)),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(4),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Container(
                  //                 width: 50,
                  //                 height: 50,
                  //                 decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                         image: AssetImage(
                  //                             image),
                  //                         fit: BoxFit.cover)),
                  //               ),
                  //               Expanded(
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: Text(text,
                  //                       style: TextStyle(
                  //                           color: GlobalInfo.contrastColor)),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
