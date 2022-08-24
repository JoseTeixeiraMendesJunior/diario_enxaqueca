import 'package:diario_enxaqueca/models/humor_model.dart';
import 'package:get/get.dart';

class HumorController extends GetxController {
  /// Metodo de acesso
  static HumorController get to => Get.find();

  var humorList = <HumorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addHumors();
  }

  void addHumors() async {
    await Future.delayed(const Duration(seconds: 1));

    var response = [
      HumorModel('assets/images/rindo.png', 'Feliz'),
      HumorModel('assets/images/confuso.png', 'Normal'),
      HumorModel('assets/images/morto.png', 'Cansado'),
      HumorModel('assets/images/adormecido.png', 'Sonolento'),
      HumorModel('assets/images/triste.png', 'Triste'),
      HumorModel('assets/images/bravo.png', 'Estressado'),
    ];

    humorList.value = response;
  }

  void setHumor({index}) {
    List<HumorModel> temp = [];

    for (int i = 0; i < humorList.length; i++) {
      humorList[i].status = false;
      if (i == index) {
        humorList[i].status = true;
      }
      temp.add(humorList[i]);
    }

    humorList.value = temp;

    update();
  }
}
