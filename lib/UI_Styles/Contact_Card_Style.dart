import 'package:flutter/material.dart';
import '../Object.dart';

class ContactCardStyle extends StatelessWidget {
  final Contact contact;
  ContactCardStyle({this.contact});

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
                contact.name,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
              ),
              SizedBox(height: 6.0),
              Text(
                contact.company,
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              )
            ],
          )),
    );
  }
}
