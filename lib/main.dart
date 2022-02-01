import 'package:countries_gql/presentation/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL Countries client',
      theme: ThemeData(
        fontFamily: "SourceSansPro",
        brightness: Brightness.light,
        canvasColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
