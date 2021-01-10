import 'package:flutter/material.dart';
import '../Object.dart';

class CompanyDetails extends StatefulWidget {
  final Company company;
  CompanyDetails({this.company});

  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  Company company;
  int index;
  void initState() {
    company = widget.company;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: Container(
        child: CircleAvatar(
          radius: 40.0,
          child: Text(company.name[0],
              style: TextStyle(
                fontSize: 40.0,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
