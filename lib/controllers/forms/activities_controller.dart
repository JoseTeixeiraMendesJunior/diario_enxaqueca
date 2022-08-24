import 'package:diario_enxaqueca/models/activites_model.dart';
import 'package:get/get.dart';

class ActivitiesController extends GetxController {
  var listActivites = <ActivitedModel>[].obs;
  String typeForm = '';

  void newForm(String type) {
    var temp = <ActivitedModel>[];
    listActivites.value = temp;
    update();
  }

  void addItens(String input, String time) {
    listActivites
        .add(ActivitedModel(type: typeForm, activitie: input, hour: time));
    update();
  }

  void removeItem(int index) {
    listActivites.removeAt(index);
    update();
  }
}
