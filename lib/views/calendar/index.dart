import 'dart:core';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime? _selectedDay;
  DateTime? _focusedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  List<Text> eventList = [];
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
          text: const TextSpan(children: [TextSpan(text: 'Calendário')]),
        )),
      ),
      body: Column(
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
                  if (day.day == DateTime.now().day) {
                    eventList.add(Text('oi'));
                    eventList.add(Text('oi'));
                    eventList.add(Text('oi'));
                    eventList.add(Text('oi'));
                    return eventList;
                  }
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
                // onFormatChanged: (format) {
                //   setState(() {
                //     _calendarFormat = format;
                //   });
                // },
                locale: 'pt_BR',
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  weekendTextStyle: TextStyle(color: Colors.red),
                  defaultTextStyle: TextStyle(color: GlobalInfo.contrastColor),
                ),
                firstDay: DateTime(DateTime.now().year - 1,
                    DateTime.now().month, DateTime.now().day),
                focusedDay: _focusedDay!,
                lastDay: DateTime(DateTime.now().year + 1, DateTime.now().month,
                    DateTime.now().day)),
          ),
          Expanded(
            child: ListView(
              physics: const ScrollPhysics(),
              shrinkWrap: false,
              // children: getEventos(),
            ),
          )
        ],
      ),
    );
  }
}
