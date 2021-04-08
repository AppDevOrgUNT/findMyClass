import 'package:ado_project_2/CustomWidgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

/*
Resource for bottom search bar: https://www.shauryalabs.com/blog/flutter-tutorial-2/
 */

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          Stack(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text("(Place Image Here)"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
