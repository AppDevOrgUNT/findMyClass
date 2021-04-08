import 'package:ado_project_2/CustomWidgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

/*
Resource for bottom search bar: https://www.shauryalabs.com/blog/flutter-tutorial-2/
 */

enum FloorOptions {
  floor1,
  floor2,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FloorOptions isSelected = FloorOptions.floor1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(),

          //Map and zoom buttons
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                //Map of the building
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 40,
                    top: 80,
                  ),
                  child: isSelected == FloorOptions.floor1
                      ? Image.asset("images/1F.png")
                      : Image.asset("images/2F.png"),
                ),

                //Zoom buttons
                Positioned(
                  right: 20,
                  top: 30,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          //TODO: Zoom in
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kSageGreen,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 2),
                                blurRadius: 3,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.add,
                              color: kGreen,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO: Zoom out
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kSageGreen,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 2),
                                blurRadius: 3,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.remove,
                              color: kGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Floor and icon buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //Row of Floor text
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      //TODO: Change to floor 1
                      setState(() {
                        isSelected = FloorOptions.floor1;
                      });
                    },
                    child: Container(
                      child: Text(
                        "Floor 1",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: isSelected == FloorOptions.floor1
                              ? kGreen
                              : kLightGreen,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: Change to floor 2

                      setState(() {
                        isSelected = FloorOptions.floor2;
                      });
                    },
                    child: Container(
                      child: Text(
                        "Floor 2",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: isSelected == FloorOptions.floor2
                              ? kGreen
                              : kLightGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Row of Icon Buttons
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: kGreen,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          blurRadius: 3,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: IconButton(
                      color: kOffWhite,
                      icon: Icon(Icons.house),
                      onPressed: () {
                        //TODO: Restart from the beginning of the app
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kGreen,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          blurRadius: 3,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: IconButton(
                      color: kOffWhite,
                      icon: Icon(Icons.star),
                      onPressed: () {
                        //TODO: Shows favorites of the app
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),

          //Search Bar
          Container(),
        ],
      ),
    );
  }
}
