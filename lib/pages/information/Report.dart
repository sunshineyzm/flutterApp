import 'package:flutter/material.dart';


class Report extends StatefulWidget {
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new IconButton(
          onPressed: (){},
          icon: Icon(Icons.report, color: Colors.deepPurpleAccent),
          highlightColor: Colors.red,
          splashColor: Colors.red,
          disabledColor: Colors.blueGrey,
        )
      )
    );
  }
}
