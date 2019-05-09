import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:flutter_picker/flutter_picker.dart';

class InspectionForm extends StatefulWidget {

  _InspectionFormState createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  String address, equipment, status, person, number;

  String time = '选择时间';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(
          '发布巡检', 
          style: new TextStyle(
            color: Colors.white
          )
        ),
        elevation: 4.0,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.white),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.chat),
            tooltip: '聊天',
            onPressed: () {}
          ),
        ]
      ),
      body: new Container(
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 30.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 巡检位置
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text('巡检位置：'),
                    new Container(
                      height: 30.0,
                      width: MediaQuery.of(context).size.width - 100,
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
                            child: Text("南沙-沙螺湾子站-F监测点", textAlign: TextAlign.center,),
                            value: "南沙-沙螺湾子站-F监测点",
                          ),
                        ],
                        hint: Text("请选择巡检位置"),
                        value: address,
                        onChanged: (T) {
                          setState(() {
                              address = T;
                          });
                        },
                        isExpanded: true,
                        iconSize: 30.0,
                        elevation: 10,
                        style: new TextStyle(
                          color: Color(0XFF999999),
                        ),
                      ),
                    ),
                  ],
                ),
                // 巡检时间
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text('巡检时间：'),
                      new Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width - 110,
                        child: OutlineButton(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          textColor: Color(0XFF000000),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text('$time', style: TextStyle(color: Color(0XFF999999)),),
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
                      ),
                    ],
                  ),
                ),
                // 设备信息
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text('设备信息：'),
                    new Container(
                      height: 30.0,
                      width: MediaQuery.of(context).size.width - 100,
                      child: OutlineDropdownButton(
                        inputDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text("N600-5 VOC在线分析仪", textAlign: TextAlign.center,),
                            value: "N600-5 VOC在线分析仪",
                          ),
                          DropdownMenuItem(
                            child: Text("N600-6 VOC在线分析仪", textAlign: TextAlign.center,),
                            value: "N600-6 VOC在线分析仪",
                          ),
                        ],
                        hint: Text("请选择仪器"),
                        value: equipment,
                        onChanged: (T) {
                          setState(() {
                              equipment = T;
                          });
                        },
                        isExpanded: true,
                        iconSize: 30.0,
                        elevation: 10,
                        style: new TextStyle(
                          color: Color(0XFF999999),
                        ),
                      ),
                    ),
                  ],
                ),
                // 设备状态
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text('设备状态：'),
                      new Container(
                        height: 30.0,
                        width: 150.0,
                        child: OutlineDropdownButton(
                          inputDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text("正常", textAlign: TextAlign.center,),
                              value: "正常",
                            ),
                            DropdownMenuItem(
                              child: Text("关闭", textAlign: TextAlign.center,),
                              value: "关闭",
                            ),
                          ],
                          hint: Text("请选择设备状态"),
                          value: status,
                          onChanged: (T) {
                            setState(() {
                                status = T;
                            });
                          },
                          isExpanded: true,
                          iconSize: 30.0,
                          elevation: 10,
                          style: new TextStyle(
                            color: Color(0XFF999999),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 人员
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text('巡检人员：'),
                    new Container(
                      height: 30.0,
                      width: 150.0,
                      child: OutlineDropdownButton(
                        inputDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text("张三", textAlign: TextAlign.center,),
                            value: "张三",
                          ),
                          DropdownMenuItem(
                            child: Text("欧阳娜娜", textAlign: TextAlign.center,),
                            value: "欧阳娜娜",
                          ),
                        ],
                        hint: Text("请选择巡检人员"),
                        value: person,
                        onChanged: (T) {
                          setState(() {
                              person = T;
                          });
                        },
                        isExpanded: true,
                        iconSize: 30.0,
                        elevation: 10,
                        style: new TextStyle(
                          color: Color(0XFF999999),
                        ),
                      ),
                    ),
                  ],
                ),
                // 编号
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text('技术编号：'),
                      new Container(
                        height: 30.0,
                        width: 150.0,
                        child: OutlineDropdownButton(
                          inputDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text("Y0142121", textAlign: TextAlign.center,),
                              value: "Y0142121",
                            ),
                            DropdownMenuItem(
                              child: Text("J081212", textAlign: TextAlign.center,),
                              value: "J081212",
                            ),
                          ],
                          hint: Text("请选择技术编号"),
                          value: number,
                          onChanged: (T) {
                            setState(() {
                                number = T;
                            });
                          },
                          isExpanded: true,
                          iconSize: 30.0,
                          elevation: 10,
                          style: new TextStyle(
                            color: Color(0XFF999999),
                          ),
                        ),
                      ),
                    ],
                  ),  
                ),
              ],
            ),
            // 提交
            new Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: new RaisedButton(
                onPressed: (){ Navigator.pop(context); },
                color: Color(0XFF2089F6),
                padding: EdgeInsets.all(0.0),
                child: new Text('发布巡检', style:TextStyle(color:Color(0XFFFFFFFF))),
              ),
            ),
          ],
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
          time = picker.adapter.toString();
        });
      },
      onSelect: (Picker picker, int index, List<int> selecteds) {
        this.setState(() {
          time = picker.adapter.toString();
        });
      }
    ).show(_scaffoldKey.currentState);
  }

}