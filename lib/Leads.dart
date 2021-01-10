import 'package:flutter/material.dart';
import './Object.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Add object Popup/add_lead.dart';

class Leads extends StatefulWidget {
  @override
  _LeadsState createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  Future<List<Lead>> _getLeads() async {
    var data = await http.get(
        "http://vishalprabhu.infinityfreeapp.com/CRM_demo/getLeadsData.php");
    var jsonData = json.decode(data.body);
    List<Lead> leads = [];
    leads = jsonData.map<Lead>((lead) => Lead.fromJson(lead)).toList();
    return leads;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leads",
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
                          insetPadding: EdgeInsets.only(left: 20, right: 20),
                          elevation: 10.0,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.88,
                            child: AddLeadAction(
                                callbacklead: () => setState(() {
                                      _getLeads();
                                    })),
                          ),
                        ),
                      );
                    });
              }),
          IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                setState(() {
                  _getLeads();
                });
              })
        ],
      ),
      body: FutureBuilder(
          future: _getLeads(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          child: Text(snapshot.data[index].name[0]),
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Row(
                          children: [
                            Text(
                              snapshot.data[index].leadSource,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(" - "),
                            Text(snapshot.data[index].email),
                          ],
                        ),
                        children: [
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  labelValue(
                                      labelValue(
                                          leadLabels("Title"),
                                          leadValues(
                                              snapshot.data[index].title),
                                          0.0),
                                      labelValue(
                                          leadLabels("Phone"),
                                          leadValues(
                                              snapshot.data[index].phone),
                                          0.0),
                                      8.0),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  labelValue(
                                      labelValue(
                                          leadLabels("Department"),
                                          leadValues(
                                              snapshot.data[index].department),
                                          0.0),
                                      labelValue(
                                        leadLabels("Created Date"),
                                        leadValues(
                                            snapshot.data[index].createdDate),
                                        0.0,
                                      ),
                                      8.0),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    labelValue(
                                        labelValue(
                                            leadLabels("Company"),
                                            leadValues(
                                                snapshot.data[index].company),
                                            0.0),
                                        labelValue(
                                            leadLabels("Alternative phone"),
                                            leadValues(
                                                snapshot.data[index].altPhone),
                                            0.0),
                                        8.0),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    labelValue(
                                        labelValue(
                                            leadLabels("Timezone"),
                                            leadValues(
                                                snapshot.data[index].timeZone),
                                            0.0),
                                        labelValue(
                                          leadLabels("Last Contacted"),
                                          leadValues(snapshot
                                                      .data[index]
                                                      .lastContactedDate
                                                      .length <
                                                  1
                                              ? " - "
                                              : snapshot.data[index]
                                                  .lastContactedDate),
                                          0.0,
                                        ),
                                        8.0),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                  ])
                            ],
                          ))
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget labelValue(Widget value1, Widget value2, double height1) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      value1,
      SizedBox(
        height: height1,
      ),
      value2
    ],
  );
}

Widget leadLabels(String values) {
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

Widget leadValues(String values) {
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
