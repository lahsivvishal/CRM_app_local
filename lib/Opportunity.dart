import 'package:CRM_APP/Add%20object%20Popup/add_opportunity.dart';
import 'package:flutter/material.dart';
import './Object.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './Add object Popup/add_opportunity.dart';

class Opportunities extends StatefulWidget {
  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  Future<List<Opportunity>> _getOpportunities() async {
    var data = await http.get(
        "http://vishalprabhu.infinityfreeapp.com/CRM_demo/getOpportunityData.php");
    var jsonData = json.decode(data.body);
    List<Opportunity> opportunities = [];
    opportunities = jsonData
        .map<Opportunity>((opportunity) => Opportunity.fromJson(opportunity))
        .toList();
    return opportunities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Opportunities",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: Dialog(
                              insetPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                child: AddOpportunityAction(
                                    callbackopportunity: () => setState(() {
                                          _getOpportunities();
                                        })),
                              )),
                        );
                      });
                }),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _getOpportunities();
                });
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: _getOpportunities(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.orangeAccent[400],
                          child: Text(
                            snapshot.data[index].name[0].toUpperCase(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        title: Text(snapshot.data[index].name,
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshot.data[index].company),
                            Text(snapshot.data[index].stage)
                          ],
                        ),
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        opportunityLabels("Value"),
                                        opportunityValues(
                                            snapshot.data[index].value)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        opportunityLabels("Created on"),
                                        opportunityValues(
                                            snapshot.data[index].createdDate)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.0)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

Widget opportunityLabels(String values) {
  return Row(children: <Widget>[
    Text(
      values.toString(),
      textAlign: TextAlign.right,
      style: TextStyle(fontFamily: 'Raleway', fontSize: 14.0),
    ),
    SizedBox(
      height: 10.0,
      width: 0.0,
    ),
  ]);
}

Widget opportunityValues(String values) {
  return Row(
    children: <Widget>[
      Text(
        values.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: 'Raleway', fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10.0,
        width: 0.0,
      ),
    ],
  );
}
