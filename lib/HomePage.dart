import 'package:ado_project_2/CustomWidgets/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'constants.dart';

/*
Resource for bottom search bar: https://www.shauryalabs.com/blog/flutter-tutorial-2/
 */

/*
This file has hundreds of lines of code because in order to create the user interface of the app,
I need Widgets that are dependent on the variables of this file. These widgets are separated into its
own function within the class, so that it will still be able to access the class variables.
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

  @override
  Widget build(BuildContext context) {
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
                      top: 130, //to leave space for the appbar
                    ),
                    child: InteractiveViewer(
                      //Enables the image to scale
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

                //Custom app bar
                CustomAppBar(),

                //Zoom buttons
                Positioned(
                  right: 20,
                  top: 150,
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

                //Custom search bar
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

  void scrollableSearchBar(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              maxChildSize: .50,
              minChildSize: .30,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 2),
                        blurRadius: 3,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 30,
                              ),
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
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: searchBarController,
                                      decoration: InputDecoration(
                                        hintText: "Find your class",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _tempListOfRooms =
                                                _buildSearchList(value);
                                          },
                                        );
                                      },
                                      onSubmitted: (String value) {
                                        //TODO: function to search onSubmitted()
                                        Navigator.pop(context);
                                      },
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
                      Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          itemCount: (_tempListOfRooms != null &&
                                  _tempListOfRooms.length > 0)
                              ? _tempListOfRooms.length
                              : _listOfRooms.length,
                          separatorBuilder: (context, int) {
                            return Divider(
                              color: kLightGreen,
                            );
                          },
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: (_tempListOfRooms != null &&
                                      _tempListOfRooms.length > 0)
                                  ? _showBottomSheetWithSearch(
                                      index, _tempListOfRooms)
                                  : _showBottomSheetWithSearch(
                                      index, _listOfRooms),
                              onTap: () {
                                searchBarController.text =
                                    (_tempListOfRooms != null &&
                                            _tempListOfRooms.length > 0)
                                        ? _tempListOfRooms[index]
                                        : _listOfRooms[index];

                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _showBottomSheetWithSearch(int index, List<String> listOfCities) {
    return Text(listOfCities[index],
        style: TextStyle(color: Colors.black, fontSize: 16),
        textAlign: TextAlign.center);
  }

  List<String> _buildSearchList(String userSearchTerm) {
    List<String> _searchList = List();

    for (int i = 0; i < _listOfRooms.length; i++) {
      String name = _listOfRooms[i];
      if (name.toLowerCase().contains(userSearchTerm.toLowerCase())) {
        _searchList.add(_listOfRooms[i]);
      }
    }
    return _searchList;
  }

  Widget customSearchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(20),
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
            child: GestureDetector(
              onTap: () {
                //TODO: show list of rooms
                scrollableSearchBar(context);
              },
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
                        controller: searchBarController,
                        onTap: () {
                          scrollableSearchBar(context);
                        },
                        // onChanged: (String value) {
                        //   //TODO: show list of rooms
                        //   scrollableSearchBar(context);
                        // },
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
          ),
        ],
      ),
    );
  }
}
