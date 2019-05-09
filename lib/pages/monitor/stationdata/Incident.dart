import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_picker/flutter_picker.dart';

class Incident extends StatefulWidget {
  _IncidentState createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {
  String begin,end;

  List incident = [
    {'day': '当天监测数据正常，无预警',  'status': '正常',},
    {'day': '氨气浓度21.123mg/m3，高报状态', 'status': '氨气浓度上升',},
    {'day': '当天监测数据正常，无预警',  'status': '正常',},
    {'day': '当天监测数据正常，无预警',  'status': '正常',},
    {'day': '当天监测数据正常，无预警',  'status': '正常',},
    {'day': '当天监测数据正常，无预警',  'status': '正常',},
    {'day': '当天监测数据正常，无预警',  'status': '正常',},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
      children: <Widget>[
        new Container(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 10.0),
          height: 40.0,
          child: new OutlineButton(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                begin==null ? new Text('请选择时间') :new Text('${begin}至${end}'),
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Icon(Icons.date_range, size: 16,color: Color(0XFF585858)),
                )
              ],
            ),
            onPressed: (){showPickerDateRange(context);}
          ),
        ),
        // 内容
        incidentWidget(context),
      ]
    );
  }

  Widget incidentWidget(BuildContext context) {
    List<Widget> tiles = [];
    Widget content;
    for (var item in this.incident) {
      var mWidget = new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 左侧图标
                item['status'] == '正常' ? 
                new Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: new ClipOval(
                    child: new Container(
                      width: 22.0,
                      height: 22.0,
                      color:Color(0XFF52C41A),
                      child: new Center(
                        child: new Text('-', style: TextStyle(color:Colors.white),),
                      ),
                    )
                  ),
                ) : new Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: new ClipOval(
                    child: new Container(
                      width: 22.0,
                      height: 22.0,
                      color:Color(0XFFE94A3D),
                      child: new Center(
                        child: new Text('!', style: TextStyle(color:Colors.white),),
                      ),
                    )
                  ),
                ),
                // 右侧内容
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '${item['day']}', 
                      style: TextStyle(color: Color(0XFF222222), fontSize: 16.0, fontWeight: FontWeight.w400),
                    ),
                    // 浓度
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text.rich(
                            TextSpan(text: '异常浓度：',
                              style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                              children: <TextSpan>[
                                TextSpan(text: '9.789mg/m³', style: TextStyle(fontSize:13.0, color: Color(0XFF585858), fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text.rich(
                              TextSpan(text: '最高浓度：',
                                style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                                children: <TextSpan>[
                                  TextSpan(text: '29.789mg/m³', style: TextStyle(fontSize:13.0, color: Color(0XFF585858), fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // 时间
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text.rich(
                          TextSpan(text: '发现时间：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                            children: <TextSpan>[
                              TextSpan(text: '03-20 09:50', style: TextStyle(fontSize:13.0, color: Color(0XFF585858), fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text.rich(
                            TextSpan(text: '结束时间：',
                              style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                              children: <TextSpan>[
                                TextSpan(text: '03-20 10:20', style: TextStyle(fontSize:13.0, color: Color(0XFF585858), fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // 报告结果
                    new Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            '报告结果：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFF999999))
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width - 110.0,
                            child: new Text(
                              '广州市某某制造有限公司9点50分氨气出现轻微泄露，10点20分完成修复，过程持续30分钟。',
                              maxLines: 3, 
                              softWrap: true,
                              overflow: TextOverflow.ellipsis, 
                              textAlign: TextAlign.left, 
                              style: TextStyle(fontSize:13.0, color: Color(0XFF999999))
                            ),
                          )
                        ],
                      )
                    ),
                    // 人员
                    new Container(
                      width: MediaQuery.of(context).size.width - 52.0,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.perm_identity, size: 12.0, color: Color(0XFF585858),),
                              new Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: new Text('李员工', style: TextStyle(fontSize:12.0, color: Color(0XFF585858)),),
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.perm_contact_calendar, size: 12.0, color: Color(0XFF585858),),
                              new Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: new Text('J181026', style: TextStyle(fontSize:12.0, color: Color(0XFF585858)),),
                              )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.access_time, size: 12.0, color: Color(0XFF585858),),
                              new Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: new Text('2019-03-11 11:11', style: TextStyle(fontSize:12.0, color: Color(0XFF585858)),),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            new Divider(),
          ],
        )
      );
      tiles.add(mWidget);
    }
    content = new Column(
      children: tiles
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