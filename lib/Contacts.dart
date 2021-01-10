import 'package:flutter/material.dart';
import './Object.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Add object Popup/add_contact.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  Future<List<Contact>> _getContacts() async {
    var data = await http.get("http://vishalprabhu.infinityfreeapp.com/CRM_demo/getContactsData.php");
    var jsonData = json.decode(data.body);
    List<Contact> contacts = [];
    contacts =
        jsonData.map<Contact>((contact) => Contact.fromJson(contact)).toList();
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
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
                            insetPadding: EdgeInsets.only(left: 15, right: 15),
                            elevation: 10.0,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.88,
                              child: AddContactAction(
                                  callbackcontact: () => setState(() {
                                        _getContacts();
                                      })),
                            ),
                          ),
                        );
                      });
                }),
            IconButton(
                icon: Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: FutureBuilder(
          future: _getContacts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ExpansionTile(
                      title: Text(
                        snapshot.data[index].name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Row(
                        children: [
                          Text(snapshot.data[index].title),
                          Text(" - "),
                          Text(snapshot.data[index].company)
                        ],
                      ),
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      contactLabels("Email"),
                                      contactValues(snapshot.data[index].email)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      contactLabels("Phone"),
                                      contactValues(snapshot.data[index].phone)
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

Widget contactLabels(String values) {
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

Widget contactValues(String values) {
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
