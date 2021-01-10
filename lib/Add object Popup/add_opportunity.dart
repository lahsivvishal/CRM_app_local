import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widgets/Textfields.dart';
import '../Opportunity.dart';
import 'package:intl/intl.dart';

class AddOpportunityAction extends StatefulWidget {
  final VoidCallback callbackopportunity;
  const AddOpportunityAction({@required this.callbackopportunity});

  @override
  _AddOpportunityActionState createState() => _AddOpportunityActionState();
}

class _AddOpportunityActionState extends State<AddOpportunityAction> {
  DateTime selectedDate;
  DateTime closeDate;
  DateTime now = DateTime.now();

  void initState() {
    super.initState();
    closeDate = DateTime.now();
    selectedDate = closeDate.add(Duration(days: 30));
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  TextEditingController oppoName = new TextEditingController();
  TextEditingController oppoCompany = new TextEditingController();
  TextEditingController oppoStage = new TextEditingController();
  TextEditingController oppoCloseDate = new TextEditingController();
  TextEditingController oppoValue = new TextEditingController();
  TextEditingController oppoCreatedDate = new TextEditingController();
  TextEditingController oppoDescription = new TextEditingController();

  void addData() {
    String opponame = oppoName.text.toString();
    String oppocompany = oppoCompany.text.toString();
    String oppostage = oppoStage.text.toString();
    String oppovalue = oppoValue.text.toString();
    String oppocreateddate = DateFormat('yyyy-MM-dd').format(now);
    String oppodescription = oppoDescription.text.toString();

    var url =
        "http://vishalprabhu.infinityfreeapp.com/CRM_demo/addOpportunityData.php";
    http.post(url, body: {
      "name": opponame,
      "company": oppocompany,
      "stage": oppostage,
      "closeDate": selectedDate.toString(),
      "value": oppovalue,
      "createdDate": oppocreateddate,
      "Description": oppodescription,
    });
  }

  void clearFields() {
    oppoName.clear();
    oppoCompany.clear();
    oppoStage.clear();
    oppoCloseDate.clear();
    oppoValue.clear();
    oppoCreatedDate.clear();
    oppoDescription.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Opportunity"),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Flexible(
                child: Textfields(
                    "Opportunity Name", "Opportunity Name", 10, oppoName)),
            Flexible(
                child: Textfields(
                    "Company Name", "Company Name", 10, oppoCompany)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Flexible(
                    child: Textfields("Enter Source", "Source", 10, oppoStage)),
                Flexible(
                  child: Container(
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 0,
                        ),
                        Text("${selectedDate.toLocal()}".split(' ')[0]),
                        IconButton(
                          icon: Icon(Icons.calendar_today, color: Colors.blue),
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            Flexible(
                child: Textfields("Value in dollars", "Value", 10, oppoValue)),
            Flexible(
                child: Textfields(
                    "Enter Description", "Description", 10, oppoDescription)),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(builder: (BuildContext context) {
                    return Container(
                        child: MaterialButton(
                      child: Text("Save"),
                      color: Colors.blue,
                      onPressed: () {
                        if (oppoName != null) {
                          addData();
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "${oppoName.text} added successfully!")));
                        }
                        widget.callbackopportunity();
                        clearFields();
                      },
                    ));
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                      child: Text("cancel"),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                        widget.callbackopportunity();
                      }),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
