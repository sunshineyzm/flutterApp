import 'package:flutter/material.dart';
import 'stationdata/Incident.dart';
import 'stationdata/Maintain.dart';
import 'stationdata/Monitor.dart';

class StationData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StationData();
  }
}
class _StationData extends State<StationData> with SingleTickerProviderStateMixin{

  List _tabTitles = ['监测记录', '维修记录', '事件记录'];
  
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
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              height: 30.0,
              decoration: BoxDecoration(
                border: new Border.all(color: Colors.black, width: 0.2,),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: new DefaultTabController(
                length: _tabTitles.length,
                child: new TabBar(
                  controller: _tabController,
                  indicator: new ShapeDecoration(shape: new Border.all(color: Color(0XFF2089F6), width: 2.0)),
                  indicatorSize: TabBarIndicatorSize.tab,
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
                  new Monitor(),
                  new Maintain(),
                  new Incident()
                ] 
              ),
            )
          ],
        ),
      ),
    );
  }
}
