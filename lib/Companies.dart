import 'package:flutter/material.dart';
import './Object.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Detail_Pages/Company_details.dart';
import './Add object Popup/add_company.dart';

class Companies extends StatefulWidget {
  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  Future<List<Company>> _getCompanies() async {
    var data = await http.get("http://vishalprabhu.infinityfreeapp.com/CRM_demo/getCompanyData.php");
    var jsonData = json.decode(data.body);
    List<Company> companies = [];
    companies =
        jsonData.map<Company>((company) => Company.fromJson(company)).toList();
    return companies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Companies",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            Row(
              children: [
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
                                    EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: AddCompanyAction(
                                      callbackcomp: () => setState(() {
                                            _getCompanies();
                                          })),
                                ),
                              ),
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
                      _getCompanies();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        body: FutureBuilder(
            future: _getCompanies(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                          child: ExpansionTile(
                            leading: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CompanyDetails(
                                            company: snapshot.data[index])));
                              },
                              child: CircleAvatar(
                                  radius: 20.0,
                                  child: Text(snapshot.data[index].name[0])),
                            ),
                            title: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CompanyDetails(
                                          company: snapshot.data[index])),
                                );
                              },
                              child: Text(snapshot.data[index].name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ),
                            subtitle: Flexible(
                              child: Text(
                                snapshot.data[index].address,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            children: <Widget>[
                              Container(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              companyLabels("Phone Number"),
                                              companyValues(
                                                  snapshot.data[index].phone)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              companyLabels("Pipeline Revenue"),
                                              companyValues(snapshot
                                                  .data[index].pipelineRevenue)
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                companyLabels("Opportunities"),
                                                companyValues(snapshot
                                                    .data[index].opportunities)
                                              ]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                companyLabels(
                                                    "Revenue Achieved"),
                                                companyValues(snapshot
                                                    .data[index]
                                                    .revenueAchieved)
                                              ])
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ))
                            ],
                          ));
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Widget companyLabels(String values) {
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

  Widget companyValues(String values) {
    return Row(
      children: <Widget>[
        Text(
          values.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
          width: 0.0,
        ),
      ],
    );
  }
}
