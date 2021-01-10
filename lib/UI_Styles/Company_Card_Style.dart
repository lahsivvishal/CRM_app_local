import 'package:flutter/material.dart';
import '../Object.dart';
import '../Detail_Pages/Company_details.dart';

class CompanyCardStyle extends StatelessWidget {
  final Company company;
  CompanyCardStyle({this.company});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        child: ExpansionTile(
          tilePadding: EdgeInsets.only(left: 10.0, right: 10.0),
          leading: CircleAvatar(radius: 20.0, child: Text(company.name[0])),
          subtitle: Flexible(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CompanyDetails(company: company)),
              );
            },
            child: Text(
              company.address,
              overflow: TextOverflow.ellipsis,
            ),
          )),
          title:
              Text(company.name, style: TextStyle(fontWeight: FontWeight.w600)),
          children: <Widget>[
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      companyLabels('Phone Number'),
                      companyLabels('Opportunities'),
                      companyLabels('Pipeline Revenue'),
                      companyLabels('Revenue Achieved'),
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        companyValues(company.phone.toString()),
                        companyValues(company.opportunities),
                        companyValues(company.pipelineRevenue.toString()),
                        companyValues(company.revenueAchieved.toString())
                      ],
                    ),
                  )
                ]))
          ],
        ));
  }

  Widget companyLabels(String values) {
    return Row(children: <Widget>[
      Text(
        values.toString(),
        textAlign: TextAlign.right,
        style: TextStyle(
            fontFamily: 'Raleway', fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10.0,
        width: 0.0,
      ),
    ]);
  }

  Widget companyValues(String values) {
    return Row(
      children: <Widget>[
        Text(
          values.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(fontFamily: 'Raleway', fontSize: 15.0),
        ),
        SizedBox(
          height: 10.0,
          width: 0.0,
        ),
      ],
    );
  }
}
