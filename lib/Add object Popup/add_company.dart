import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widgets/Textfields.dart';

class AddCompanyAction extends StatefulWidget {
  final VoidCallback callbackcomp;

  const AddCompanyAction({@required this.callbackcomp});
  @override
  _AddCompanyActionState createState() => _AddCompanyActionState();
}

class _AddCompanyActionState extends State<AddCompanyAction> {
  TextEditingController compName = new TextEditingController();
  TextEditingController compAddress1 = new TextEditingController();
  TextEditingController compAddress2 = new TextEditingController();
  TextEditingController compCity = new TextEditingController();
  TextEditingController compState = new TextEditingController();
  TextEditingController compCountry = new TextEditingController();
  TextEditingController compZipcode = new TextEditingController();
  TextEditingController compPhone = new TextEditingController();
  TextEditingController compTimezone = new TextEditingController();
  TextEditingController compTags = new TextEditingController();

  void addData() {
    String compname = compName.text.toString();
    String compaddress1 = compAddress1.text.toString();
    String compaddress2 = compAddress2.text.toString();
    String compcity = compCity.text.toString();
    String compstate = compState.text.toString();
    String compcountry = compCountry.text.toString();
    String compzipcode = compZipcode.text.toString();
    String compphone = compPhone.text.toString();
    String comptimezone = compTimezone.text.toString();
    String comptags = compTags.text.toString();

    var url =
        "http://vishalprabhu.infinityfreeapp.com/CRM_demo/addCompanyData.php";
    http.post(url, body: {
      "name": compname,
      "address": "$compaddress1" + " " + "$compaddress2",
      "opportunities": "5",
      "pipelineRevenue": "50000",
      "revenueAchieved": "4500",
      "city": compcity,
      "state": compstate,
      "country": compcountry,
      "zipcode": compzipcode,
      "phone": compphone,
      "timezone": comptimezone,
      "tags": comptags,
    });
  }

  void clearFields() {
    compName.clear();
    compAddress1.clear();
    compAddress2.clear();
    compCity.clear();
    compState.clear();
    compCountry.clear();
    compZipcode.clear();
    compPhone.clear();
    compTimezone.clear();
    compTags.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Add a new company'),
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
          Flexible(
              child: Textfields(
                  "Enter a Company name", "Company Name", 10.0, compName)),
          Flexible(
              child: Textfields(
                  "No / Street / Lane", "Address line 1", 10.0, compAddress1)),
          Flexible(
              child: Textfields("Area / State / Country", "Address line 2",
                  10.0, compAddress2)),
          Row(children: [
            Flexible(
                child: Textfields("Enter City name", "City", 0.0, compCity)),
            Flexible(
                child:
                    Textfields("Enter State number", "State", 10.0, compState))
          ]),
          Row(children: [
            Flexible(
                child: Textfields(
                    "Enter Country name", "Country", 0.0, compCountry)),
            Flexible(
                child:
                    Textfields("Enter Zipcode", "Zipcode", 10.0, compZipcode)),
          ]),
          Flexible(
              child: Textfields("Enter Company's Phone number", "Phone Number",
                  10.0, compPhone)),
          Flexible(
              child:
                  Textfields("Enter Timezone", "Timezone", 10.0, compTimezone)),
          Container(
            child: Text(""),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Builder(
                  builder: (context) {
                    return Container(
                        child: MaterialButton(
                      child: Text("Save"),
                      onPressed: () {
                        var cc = compName.text;
                        if (cc != "") {
                          addData();
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Company $cc is added'),
                          ));
                        }
                        clearFields();
                        widget.callbackcomp();
                      },
                      color: Colors.blue,
                    ));
                  },
                ),
                SizedBox(width: 10),
                MaterialButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop(context);
                    widget.callbackcomp();
                  },
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
