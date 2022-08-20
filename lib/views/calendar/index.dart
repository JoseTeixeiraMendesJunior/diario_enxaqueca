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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.calendar_month)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: GlobalInfo.primaryColor,
      appBar: AppBar(
        backgroundColor: GlobalInfo.contrastColor,
        centerTitle: true,
        title: SizedBox(
            child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '${DateFormat.MMMM('pt_BR').format(DateTime.now())} '),
            TextSpan(text: DateFormat.y('pt_BR').format(DateTime.now()))
          ]),
        )),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: GlobalInfo.contrastColor,
        gapLocation: GapLocation.center,
        inactiveColor: Colors.white,
        icons: const <IconData>[Icons.house_outlined, Icons.stacked_bar_chart],
        activeIndex: 1,
        onTap: (p0) => print('oi'),
      ),
      // bottomNavigationBar: BottomAppBar(
      //     color: Colors.black,
      //     notchMargin: 5,
      //     shape: CircularNotchedRectangle(),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         IconButton(
      //           icon: Icon(Icons.calendar_month),
      //           onPressed: () {},
      //         )
      //       ],
      //     )
      // BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: 1,
      //     selectedIconTheme: IconThemeData(size: 50),
      //     unselectedItemColor: Colors.white,
      //     backgroundColor: GlobalInfo.contrastColor,
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.house_outlined),
      //           label: '',
      //           backgroundColor: Colors.white),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.calendar_month),
      //           label: '',
      //           backgroundColor: Colors.white),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.stacked_bar_chart), label: '')
      //     ]),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        color: GlobalInfo.primaryColor,
        child: TableCalendar(
            // onDaySelected: (selectedDay, focusedDay) => ,
            //   // eventLoader: (day) {
            //   //   // return [Text('evento')];
            // },
            shouldFillViewport: true,
            // rowHeight: MediaQuery.of(context).size.height / 10,
            locale: 'pt_BR',
            calendarStyle:
                const CalendarStyle(defaultDecoration: BoxDecoration()),
            firstDay: DateTime(DateTime.now().year - 1, DateTime.now().month,
                DateTime.now().day),
            focusedDay: DateTime.now(),
            lastDay: DateTime(DateTime.now().year + 1, DateTime.now().month,
                DateTime.now().day)),
      ),
    );
  }
}
