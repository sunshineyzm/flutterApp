import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:date_format/date_format.dart';

class History extends StatefulWidget {

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  String begin,end;

  var bgColor;

  List history = [
    {'stationName': '南沙-建滔子站', 'monName': '氨气', 'status': '警告', 'level': 3},
    {'stationName': '南沙-龙沙子站', 'monName': '氨气', 'status': '注意', 'level': 2},
    {'stationName': '南沙-中心子站', 'monName': '氨气', 'status': '异常', 'level': 1},
    {'stationName': '南沙-建滔子站', 'monName': '氨气', 'status': '警告', 'level': 3},
    {'stationName': '南沙-建滔子站', 'monName': '氨气', 'status': '警告', 'level': 3},
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Expanded(
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text('查询时间：'),
                    new Expanded(
                      child: new Container(
                        height: 30.0,
                        child: OutlineButton(
                          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          textColor: Color(0XFF000000),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              begin==null ? new Text('请选择时间', style: TextStyle(fontSize: 13.0, color: Color(0XFF585858))) :new Text('${begin}至${end}', style: TextStyle(fontSize: 13.0,color: Color(0XFF585858))),
                              new Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: new Icon(Icons.date_range, size: 16,color: Color(0XFF585858)),
                              )
                            ],
                          ),
                          onPressed: () {
                            showPickerDateRange(context);
                          },
                        ),
                      ),
                    )
                  ],
                )
              ),
              new Container(
                height:30.0,
                width: 60.0,
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: new RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  color: Color(0XFF2089F6),
                  child: new Text('查询', style: TextStyle(color: Color(0XFFFFFFFF)),),
                  onPressed: () {},
                ),
              )
            ],
          ),
          historyWidget(context),
        ],
      ),
    );
  }

  void colorSelect(int level) {
    switch(level) {
      case 1: bgColor = [Color(0XFF1A83FC), Color(0XFF02CDEF)];break; 
      case 2: bgColor = [Color(0XFFF6C12D), Color(0XFFEBD510)];break; 
      case 3: bgColor = [Color(0XFFFF8235), Color(0XFFFDA83E)];break; 
    }
  }

  Widget historyWidget(BuildContext content) {
    List<Widget> tiles = [];
    Widget content;
    for (var item in history) {
      colorSelect(item['level']);
      var warnWidget = new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: new Text('2019-03-19', style: TextStyle(fontSize: 12.0, color: Color(0XFF707070)),),
          ),
          new InkWell(
            onTap: (){ print('历史'); },
            child: new Card(
              elevation: 5.0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),  //设置圆角
              child: new Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(new Radius.circular(8.0)),
                  gradient: LinearGradient(
                    colors: bgColor, 
                    begin: FractionalOffset(0, 1), 
                    end: FractionalOffset(1, 0)
                  ),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text('${item['monName']}',style: new TextStyle(color: Colors.white,)),
                            new Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: new Text('${item['stationName']}',style: new TextStyle(color: Colors.white,)),
                            )
                          ],
                        ),
                        new Text('${item['status']}',style: new TextStyle(color: Colors.white,)),
                      ],
                    ),
                    new Divider(color: Colors.white), 
                    // 浓度
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          flex: 1,
                          child:Text.rich(
                            TextSpan(text: '初始浓度：',
                              style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                              children: <TextSpan>[
                                TextSpan(text: '12.789mg/m³', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                        new Expanded(
                          flex: 1,
                          child: Text.rich(
                            TextSpan(text: '最高浓度：',
                              style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                              children: <TextSpan>[
                                TextSpan(text: '20.351mg/m³', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                      ]
                    ),
                    // 时间
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            flex: 1,
                            child: Text.rich(
                              TextSpan(text: '开始时间：',
                                style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                                children: <TextSpan>[
                                  TextSpan(text: '03-21 14:28', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                          ),
                          new Expanded(
                            flex: 1,
                            child: Text.rich(
                              TextSpan(text: '结束时间：',
                                style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                                children: <TextSpan>[
                                  TextSpan(text: '03-21 15:00', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text.rich(
                          TextSpan(text: '风向：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                            children: <TextSpan>[
                              TextSpan(text: '东南风', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(text: '风速：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                            children: <TextSpan>[
                              TextSpan(text: '5m/s', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(text: '温度：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                            children: <TextSpan>[
                              TextSpan(text: '22℃', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(text: '湿度：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFFFFFFFF)),
                            children: <TextSpan>[
                              TextSpan(text: '82%', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ]
                    )
                  ]
                )
              )
            )
          ),
        ],
      );
      tiles.add(warnWidget);
    }
    content = new Column(
      children: tiles,
    );
    return content;
  }

  void showPickerDateRange(BuildContext context) {
    Picker ps = new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(type: PickerDateTimeType.kYMD, isNumberMonth: true),
        onConfirm: (Picker picker, List value) {
          setState(() {
            begin = formatDate(DateTime.parse((picker.adapter as DateTimePickerAdapter).value.toString()), [yyyy,'-',mm,'-',dd]);
          });
        }
    );
    Picker pe = new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(type: PickerDateTimeType.kYMD, isNumberMonth: true),
        onConfirm: (Picker picker, List value) {
          setState(() {
            end = formatDate(DateTime.parse((picker.adapter as DateTimePickerAdapter).value.toString()), [yyyy,'-',mm,'-',dd]);
          });
        }
    );
    List<Widget> actions = [
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: new Text(PickerLocalizations.of(context).cancelText)),
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
          ps.onConfirm(ps, ps.selecteds);
          pe.onConfirm(pe, pe.selecteds);
        },
        child: new Text(PickerLocalizations.of(context).confirmText))
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text("时间区间"),
          actions: actions,
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("开始时间:"),
                ps.makePicker(),
                Text("结束时间:"),
                pe.makePicker()
              ],
            ),
          ),
        );
      }
    );
  }
}