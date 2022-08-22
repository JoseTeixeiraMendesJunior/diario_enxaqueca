import 'package:diario_enxaqueca/models/humorModel.dart';
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
    ];

    humorList.value = response;
  }

  // RxString nome = 'nome'.obs;

  // void changeName(id) {
  //   nome = 'trocou'.obs;
  // }

  void setHumor(id) {
    print('in function');
    for (var element in humorList) {
      element.status = false;
    }

    humorList[id].status = true;
  }
}
