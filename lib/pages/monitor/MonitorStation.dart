import 'dart:ui';
import 'dart:core';
import 'package:scet_warn/model/Stations.dart';
import 'package:flutter/material.dart';
import 'package:scet_warn/routers/Application.dart';
import 'package:scet_warn/config/Http.dart';
import 'package:scet_warn/config/Api.dart';

class MonitorStation extends StatefulWidget {
  _MonitorStation createState() => _MonitorStation();
}

class _MonitorStation extends State<MonitorStation> {
  
  List weatherInfo = [];
  
  @override
  void initState() {
    super.initState();
    _getAllWeather();
  }

  void _getAllWeather() {
    Http.get(Api.WeatherData).then((result) {
      setState(() {
       weatherInfo = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 230.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Image.asset(
                    'lib/assets/images/monitorStation_bg.png',
                    fit: BoxFit.cover,
                  )
                ),
                // 标题栏
                new Positioned(
                  top: MediaQueryData.fromWindow(window).padding.top + 5.0,  //状态栏高度
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0), 
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: <Widget>[
                        new IconButton(icon: new Icon(Icons.arrow_back_ios, color: Colors.white), tooltip: '警情中心',onPressed: (){ Navigator.of(context); },),
                        new Text('监测站点', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w400)),
                        new IconButton(icon: new Icon(Icons.chat, color: Colors.white), tooltip: '聊天',onPressed:() {},)
                      ]
                    ),
                  ),
                ),
                new Positioned(
                  bottom: 0,
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0), 
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: <Widget>[
                        new Text(''),
                        new Text('共有${weatherInfo.length}个监测站', style: new TextStyle(color: Colors.blue)),
                        new Icon(Icons.search, color: Colors.blue)
                      ]
                    )
                  )
                )
              ]
            ),
            // // 站点名称
            new Expanded(
              child: new Container(
                color: Color(0xFFEEEEEE),
                child: new ListView.builder(
                  padding: const EdgeInsets.only(top: 10.0),
                  itemCount: weatherInfo.length,
                  itemBuilder: (context, index) {
                    return new InkWell( 
                      child: new Card(
                        elevation: 5.0,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),  //设置圆角
                        margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0), ),
                                gradient: LinearGradient(
                                  colors: stations[index].warnNumber > 0 ? [Color(0XFFFF8034), Color(0XFFFDA93F)] : [Color(0XFFFFFFFF), Color(0XFFFFFFFF)], 
                                  begin: FractionalOffset(0, 1), 
                                  end: FractionalOffset(1, 0)
                                ),
                              ),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center, 
                                children: <Widget>[
                                  stations[index].warnNumber > 0 ? new Text('今日预警', style: new TextStyle(color: Colors.white)) : new Text('今日预警', style: new TextStyle(color: Color(0XFF999999))),
                                  stations[index].warnNumber > 0 ? new Text('${stations[index].warnNumber}', style: new TextStyle(color: Colors.white, fontSize:20.0, fontWeight: FontWeight.w600)) : new Text('${stations[index].warnNumber}', style: new TextStyle(color: Color(0XFF2089F6), fontSize:20.0, fontWeight: FontWeight.w600)),
                                ]
                              )
                            ), 
                            new Expanded(
                              child: new Container(
                                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center, 
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center, 
                                      children: <Widget>[
                                        new Text('沧州—${weatherInfo[index]['stName']}', style: new TextStyle(color: Colors.black)),
                                        new Text('${stations[index].status}', style: new TextStyle(color: Colors.grey))
                                      ]
                                    ),
                                    new Divider(),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center, 
                                      children: <Widget>[
                                        new Text.rich(
                                          TextSpan(text: '温度：',
                                            style: TextStyle(fontSize:12.0),
                                            children: <TextSpan>[
                                              TextSpan(text: '${weatherInfo[index]['temperature'].toStringAsFixed(1)}℃', style: TextStyle(fontSize:13.0, fontWeight: FontWeight.w500))
                                            ],
                                          ),
                                        ),
                                        new Text.rich(
                                          TextSpan(text: '风向：',
                                            style: TextStyle(fontSize:12.0),
                                            children: <TextSpan>[
                                              TextSpan(text: '${weatherInfo[index]['wdExplain']}', style: TextStyle(fontSize:13.0, fontWeight: FontWeight.w500))
                                            ],
                                          ),
                                        ),
                                        new Text.rich(
                                          TextSpan(text: '风速：',
                                            style: TextStyle(fontSize:12.0),
                                            children: <TextSpan>[
                                              TextSpan(text: '${weatherInfo[index]['windSpeed'].toStringAsFixed(1)}m/s', style: TextStyle(fontSize:13.0, fontWeight: FontWeight.w500))
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
                      onTap: () {
                        Application.router.navigateTo(context, "/monitor/station?stId=${weatherInfo[index]['stId']}&title=${Uri.encodeComponent(weatherInfo[index]['stName'])}");
                      }
                    );
                  },
                )
              )
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pop(context)
        },
        child: new Icon(Icons.arrow_back),
      ),
    );
  }
}