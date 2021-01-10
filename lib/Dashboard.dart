import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  List<Widget> containers = [
    Container(color: Colors.white),
    Container(
      width: 30.0,
      color: Colors.indigo,
    ),
    Container(
      color: Colors.amber[400],
    )
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: Text('Dashboard'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.funnelDollar)),
              Tab(icon: Icon(FontAwesomeIcons.tasks)),
              Tab(icon: Icon(Icons.calendar_today)),
            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
      ),
    );
  }
}
