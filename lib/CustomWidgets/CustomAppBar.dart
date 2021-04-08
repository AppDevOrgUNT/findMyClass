import 'package:flutter/material.dart';
import 'package:ado_project_2/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: kGreen,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 57.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 128.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Class Finder",
                      style: kClassFinderTextStyle,
                    ),
                    Text(
                      "Discovery Park",
                      style: kBuildingTextStyle,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.help_outline,
                  color: kOffWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
