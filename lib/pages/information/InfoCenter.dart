import 'dart:ui';
import 'package:flutter/material.dart';
import './Inspection.dart';
import './Report.dart';

class InfoCenter extends StatefulWidget {

  _InfoCenterState createState() => _InfoCenterState();
}

class _InfoCenterState extends State<InfoCenter> with SingleTickerProviderStateMixin{
  List _tabTitles = ['巡检', '报告'];
  
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this,length: _tabTitles.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        new IconButton(icon: new Icon(Icons.arrow_back_ios, color: Colors.white), tooltip: '返回',onPressed: () { Navigator.pop(context); },),
                        new Text('信息中心', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w400)),
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
                  indicatorPadding: EdgeInsets.only(bottom: 5.0),
                  isScrollable: false,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
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
                  new Inspection(),
                  new Report()
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