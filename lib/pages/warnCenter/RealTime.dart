import 'dart:core';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class RealTime extends StatefulWidget {

  _RealTimeState createState() => _RealTimeState();
}

class _RealTimeState extends State<RealTime> {
  var bgColor, fontColor;

  List warnEvent = [
    {'stationName': '南沙-龙沙子站','monName': '氨气', 'hvalue': '16.654', 'time': '10:08','status': '警告', 'level': 3},
    {'stationName': '南沙-龙沙子站','monName': '氨气', 'hvalue': '12.324', 'time': '13:14','status': '注意', 'level': 2},
    {'stationName': '南沙-龙沙子站','monName': '氨气', 'hvalue': '8.123', 'time': '16:10','status': '异常', 'level': 1},
  ];

  var now = formatDate(DateTime.parse(new DateTime.now().toString()),[yyyy,'-',mm,'-',dd, ' ',HH,':',nn,':',ss]);
  var day = formatDate(DateTime.parse(new DateTime.now().toString()),[yyyy,'-',mm,'-',dd]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          // 现时情况
          new Card(
            elevation: 5.0,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),  //设置圆角
            child: new Container(
              padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 15.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(new Radius.circular(8.0)),
                gradient: LinearGradient(
                  colors: [Color(0XFF3992F5), Color(0XFF8267F0)], 
                  begin: FractionalOffset(0, 1), 
                  end: FractionalOffset(1, 0)
                ),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text('现时暂无异常数据', style: TextStyle(fontSize: 17.0, color: Color(0XFFFFFFFF)),),
                  new Text('${now}', style: TextStyle(fontSize: 12.0, color: Color(0XFFFFFFFF)))
                ],
              ),
            ),
          ),
          // 警情
          warnWidget(context),
        ],
      ),
    );
  }

  void colorSelect(int level) {
    switch(level) {
      case 1: bgColor = [Color(0XFF1A83FC), Color(0XFF02CDEF)];fontColor = Color(0XFF2089F6);;break; 
      case 2: bgColor = [Color(0XFFF6C12D), Color(0XFFEBD510)];fontColor = Color(0XFFFBC41A);break; 
      case 3: bgColor = [Color(0XFFFF8235), Color(0XFFFDA83E)];fontColor = Color(0XFFFF8F38);break; 
    }
  }

  Widget warnWidget(BuildContext context) {
    List<Widget> tiles = [];
    Widget content;
    for (var item in warnEvent) {
      colorSelect(item['level']); //颜色
      var numWidget = new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: new Text('${day}', style: TextStyle(fontSize: 12.0, color: Color(0XFF707070)),),
          ),
          new Card(
            elevation: 5.0,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),  //设置圆角
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0), ),
                    gradient: LinearGradient(
                      colors: bgColor, 
                      begin: FractionalOffset(0, 1), 
                      end: FractionalOffset(1, 0)
                    ),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: <Widget>[
                      new Text('预警物质', style: new TextStyle(color: Colors.white, fontSize:12.0,)),
                      new Text('${item['monName']}', style: new TextStyle(color: Colors.white, fontSize:14.0, fontWeight: FontWeight.w600))
                    ]
                  )
                ),
                new Expanded(
                  child: new Container(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          children: <Widget>[
                            new Text('南沙—龙沙子站', style: new TextStyle(fontSize:14.0, color: Colors.black)),
                            new Text('${item['status']}', style: new TextStyle(fontSize:14.0, color: fontColor))
                          ]
                        ),
                        new Divider(),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          children: <Widget>[
                            new Text.rich(
                              TextSpan(text: '最高浓度：',
                                style: TextStyle(fontSize:10.0),
                                children: <TextSpan>[
                                  TextSpan(text: '${item['hvalue']}mg/m³', style: TextStyle(fontSize:12.0, fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                            new Text.rich(
                              TextSpan(text: '发现时间：',
                                style: TextStyle(fontSize:10.0),
                                children: <TextSpan>[
                                  TextSpan(text: '${item['time']}', style: TextStyle(fontSize:12.0, fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                          ]
                        ),
                      ]
                    )
                  )
                )
              ]
            ),
          ),
        ],
      );
      tiles.add(numWidget);
    }
    content = new Column(
      children: tiles,
    );
    return content;
  }

}