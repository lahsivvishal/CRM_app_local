import 'package:flutter/material.dart';
import '../Object.dart';

class LeadCardStyle extends ListTile {
  final Lead lead;
  LeadCardStyle({this.lead})
      : super(
            title: Text(lead.name),
            subtitle: Text(lead.leadSource),
            leading: CircleAvatar(child: Text(lead.name[0])));
}
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
//       child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 lead.name,
//                 style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
//               ),
//               SizedBox(height: 6.0),
//               Text(
//                 lead.source,
//                 style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
//               )
//             ],
//           )),
//     );
//   }
// }
