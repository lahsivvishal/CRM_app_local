import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widgets/Textfields.dart';
import '../Contacts.dart';

class AddContactAction extends StatefulWidget {
  final VoidCallback callbackcontact;
  const AddContactAction({@required this.callbackcontact});

  @override
  _AddContactActionState createState() => _AddContactActionState();
}

class _AddContactActionState extends State<AddContactAction> {
  TextEditingController contFirstName = new TextEditingController();
  TextEditingController contLastName = new TextEditingController();
  TextEditingController contTitle = new TextEditingController();
  TextEditingController contEmail = new TextEditingController();
  TextEditingController contPhone = new TextEditingController();
  TextEditingController contAltPhone = new TextEditingController();
  TextEditingController contCompany = new TextEditingController();
  TextEditingController contAddress1 = new TextEditingController();
  TextEditingController contAddress2 = new TextEditingController();
  TextEditingController contCity = new TextEditingController();
  TextEditingController contState = new TextEditingController();
  TextEditingController contCountry = new TextEditingController();
  TextEditingController contLastContactedDate = new TextEditingController();
  TextEditingController contCreatedDate = new TextEditingController();
  TextEditingController contDescription = new TextEditingController();
  TextEditingController contDepartment = new TextEditingController();
  TextEditingController contTimeZone = new TextEditingController();

  returnFormatedDate<String>() {
    var currentDateFormatted = DateTime.now().toString();
    var parseDate = DateTime.parse(currentDateFormatted);
    var currentdate = "${parseDate.year}-${parseDate.month}-${parseDate.day}";
    return currentdate;
  }

  void addData() {
    String contfirstname = contFirstName.text.toString();
    String contlastname = contLastName.text.toString();
    String conttitle = contTitle.text.toString();
    String contemail = contEmail.text.toString();
    String contphone = contPhone.text.toString();
    String contaltphone = contAltPhone.text.toString();
    String contcompany = contCompany.text.toString();
    String contaddress1 = contAddress1.text.toString();
    String contaddress2 = contAddress2.text.toString();
    String contcity = contCity.text.toString();
    String contstate = contState.text.toString();
    String contcountry = contCountry.text.toString();
    String contlastcontacteddate = contLastContactedDate.text.toString();
    String contcreateddate = returnFormatedDate();
    String contdescription = contDescription.text.toString();
    String contdepartment = contDepartment.text.toString();
    String conttimezone = contTimeZone.text.toString();

    var url =
        "http://vishalprabhu.infinityfreeapp.com/CRM_demo/addContactData.php";
    http.post(url, body: {
      "name": "$contfirstname" + " " + "$contlastname",
      "title": conttitle,
      "email": contemail,
      "phone": contphone,
      "altphone": contaltphone,
      "company": contcompany,
      "address1": contaddress1,
      "address2": contaddress2,
      "city": contcity,
      "state": contstate,
      "country": contcountry,
      "lastcontacteddate": contlastcontacteddate,
      "createddate": contcreateddate,
      "description": contdescription,
      "department": contdepartment,
      "timezone": conttimezone
    });
  }

  void clearFields() {
    contFirstName.clear();
    contLastName.clear();
    contCompany.clear();
    contTitle.clear();
    contDepartment.clear();
    contPhone.clear();
    contAltPhone.clear();
    contEmail.clear();
    contAddress1.clear();
    contAddress2.clear();
    contCity.clear();
    contState.clear();
    contCountry.clear();
    contTimeZone.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Add New Contact"),
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
                    child: Textfields(
                        "Enter First Name", "First Name", 0.0, contFirstName)),
                Flexible(
                    child: Textfields(
                        "Enter Last Name", "Last Name", 10.0, contLastName))
              ],
            ),
            Flexible(
                child: Textfields(
                    "Enter Email address", "Email", 10.0, contEmail)),
            Row(
              children: [
                Flexible(
                    child: Textfields(
                        "Enter Company", "Company Name", 0.0, contCompany)),
                Flexible(
                    child:
                        Textfields("Job Title", "Job Title", 10.0, contTitle)),
              ],
            ),
            Row(children: [
              Flexible(
                  child: Textfields(
                      "Department", "Department", 0.0, contDepartment)),
              Flexible(
                  child:
                      Textfields("Enter City's Name", "City", 10.0, contCity))
            ]),
            Row(children: [
              Flexible(
                  child: Textfields(
                      "Enter Phone Number", "Phone", 0.0, contPhone)),
              Flexible(
                  child: Textfields("Enter Alt Phone Number", "Alt. Phone",
                      10.0, contAltPhone)),
            ]),
            Row(
              children: [
                Flexible(
                    child: Textfields("No / Street / Lane", "Address Line 1",
                        0.0, contAddress1)),
                Flexible(
                    child: Textfields("Area / State / Country",
                        "Address Line 2", 10.0, contAddress2)),
              ],
            ),
            Row(children: [
              Flexible(
                  child: Textfields(
                      "Enter State's Name", "State", 0.0, contState)),
              Flexible(
                  child: Textfields(
                      "Enter Country's Name", "Country", 10.0, contCountry))
            ]),
            Row(
              children: [
                Flexible(
                    child: Textfields(
                        "Enter Timezone", "Timezone", 10.0, contTimeZone)),
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
                            var fn = contFirstName.text;
                            var ln = contLastName.text;
                            if (fn != "" || ln != "") {
                              addData();
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("$fn" +
                                      " " +
                                      "$ln" +
                                      " added successfully!")));
                            }
                            widget.callbackcontact();
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
                        widget.callbackcontact();
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
        ));
  }
}
