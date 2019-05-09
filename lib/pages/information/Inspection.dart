import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:date_format/date_format.dart';
import 'package:scet_warn/routers/Application.dart';

class Inspection extends StatefulWidget {
  _InspectionState createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {
  String barcode = "";
  List station = [
    {'name': '南沙-沙螺湾子站-A监测点', 'address': '广州市某某制造有限公司B区14号机房', 'status': '正常',},
    {'name': '南沙-沙螺湾子站-F监测点', 'address': '广州市某某制造有限公司A区13号机房', 'status': 'N6000-5 VOC在线分析仪停用状态，已上报',},
    {'name': '南沙-龙沙子站-A监测点', 'address': '广州市某某制造有限公司A区13号机房', 'status': '正常',},
  ];

  String monitorPoint; 

  String begin,end;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new ListView(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Expanded(
                child: new Container(
                  height: 46.0,
                  child: new RaisedButton.icon(
                    color: Color(0XFF3B90F4),
                    onPressed: (){ Application.router.navigateTo(context, '/infoCenter/inspectionForm'); },
                    icon: new Icon(Icons.send, color: Colors.white,),
                    label: new Text('发布巡检信息', style: new TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              new Container(
                height:46.0,
                width: 54.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: new RaisedButton(
                  padding: const EdgeInsets.all(0.0),
                  color: Color(0xFF8268F0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.camera_alt, color: Colors.white,size: 20.0,),
                      new Text('快速查询', style: new TextStyle(color: Colors.white, fontSize: 12.0),)
                    ],
                  ),
                  onPressed: scan,
                ),
              )
            ],
          ),
          // 监测站点
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text('站点筛选：'),
                new Expanded(
                  child: new Container(
                    height: 30.0,
                    child: OutlineDropdownButton(
                      inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text("南沙-沙螺湾子站-A监测点", textAlign: TextAlign.center,),
                          value: "南沙-沙螺湾子站-A监测点",
                        ),
                        DropdownMenuItem(
                          child: Text("南沙-龙沙子站-B监测点", textAlign: TextAlign.center,),
                          value: "南沙-龙沙子站-B监测点",
                        ),
                      ],
                      hint: Text("请选取查看站点"),
                      value: monitorPoint,
                      onChanged: (T) {
                        setState(() {
                            monitorPoint=T;
                        });
                      },
                      isExpanded: true,
                      iconSize: 30.0,
                      elevation: 10,
                      style: new TextStyle(
                        color: Color(0XFF585858),
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          // 巡检时间
          new Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  child:new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text('巡检时间：'),
                      new Expanded(
                        child: new Container(
                          height: 30.0,
                          child: OutlineButton(
                            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
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
                    color: Color(0xFFFF8436),
                    child: new Text('查询', style: TextStyle(color: Color(0XFFFFFFFF)),),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          monitorWidget(context),
        ],
      )
    );
  }

  Widget monitorWidget(BuildContext context) {
    List<Widget> tiles = [];
    Widget content;
    for (var item in this.station) {
     var stationWidget = new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Divider(),
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
                      child: new Text('✓', style: TextStyle(color:Colors.white),),
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
                    '${item['name']}', 
                    style: TextStyle(color: Color(0XFF222222), fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  // 监测地点
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: new Text.rich(
                      TextSpan(text: '监测地点：',
                        style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                        children: <TextSpan>[
                          TextSpan(text: '${item['address']}', style: TextStyle(fontSize:13.0, color: Color(0XFF585858), fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                  // 巡检描述
                  Text.rich(
                    TextSpan(text: '监测站点：',
                      style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                      children: <TextSpan>[
                        TextSpan(text: '${item['status']}', style: TextStyle(fontSize:13.0, color: Color(0XFF585858), fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  // 时间
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
        ],
      )
    );
    tiles.add(stationWidget);
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

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        _showMessage('你扫描的结果是：' + this.barcode);
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this.barcode = '用户没有授予相机权限!';
        });
      } else {
        setState(() {
          return this.barcode = '未知错误: $e';
        });
      }
    } on FormatException{
      setState(() => this.barcode = 'null => (用户在扫描任何东西之前使用“back”按钮返回。)');
    } catch (e) {
      setState(() => this.barcode = '未知错误: $e');
    }
  }

  _showMessage(String name) {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
        content: new Text(name),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('确定')
          ),
        ]
      )
    );
  }

}