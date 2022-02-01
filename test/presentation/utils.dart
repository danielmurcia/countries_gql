import 'package:flutter/material.dart';

Widget makeTestableWidget({
  required Widget child,
}) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}
