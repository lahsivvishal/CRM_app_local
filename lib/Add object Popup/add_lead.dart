import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widgets/Textfields.dart';

class AddLeadAction extends StatefulWidget {
  final VoidCallback callbacklead;
  const AddLeadAction({@required this.callbacklead});

  @override
  _AddLeadActionState createState() => _AddLeadActionState();
}

class _AddLeadActionState extends State<AddLeadAction> {
  TextEditingController leadFirstName = new TextEditingController();
  TextEditingController leadLastName = new TextEditingController();
  TextEditingController leadTitle = new TextEditingController();
  TextEditingController leadEmail = new TextEditingController();
  TextEditingController leadPhone = new TextEditingController();
  TextEditingController leadAltPhone = new TextEditingController();
  TextEditingController leadCompany = new TextEditingController();
  TextEditingController leadLeadSource = new TextEditingController();
  TextEditingController leadAddress1 = new TextEditingController();
  TextEditingController leadAddress2 = new TextEditingController();
  TextEditingController leadCity = new TextEditingController();
  TextEditingController leadState = new TextEditingController();
  TextEditingController leadCountry = new TextEditingController();
  TextEditingController leadLastContactedDate = new TextEditingController();
  TextEditingController leadCreatedDate = new TextEditingController();
  TextEditingController leadDescription = new TextEditingController();
  TextEditingController leadDepartment = new TextEditingController();
  TextEditingController leadTimeZone = new TextEditingController();

  returnFormatedDate<String>() {
    var currentDateFormatted = DateTime.now().toString();
    var parseDate = DateTime.parse(currentDateFormatted);
    var currentdate = "${parseDate.year}-${parseDate.month}-${parseDate.day}";
    return currentdate;
  }

  void addData() {
    String leadfirstname = leadFirstName.text.toString();
    String leadlastname = leadLastName.text.toString();
    String leadtitle = leadTitle.text.toString();
    String leademail = leadEmail.text.toString();
    String leadphone = leadPhone.text.toString();
    String leadaltphone = leadAltPhone.text.toString();
    String leadcompany = leadCompany.text.toString();
    String leadleadsource = "Phone";
    String leadaddress1 = leadAddress1.text.toString();
    String leadaddress2 = leadAddress2.text.toString();
    String leadcity = leadCity.text.toString();
    String leadstate = leadState.text.toString();
    String leadcountry = leadCountry.text.toString();
    String leadlastcontacteddate = leadLastContactedDate.text.toString();
    String leadcreateddate = returnFormatedDate();
    String leaddescription = leadDescription.text.toString();
    String leaddepartment = leadDepartment.text.toString();
    String leadtimezone = leadTimeZone.text.toString();

    var url =
        "http://vishalprabhu.infinityfreeapp.com/CRM_demo/addLeadData.php";
    http.post(url, body: {
      "name": "$leadfirstname" + " " + "$leadlastname",
      "title": leadtitle,
      "email": leademail,
      "phone": leadphone,
      "altPhone": leadaltphone,
      "company": leadcompany,
      "leadSource": leadleadsource,
      "address1": leadaddress1,
      "address2": leadaddress2,
      "city": leadcity,
      "state": leadstate,
      "country": leadcountry,
      "lastContactedDate": leadlastcontacteddate,
      "createdDate": leadcreateddate,
      "description": leaddescription,
      "department": leaddepartment,
      "timeZone": leadtimezone
    });
  }

  void clearFields() {
    leadFirstName.clear();
    leadLastName.clear();
    leadCompany.clear();
    leadTitle.clear();
    leadDepartment.clear();
    leadPhone.clear();
    leadAltPhone.clear();
    leadEmail.clear();
    leadAddress1.clear();
    leadAddress2.clear();
    leadCity.clear();
    leadState.clear();
    leadCountry.clear();
    leadTimeZone.clear();
  }

  List<String> sourceslead = ["Phone", "Website", "Email"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Add New Lead"),
            actions: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  })
            ],
          ),
          body: ListView(
            children: [
              Row(
                children: [
                  Flexible(
                      child: Textfields("Enter First Name", "First Name", 0.0,
                          leadFirstName)),
                  Flexible(
                      child: Textfields(
                          "Enter Last Name", "Last Name", 10.0, leadLastName))
                ],
              ),
              Flexible(
                  child: Textfields(
                      "Enter Email address", "Email", 10.0, leadEmail)),
              Row(
                children: [
                  Flexible(
                      child: Textfields(
                          "Enter Company", "Company Name", 0.0, leadCompany)),
                  Flexible(
                      child: Textfields(
                          "Job Title", "Job Title", 10.0, leadTitle)),
                ],
              ),
              Row(children: [
                Flexible(
                    child: Textfields(
                        "Department", "Department", 0.0, leadDepartment)),
                Flexible(
                    child:
                        Textfields("Enter City's Name", "City", 10.0, leadCity))
              ]),
              Row(children: [
                Flexible(
                    child: Textfields(
                        "Enter Phone Number", "Phone", 0.0, leadPhone)),
                Flexible(
                    child: Textfields("Enter Alt Phone Number", "Alt. Phone",
                        10.0, leadAltPhone)),
              ]),
              Row(
                children: [
                  Flexible(
                      child: Textfields("No / Street / Lane", "Address Line 1",
                          0.0, leadAddress1)),
                  Flexible(
                      child: Textfields("Area / State / Country",
                          "Address Line 2", 10.0, leadAddress2)),
                ],
              ),
              Row(children: [
                Flexible(
                    child: Textfields(
                        "Enter State's Name", "State", 0.0, leadState)),
                Flexible(
                    child: Textfields(
                        "Enter Country's Name", "Country", 10.0, leadCountry))
              ]),
              Row(
                children: [
                  Flexible(
                      child: Textfields(
                          "Enter Timezone", "Timezone", 10.0, leadTimeZone)),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Builder(
                      builder: (context) {
                        return Container(
                          child: MaterialButton(
                            color: Colors.blue,
                            child: Text("Save"),
                            onPressed: () {
                              var fn = leadFirstName.text;
                              var ln = leadLastName.text;
                              if (fn != "" || ln != "") {
                                addData();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("$fn" +
                                        " " +
                                        "$ln" +
                                        " added successfully!")));
                              }
                              clearFields();
                              widget.callbacklead();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    MaterialButton(
                        child: Text("cancel"),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                          widget.callbacklead();
                        }),
                    SizedBox(
                      width: 10.0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          )),
    );
  }
}
