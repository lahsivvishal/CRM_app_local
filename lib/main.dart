import 'package:flutter/material.dart';
import './MenuPage.dart';
import './mainBody.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Georgia',
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.white),
      home: Material(
        child: Container(
          color: Colors.white,
          child: Stack(children: [
            MenuPage(),
            ObjectsPages(),
          ]),
        ),
      ),
    );
  }
}
