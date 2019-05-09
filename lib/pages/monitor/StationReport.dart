import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:date_format/date_format.dart';

class StationReport extends StatefulWidget {
  _StationReport createState() => _StationReport();
}

class _StationReport extends State<StationReport> {

  String type, equipname, status, accessories;
  String time = '选择时间';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new SingleChildScrollView(
        child: new Container(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text('上报类型：'),
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
                        child: Text("设备维修", textAlign: TextAlign.center,),
                        value: "设备维修",
                      ),
                      DropdownMenuItem(
                        child: Text("设备断电", textAlign: TextAlign.center,),
                        value: "设备断电",
                      ),
                    ],
                    hint: Text("上报类型："),
                    value: type,
                    onChanged: (T) {
                      setState(() {
                          type=T;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30.0,
                    elevation: 10,
                    style: new TextStyle(
                      color: Color(0XFF585858),
                    ),
                  ),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text('上报时间：', style: TextStyle(color: Color(0XFF585858),)),
                  new Container(
                    height: 30.0,
                    child: OutlineButton(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      textColor: Color(0XFF000000),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('$time'),
                          new Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Icon(Icons.date_range, size: 16,),
                          )
                        ],
                      ),
                      onPressed: () {
                        showPickerDateTime24(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            new Divider(),
            // 设备名称
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text('设备名称：'),
                  new Container(
                    width: 240.0,
                    height: 30.0,
                    child: OutlineDropdownButton(
                      inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text("N6000-5 VOC在线分析仪", textAlign: TextAlign.center,),
                          value: "N6000-5 VOC在线分析仪",
                        ),
                        DropdownMenuItem(
                          child: Text("N6000-2 VOC在线分析仪", textAlign: TextAlign.center,),
                          value: "N6000-2 VOC在线分析仪",
                        ),
                      ],
                      hint: Text("设备名称"),
                      value: equipname,
                      onChanged: (T) {
                        setState(() {
                            equipname=T;
                        });
                      },
                      isExpanded: true,
                      iconSize: 30.0,
                      elevation: 10,
                      style: new TextStyle(
                        color: Color(0XFF585858),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 设备状态
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text('设备状态：'),
                new Container(
                  width: 150.0,
                  height: 30.0,
                  child: OutlineDropdownButton(
                    inputDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text("停用", textAlign: TextAlign.center,),
                        value: "停用",
                      ),
                      DropdownMenuItem(
                        child: Text("断电", textAlign: TextAlign.center,),
                        value: "断电",
                      ),
                    ],
                    hint: Text("设备状态"),
                    value: status,
                    onChanged: (T) {
                      setState(() {
                          status=T;
                      });
                    },
                    isExpanded: true,
                    iconSize: 30.0,
                    elevation: 10,
                    style: new TextStyle(
                      color: Color(0XFF585858),
                    ),
                  ),
                ),
              ],
            ),
            // 更换配件
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text('更换配件：'),
                  new Container(
                    width: 120.0,
                    height: 30.0,
                    child: OutlineDropdownButton(
                      inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text("需要", textAlign: TextAlign.center,),
                          value: "需要",
                        ),
                        DropdownMenuItem(
                          child: Text("不需要", textAlign: TextAlign.center,),
                          value: "不需要",
                        ),
                      ],
                      hint: Text("更换配件"),
                      value: accessories,
                      onChanged: (T) {
                        setState(() {
                            accessories=T;
                        });
                      },
                      isExpanded: true,
                      iconSize: 30.0,
                      elevation: 10,
                      style: new TextStyle(
                        color: Color(0XFF585858),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 30.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('添加描述：', style: TextStyle(color: Color(0XFF585858),)),
                  new Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    height: 70.0,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      maxLines: 10,
                      decoration: new InputDecoration(
                        hintText: '请添加描述',
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: const Color(0xffe3f2fd),
                      ),
                    ),
                  )
                ],
              )
            ),
            new Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 70.0),
              child: new RaisedButton(
                color: Color(0XFF2288F4),
                child: new Text(
                  '提交报告',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize:16.0
                  ),
                ),
                onPressed: () {
                  print('提交报告');
                },
              ),
            )
          ],
        ),
      ),
      )
    );
  }

  void showPickerDateTime24(BuildContext context) {
    new Picker(
      adapter: new DateTimePickerAdapter(
          type: PickerDateTimeType.kYMDHM,
          isNumberMonth: true,
          yearSuffix: "年",
          monthSuffix: "月",
          daySuffix: "日"
      ),
      // title: new Text("选择日期"),
      onConfirm: (Picker picker, List value) {
        this.setState(() {
          time = formatDate(DateTime.parse(picker.adapter.toString()),[yyyy,'-',mm,'-',dd, ' ',HH,':',nn,':',ss]);
        });
      },
      onSelect: (Picker picker, int index, List<int> selecteds) {
        this.setState(() {
          time = formatDate(DateTime.parse(picker.adapter.toString()),[yyyy,'-',mm,'-',dd, ' ',HH,':',nn,':',ss]);
        });
      }
    ).show(_scaffoldKey.currentState);
  }

}