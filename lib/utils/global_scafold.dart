import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();
  final scaffKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void showSnackBar(SnackBar snackbar) {
    // ignore: deprecated_member_use
    scaffKey.currentState?.showSnackBar(snackbar);
  }

  void snackBarStatus(String message, Color color) {
    showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
