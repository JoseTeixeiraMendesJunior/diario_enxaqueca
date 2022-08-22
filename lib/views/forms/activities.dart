import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({
    required this.name,
    required this.activities,
    Key? key,
  }) : super(key: key);

  final String name;
  final List activities;

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
