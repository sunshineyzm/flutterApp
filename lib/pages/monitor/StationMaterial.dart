import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scet_warn/model/MaterialData.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StationMaterial extends StatefulWidget {
  final int stId;
  StationMaterial({Key key, this.stId}):super(key: key);

  _StationMaterial createState() => _StationMaterial();
}

class _StationMaterial extends State<StationMaterial> {
  
  var bgColor;

  var showCharts = false;

  @override
  Widget build(BuildContext context) {
    print(widget.stId);
    return new Scaffold(
      body: new Container(
        child: showCharts == true ? _materialCharts(context) : GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2.0,
          padding: EdgeInsets.all(5.0),
          children: allMaterialDatas.map((MaterialData materialData) {
            return _getGridViewItemUI(context, materialData);
          }).toList(),
        )
      ),
    );
  }

  Widget _materialCharts(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: new Card(
        elevation: 10.0,
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 名称
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.assignment_late, color: Color(0XFF2089F6),),
                      new Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: new Text('氨气', style: TextStyle(color: Color(0XFF222222), fontSize: 18.0, fontWeight: FontWeight.bold),),
                      ),
                      new Text('2019-03-21 17:42', style: TextStyle(color: Color(0XFF999999),fontSize: 12.0),)
                    ],
                  ),
                  new IconButton(onPressed: (){ setState(() { showCharts = false;}); }, icon: Icon(Icons.cancel, size: 24.0, color: Color(0XFF7E69F0),),)
                ],
              ),
              new Divider(color: Color(0XFFD8D8D8),),
              // 详情
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // ----1----
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(text: '最高浓度：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                            children: <TextSpan>[
                              TextSpan(text: '20.351mg/m³', style: TextStyle(color: Color(0XFF2089F6), fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ), 
                      ),
                      new Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(text: '阈值：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                            children: <TextSpan>[
                              TextSpan(text: '正常', style: TextStyle(color: Color(0XFF2089F6), fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ), 
                      ),
                    ]
                  ),
                  // ----2----
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          flex: 1,
                          child: Text.rich(
                            TextSpan(text: 'cas：',
                              style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                              children: <TextSpan>[
                                TextSpan(text: '7664-41-7', style: TextStyle(color: Color(0XFF2089F6), fontSize:14.0, fontWeight: FontWeight.w400))
                              ],
                            ),
                          ), 
                        ),
                        new Expanded(
                          flex: 1,
                          child: Text.rich(
                            TextSpan(text: '化学式：',
                              style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                              children: <TextSpan>[
                                TextSpan(text: 'NH3', style: TextStyle(color: Color(0XFF2089F6), fontSize:14.0, fontWeight: FontWeight.w400))
                              ],
                            ),
                          ), 
                        ),
                      ]
                    ),
                  ),
                  // ----3----
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(text: '英文名称：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                            children: <TextSpan>[
                              TextSpan(text: 'Ammonia', style: TextStyle(color: Color(0XFF2089F6), fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ), 
                      ),
                      new Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(text: '监测仪器：',
                            style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                            children: <TextSpan>[
                              TextSpan(text: 'FTIR', style: TextStyle(color: Color(0XFF2089F6), fontSize:14.0, fontWeight: FontWeight.w400))
                            ],
                          ),
                        ), 
                      ),
                    ]
                  ),
                  // 描述
                  new Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text.rich(
                      TextSpan(text: '描述：',
                        style: TextStyle(fontSize:12.0, color: Color(0XFF999999)),
                        children: <TextSpan>[
                          TextSpan(text: '无色、气体、有强烈的刺激气味', style: TextStyle(color: Color(0XFF2089F6), fontSize:14.0, fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // 视图
              new Expanded(
                child: new charts.TimeSeriesChart(
                  _createSampleData(),
                  animate: false,
                  // primaryMeasureAxis: new charts.NumericAxisSpec(tickFormatterSpec: simpleCurrencyFormatter),
                  domainAxis: new charts.DateTimeAxisSpec(
                    tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
                      day: new charts.TimeFormatterSpec(
                        format: 'd', transitionFormat: 'MM/dd'
                      )
                    )
                  )
                ),
              )
            ],
          ),
        )
      )
    );
  }

  static List<charts.Series<MyRow, DateTime>> _createSampleData() {
    final data = [
      new MyRow(new DateTime(2017, 9, 25), 6),
      new MyRow(new DateTime(2017, 9, 26), 8),
      new MyRow(new DateTime(2017, 9, 27), 6),
      new MyRow(new DateTime(2017, 9, 28), 9),
      new MyRow(new DateTime(2017, 9, 29), 11),
      new MyRow(new DateTime(2017, 9, 30), 15),
      new MyRow(new DateTime(2017, 10, 01), 25),
      new MyRow(new DateTime(2017, 10, 02), 33),
      new MyRow(new DateTime(2017, 10, 03), 27),
      new MyRow(new DateTime(2017, 10, 04), 31),
      new MyRow(new DateTime(2017, 10, 05), 23),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'Cost',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.cost,
        data: data,
      )
    ];
  }

  void colorSelest(int level) {
    switch(level) {
      case 0: bgColor = [Color(0x8A000000), Color(0x73000000)];break; 
      case 1: bgColor = [Color(0XFFF6C12D), Color(0XFFEBD510)];break; 
      case 2: bgColor = [Color(0XFFFF8235), Color(0XFFFDA83E)];break; 
      case 3: bgColor = [Color(0XFFFD463A), Color(0XFFFD6051)];break; 
    }
  }

  Widget _getGridViewItemUI(BuildContext context, MaterialData materialData) {
    // 选择颜色
    colorSelest(materialData.warnLevel);
    return InkWell(
      onTap: () {
        setState(() {
         showCharts = true; 
        });
      },
      child: new Card(
        child: new Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(new Radius.circular(4.0)),
            gradient: LinearGradient(
              colors: bgColor, 
              begin: Alignment.centerLeft, 
              end: Alignment.centerRight,
              stops: [0.1, 1.0]
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                '${materialData.monName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
              new Divider(height: 2.0,color: Colors.white),
              new Text.rich(
                TextSpan(text: '浓度：',
                  style: TextStyle(fontSize:10.0, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(text: '${materialData.value}mg/m³', style: TextStyle(fontSize:12.0))
                  ],
                ),
              ),
              new Text.rich(
                TextSpan(text: '时间：',
                  style: TextStyle(fontSize:10.0, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(text: '${materialData.monitorTime}', style: TextStyle(fontSize:12.0))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyRow {
  final DateTime timeStamp;
  final int cost;
  MyRow(this.timeStamp, this.cost);
}