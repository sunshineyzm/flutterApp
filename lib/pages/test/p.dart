import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class StationReport extends StatefulWidget {
  _StationReport createState() => _StationReport();
}

class _StationReport extends State<StationReport> {

  var value;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text('巡检位置：'),
                new Container(
                  width: 150.0,
                  height: 30.0,
                  child: OutlineDropdownButton(
                    inputDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text("正常"),
                        value: "正常",
                      ),
                      DropdownMenuItem(
                        child: Text("断电"),
                        value: "断电",
                      ),
                    ],
                    hint: Text("设备状态"),
                    value: value,
                    onChanged: (T) {
                      setState(() {
                          value=T;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30.0,
                    elevation: 10,
                    style: new TextStyle(
                      color: Colors.blue
                    ),
                  ),
                ),
              ]
            ),
            // 时间选择器
            new Row(
              children: <Widget>[
                new Text('巡检时间：'),
                RaisedButton(
                  child: Text('选择日期'),
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: new DateTime.now(),
                        firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
                        lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
                    ).then((DateTime val) {
                        print(val);   // 2018-07-12 00:00:00.000
                    }).catchError((err) {
                        print(err);
                    });
                  }
                ),
                RaisedButton(
                  child: Text('选择时间'),
                  onPressed: () {
                      showTimePicker(
                          context: context,
                          initialTime: new TimeOfDay.now(),
                      ).then((val) {
                          print(val);
                      }).catchError((err) {
                          print(err);
                      });
                  },
                ),
              ]
            )
          ]
        ),
      )
    );
  }
  
}