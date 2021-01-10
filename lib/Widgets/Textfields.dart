import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final String hint;
  final String label;
  final double rightVal;
  final TextEditingController controllerName;

  const Textfields(this.hint, this.label, this.rightVal, this.controllerName);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, top: 20.0, right: rightVal),
      height: 50,
      child: TextField(
          controller: controllerName,
          style: TextStyle(fontSize: 15.0),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.2)),
            hintText: hint,
            labelText: label,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1.2)),
          )),
    );
  }
}
