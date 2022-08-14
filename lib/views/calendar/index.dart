import 'dart:core';

import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
            child: RichText(
          text: TextSpan(children: [
            TextSpan(text: DateFormat('MMMM ').format(DateTime.now())),
            TextSpan(text: DateFormat('y').format(DateTime.now()))
          ]),
        )),
      ),
      body: Container(
        color: GlobalInfo.black,
      ),
    );
  }
}
