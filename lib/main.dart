import 'package:ado_project_2/HomePage.dart';
import 'package:ado_project_2/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        appBarTheme: AppBarTheme(color: kGreen),
        scaffoldBackgroundColor: kOffWhite,
      ),
      home: HomePage(),
    );
  }
}
