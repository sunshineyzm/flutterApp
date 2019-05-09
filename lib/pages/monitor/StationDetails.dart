import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scet_warn/pages/monitor/StationMaterial.dart';
import 'package:scet_warn/pages/monitor/StationEquipment.dart';
import 'package:scet_warn/pages/monitor/StationData.dart';
import 'package:scet_warn/pages/monitor/StationReport.dart';
import 'package:scet_warn/config/Http.dart';
import 'package:scet_warn/config/Api.dart';

class StationDetails extends StatefulWidget {
  final String stId;
  final String title;
  StationDetails(this.stId, this.title);
  
  _StationDetails createState() => _StationDetails();
}

class _StationDetails extends State<StationDetails> with SingleTickerProviderStateMixin {

  List _tabTitles = ['物质', '设备', '数据', '上报'];

  TabController _tabController;

  List allMateriL = [];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this,length: _tabTitles.length);
    _getAllMaterial();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _getAllMaterial() {
    Http.get(Api.AllStationMaterial).then((result) {
      setState(() {
        print(result);
        allMateriL = result;
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
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Image.asset(
                    'lib/assets/images/StationDetails_bg.png',
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
                        new IconButton(icon: new Icon(Icons.arrow_back_ios, color: Colors.white), tooltip: '返回',onPressed: (){ Navigator.pop(context); },),
                        new Text('沧州-${widget.title}', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w400)),
                        new IconButton(icon: new Icon(Icons.chat, color: Colors.white), tooltip: '聊天',onPressed: null,),
                      ]
                    ),
                  ),
                ),
              ]
            ),
            // tab栏目内容
            new Container(
              height: 34.0,
              color: Colors.grey[100],
              child: new DefaultTabController(
                length: _tabTitles.length,
                child: new TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: false,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  indicatorPadding: EdgeInsets.only(bottom: 5.0),
                  tabs: _tabTitles.map((item) {
                    return new Tab(text: item);
                  }).toList()
                ),
              ),
            ),
            new Expanded(
              child: new TabBarView(
                controller: _tabController,
                children: <Widget>[
                  new StationMaterial(),
                  new StationEquipment(),
                  new StationData(),
                  new StationReport()
                ] 
              ),
            )
          ]
        ),
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
