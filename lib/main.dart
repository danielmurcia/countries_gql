import 'package:countries_gql/injection.dart';
import 'package:countries_gql/presentation/common/themes.dart';
import 'package:countries_gql/presentation/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL Countries client',
      theme: appTheme(),
      home: HomeScreen(),
    );
  }
}
