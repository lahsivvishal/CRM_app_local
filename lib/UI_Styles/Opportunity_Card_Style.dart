import 'package:flutter/material.dart';
import '../Object.dart';

class OpportunityCardStyle extends StatelessWidget {
  final Opportunity opportunity;
  OpportunityCardStyle({this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                opportunity.name,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
              ),
              SizedBox(height: 6.0),
              Text(
                opportunity.company,
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              )
            ],
          )),
    );
  }
}
