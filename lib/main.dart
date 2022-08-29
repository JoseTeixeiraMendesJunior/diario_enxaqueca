import 'package:diario_enxaqueca/controllers/forms/activities_controller.dart';
import 'package:diario_enxaqueca/controllers/forms/humor_controller.dart';
import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/utils/global_scafold.dart';
import 'package:diario_enxaqueca/views/calendar/index.dart';
import 'package:diario_enxaqueca/views/home/index.dart';
import 'package:diario_enxaqueca/views/login/index.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Create the instance of Controller
  HumorController humorController = Get.put(HumorController());
  ActivitiesController activitiesController = Get.put(ActivitiesController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          primaryColor: GlobalInfo.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
              backgroundColor: GlobalInfo.darkGrey,
              elevation: 5,
              shadowColor: GlobalInfo.navy),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(152, 56),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(152, 56),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  primary: GlobalInfo.contrastColor,
                  textStyle: const TextStyle(fontSize: 16))),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: const TextStyle(color: GlobalInfo.grey),
            floatingLabelStyle: const TextStyle(
                color: GlobalInfo.primaryColor, fontWeight: FontWeight.bold),
            alignLabelWithHint: true,
            labelStyle: const TextStyle(
                color: GlobalInfo.grey, fontWeight: FontWeight.normal),
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: GlobalInfo.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: GlobalInfo.dangerColor),
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: GlobalInfo.border),
              borderRadius: BorderRadius.circular(16),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: GlobalInfo.border),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: GlobalInfo.border),
              borderRadius: BorderRadius.circular(16),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: GlobalInfo.dangerColor),
              borderRadius: BorderRadius.circular(16),
            ),
          )),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: GlobalInfo.cement,
          key: GlobalScaffold.instance.scaffKey,
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0), child: child),
        );
      },
      navigatorKey: GlobalScaffold.instance.navigatorKey,
      initialRoute: '/',
      routes: {
        'Home': (_) => const HomeView(),
        // this line below is always the last line
        // '/': (_) => const CalendarView(),
        '/': (_) => const LoginView(),
      },
    );
  }
}
