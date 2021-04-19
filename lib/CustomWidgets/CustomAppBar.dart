import 'package:flutter/material.dart';
import 'package:ado_project_2/constants.dart';

const kInfoTextStyle = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.bold,
);

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
                onPressed: () {
                  //TODO: add help information
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Text(
                          "Questions?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                "Call Us 940-565-4300",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "engineering.unt.edu",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Divider(),
                              ),
                              Text(
                                "Created by the Application",
                                style: kInfoTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Development Organization",
                                style: kInfoTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "@ado_unt",
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
