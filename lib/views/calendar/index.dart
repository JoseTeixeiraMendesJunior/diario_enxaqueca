import 'dart:core';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controllers/forms/calendar_controller.dart';
import '../../models/events_model.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final calendarController = Get.put(CalendarController());
  DateTime? _selectedDay = DateTime.now();
  DateTime? _focusedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  List<EventsModel> eventList = [
    EventsModel(
      descricao: 'Enxaqueca forte',
      dia: '28/08/2022',
      hour: '15:45',
      titulo: 'Crise',
    ),
    EventsModel(
      descricao: 'Enxaqueca forte',
      dia: '28/08/2022',
      hour: '15:45',
      titulo: 'Crise',
    ),
    EventsModel(
      descricao: 'Enxaqueca forte',
      dia: '29/08/2022',
      hour: '15:45',
      titulo: 'Crise',
    ),
    EventsModel(
      descricao: 'Enxaqueca forte',
      dia: '28/08/2022',
      hour: '15:45',
      titulo: 'Crise',
    ),
    EventsModel(
      descricao: 'Enxaqueca forte',
      dia: '28/08/2022',
      hour: '15:45',
      titulo: 'Crise',
    )
  ];
  List<Text> eventList2 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {}, child: Icon(Icons.calendar_month)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(
        backgroundColor: GlobalInfo.contrastColor,
        centerTitle: true,
        title: SizedBox(
            child: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: 'Calendário',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
          ]),
        )),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                color: GlobalInfo.whiteIce,
                child: TableCalendar(
                    pageJumpingEnabled: false,
                    headerStyle: const HeaderStyle(
                        titleCentered: true, titleTextStyle: TextStyle()),
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                    shouldFillViewport: true,
                    // rowHeight: MediaQuery.of(context).size.height / 10,
                    eventLoader: (day) {
                      eventList2.clear();
                      eventList.forEach((element) {
                        if (element.dia ==
                            DateFormat('dd/MM/yyyy').format(day)) {
                          eventList2.add(Text(element.descricao!));
                        }
                      });
                      return eventList2;
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = _selectedDay;
                      });
                    },
                    calendarFormat: _calendarFormat,
                    locale: 'pt_BR',
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                      weekendTextStyle: TextStyle(color: Colors.red),
                      defaultTextStyle:
                          TextStyle(color: GlobalInfo.contrastColor),
                    ),
                    firstDay: DateTime(DateTime.now().year - 1,
                        DateTime.now().month, DateTime.now().day),
                    focusedDay: _focusedDay!,
                    lastDay: DateTime(DateTime.now().year + 1,
                        DateTime.now().month, DateTime.now().day)),
              ),
              Visibility(
                visible: ['29/08/2022', '28/08/2022', '29/08/2022'].contains(
                        DateFormat('dd/MM/yyyy')
                            .format(_selectedDay ?? DateTime.now()))
                    ? true
                    : false,
                child: Container(
                    height: 50,
                    decoration:
                        const BoxDecoration(color: GlobalInfo.primaryColor),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Eventos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: GlobalInfo.whiteIce,
                        ),
                      ),
                    )),
              ),
              Visibility(
                visible: ['29/08/2022', '28/08/2022', '29/08/2022'].contains(
                        DateFormat('dd/MM/yyyy')
                            .format(_selectedDay ?? DateTime.now()))
                    ? true
                    : false,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: eventList.length,
                  itemBuilder: (context, index) {
                    EventsModel item = eventList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: GlobalInfo.whiteIce),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: GlobalInfo.contrastColor),
                                      children: [
                                    TextSpan(
                                        text: item.titulo,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: GlobalInfo.contrastColor),
                                      children: [
                                    const TextSpan(
                                        text: 'Data: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: item.dia)
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: GlobalInfo.contrastColor),
                                      children: [
                                    const TextSpan(
                                        text: 'Descrição: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: item.descricao)
                                  ]))
                            ],
                          ),
                        ),
                      ),
                    );
                  },

                  // children: getEventos(),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
