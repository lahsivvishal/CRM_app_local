import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            iconText(Icons.email, "Email Templates"),
            SizedBox(height: 15),
            iconText(Icons.call, "Call Settings"),
            SizedBox(height: 15),
            iconText(Icons.settings, "General Settings"),
            SizedBox(height: 15),
            iconText(Icons.support, "Help"),
          ],
        ),
      ],
    );
  }
}

Widget iconText(icon, text) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.orange[600],
      ),
      SizedBox(width: 10),
      Text(
        text,
        style: TextStyle(fontSize: 20),
      )
    ],
  );
}
