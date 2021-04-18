import 'package:ado_project_2/CustomWidgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
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
    List<String> _tempListOfRooms;

    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController searchBarController = TextEditingController();

    //Dummy data for the search bar
    List<String> _listOfRooms = <String>[
      "B109",
      "B110",
      "B111",
      "B112",
      "B135",
      "B139",
      "M101",
      "M130",
      "D150",
    ];

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          //Map and zoom buttons
          Expanded(
            child: Stack(
              children: <Widget>[
                //Map of the building
                SizedBox.expand(
                  child: Container(
                    padding: EdgeInsets.only(
                      // left: 20,
                      // right: 20,
                      // bottom: 40,
                      top: 130, //to leave space for the appbar
                    ),
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 3,
                      child: Stack(
                        children: <Widget>[
                          // YOUR MAP as an image
                          isSelected == FloorOptions.floor1
                              ? Image.asset("images/1F.png")
                              : Image.asset("images/2F.png"),

                          //TODO: Path finding image will go here
                          //CanvasWidget()
                        ],
                      ),
                    ),
                  ),
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
                          print("Apply zoom in functionality");
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
                          print("Apply zoom out functionality");
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
                CustomAppBar(),
                Positioned(
                  bottom: 0,
                  child: customSearchBar(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customSearchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
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
                        print("Restart from the beginning");
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
                        print("Show favorites/saved rooms");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),

          //Search Bar
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 2),
                    blurRadius: 3,
                    color: Colors.grey,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      onTap: () {
                        //TODO: show list of rooms
                        print("Pop up a list of rooms");
                      },
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: "Find your class",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      //TODO: function to search onSubmitted()
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
