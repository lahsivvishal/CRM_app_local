import 'package:flutter/material.dart';
import './Dashboard.dart';
import './Leads.dart';
import './Contacts.dart';
import './Opportunity.dart';
import './Companies.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class ObjectsPages extends StatefulWidget {
  @override
  _ObjectsPagesState createState() => _ObjectsPagesState();
}

class _ObjectsPagesState extends State<ObjectsPages> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int _selectedPage;

  void initState() {
    super.initState();
    _selectedPage = 0;
  }

  List _pageOptions = [
    Dashboard(),
    Leads(),
    Contacts(),
    Opportunities(),
    Companies()
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double screenHeight;
  double screenWidth;
  final Duration drtn = const Duration(milliseconds: 10);

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: isDrawerOpen ? 0.15 * screenHeight : 0,
      bottom: isDrawerOpen ? 0.1 * screenHeight : 0,
      left: isDrawerOpen ? -0.60 * screenWidth : 0,
      right: isDrawerOpen ? 0.55 * screenWidth : 0,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                  title: Image.asset(
                    'assets/intelliCRM.png',
                    width: 220,
                    alignment: Alignment.centerLeft,
                  ),
                  backgroundColor: Colors.white,
                  bottomOpacity: 0,
                  elevation: 5.0,
                  actions: <Widget>[
                    isDrawerOpen
                        ? IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                isDrawerOpen = false;
                              });
                            })
                        : IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                isDrawerOpen = true;
                              });
                            }),
                  ]),
              body: _pageOptions[_selectedPage],
              bottomNavigationBar: BubbleBottomBar(
                opacity: 0.99,
                backgroundColor: Colors.blue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                currentIndex: _selectedPage,
                hasInk: true,
                inkColor: Colors.white,
                hasNotch: true,
                onTap: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                items: <BubbleBottomBarItem>[
                  BubbleBottomBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.dashboard, color: Colors.white),
                    activeIcon: Icon(Icons.dashboard, color: Colors.orange),
                    title: Text(
                      'Dashboard',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.alarm, color: Colors.white),
                    activeIcon: Icon(Icons.alarm, color: Colors.orange),
                    title: Text(
                      'Leads',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.contacts, color: Colors.white),
                    activeIcon: Icon(Icons.contacts, color: Colors.orange),
                    title: Text(
                      'Contacts',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.work, color: Colors.white),
                    activeIcon: Icon(Icons.work, color: Colors.orange),
                    title: Text('Opportunities',
                        style: TextStyle(color: Colors.blue)),
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.business, color: Colors.white),
                    activeIcon: Icon(Icons.business, color: Colors.orange),
                    title: Text(
                      'Companies',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ))),
    );
  }
}
