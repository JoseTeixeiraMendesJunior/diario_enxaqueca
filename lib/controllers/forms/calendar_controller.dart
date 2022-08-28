import 'package:diario_enxaqueca/models/activites_model.dart';
import 'package:get/get.dart';

import '../../models/events_model.dart';

class CalendarController extends GetxController {
  var listEvents = <EventsModel>[].obs;
  String typeForm = '';

  init() {
    listEvents.clear();
    listEvents.add(EventsModel());
    listEvents.add(EventsModel());
    listEvents.add(EventsModel());
    listEvents.add(EventsModel());
    update();
  }

  List getEvents(DateTime day) {
    var tempList = <EventsModel>[];

    // listEvents.forEach((element) { })
    return listEvents;
  }
}
