import 'package:flutter/material.dart';

class StationEquipment extends StatefulWidget {
  _StationEquipment createState() => _StationEquipment();
}

class _StationEquipment extends State<StationEquipment> {

  var bgColor;

  void colorSelect(int index) {
    if(index % 2 == 0) {
      bgColor = [Color(0XFF3892F6), Color(0XFF9759EE)];  //蓝紫
    } else if (index % 3 == 0){
      bgColor = [Color(0XFF1C80FD), Color(0XFF01CAEE)]; // 蓝
    } else {
      bgColor = [Color(0XFFFD473B), Color(0XFFFD5F50)]; //红色
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            colorSelect(index + 1); //颜色选择
            return new InkWell(
              onTap: (){ print('设备'); },
              child: new Card(
                elevation: 5.0,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),  //设置圆角
                margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
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
                      new Text('N6000-5 VOC在线分析仪',style: new TextStyle(color: Colors.white,)),
                      new Divider( color: Colors.white), 
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(flex: 1, child: new Text('FID', style: new TextStyle(color: Colors.white)),),
                          new Expanded(flex: 2, child: new Text('设备运行：异常', style: new TextStyle(color: Colors.white)),),
                        ]
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(flex: 1, child: new Text('监测设备',style: new TextStyle(color: Colors.white)),),
                          new Expanded(flex: 2, child: new Text('出场编号：V2013/1128-2',style: new TextStyle(color: Colors.white)),),
                        ]
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(flex: 1, child: new Text('2013-11-28',style: new TextStyle(color: Colors.white)),),
                          new Expanded(flex: 2, child: new Text('制造商：广州UA制造有限公司',style: new TextStyle(color: Colors.white)),),
                        ]
                      )
                    ]
                  )
                )
              )
            );
          },
        ),
      ),
    );
  }
}